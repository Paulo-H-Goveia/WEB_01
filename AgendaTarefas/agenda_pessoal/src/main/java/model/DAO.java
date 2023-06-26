package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

public class DAO {
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://127.0.0.1:3306/dbagenda?useTimezone=true&serverTimezone=UTC";
    private String user = "root";
    private String password = "";
    
    private Connection conectar() {
    	Connection con = null;
    	
    	try{
    		Class.forName(driver);
    		con = DriverManager.getConnection(url, user, password);
    		return con;
    	}catch(Exception e) {
    		System.out.println(e);
    		return null;
    	}
    	
    }
    
    public void testeConexao() {
    	try{
    		Connection con = conectar();
    		System.out.println(con);
    		con.close();
    	}catch(Exception e) {
    		System.out.println(e);
    	}
    }
    
    public int inserir_usuario(HttpServletRequest request, usuarios usuario) {
        int resultado = 0;
        int idUsuarioCadastrado = 0; // id do user cadastrado

        // Verificar se o email ja existe
        try {
            Connection con = conectar();

            String sqlVerificarEmail = "SELECT id FROM usuarios WHERE email = ?";
            PreparedStatement statementVerificarEmail = con.prepareStatement(sqlVerificarEmail);
            statementVerificarEmail.setString(1, usuario.getEmail());
            ResultSet resultSet = statementVerificarEmail.executeQuery();

            if (resultSet.next()) {
                
                resultado = -1;
            } else {
                // O email n cadastrado
                String sqlInserirUsuario = "INSERT INTO usuarios (nome, telefone, email, senha) VALUES (?, ?, ?, ?)";
                PreparedStatement statementInserirUsuario = con.prepareStatement(sqlInserirUsuario);

                String senhaCriptografada = criptografarSenha(usuario.getSenha());

                statementInserirUsuario.setString(1, usuario.getNome());
                statementInserirUsuario.setString(2, usuario.getTelefone());
                statementInserirUsuario.setString(3, usuario.getEmail());
                statementInserirUsuario.setString(4, senhaCriptografada);
                int linhasInseridas = statementInserirUsuario.executeUpdate();

                if (linhasInseridas > 0) {
                    System.out.println("Usu�rio adicionado com sucesso");

                    // id do user cadastrado
                    String sqlId = "SELECT LAST_INSERT_ID()";
                    PreparedStatement statementId = con.prepareStatement(sqlId);
                    ResultSet resultSetId = statementId.executeQuery();
                    if (resultSetId.next()) {
                        idUsuarioCadastrado = resultSetId.getInt(1);
                    }
                    statementId.close();
                }

                statementInserirUsuario.close();
            }

            statementVerificarEmail.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (resultado == 0 && idUsuarioCadastrado > 0) {
            HttpSession session = request.getSession(true);
            session.setAttribute("usuario_logado", idUsuarioCadastrado);
        }

        return resultado;
    }


    
    
    public void inserir_tarefa(HttpServletRequest request, tarefas tarefa) {

        // Inserir os dados no bd
        try {

        	HttpSession session = request.getSession();
            int id = Integer.parseInt(session.getAttribute("usuario_logado").toString());
        	Connection con = conectar();
        	
            String sql = "INSERT INTO tarefas (titulo, descricao, data_criacao, data_conclusao, status, id_usuario) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, tarefa.getTitulo() );
            statement.setString(2, tarefa.getDescricao());
            statement.setString(3, tarefa.getDataCriacao());
            statement.setString(4, tarefa.getDataConclusao());
            statement.setString(5, tarefa.getStatus());
            statement.setInt(6, id);
            int linhasInseridas = statement.executeUpdate();
            if (linhasInseridas > 0) {
                System.out.println("Tarefa adicionada com sucesso");
            }
            statement.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
    
    
    public ArrayList<tarefas> listar_tarefas(int id_logado) {
        ArrayList<tarefas> tarefas = new ArrayList<>();
        String sql = "SELECT * FROM tarefas";
        
        try {
            Connection con = conectar();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
            	int id = resultSet.getInt(1);
                String titulo = resultSet.getString(2);
                String descricao = resultSet.getString(3);
                String dataCriacao = resultSet.getString(4);
                String dataConclusao = resultSet.getString(5);
                String status = resultSet.getString(6);
            	if(id_logado == resultSet.getInt(7)) {
                    tarefas.add( new tarefas("" + id, titulo, descricao, dataCriacao, dataConclusao, status));
            	}
            }
            
            con.close();
            return tarefas;
            
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }

    }
    
    
    public void excluir_tarefa(String id) {

        // Deletar os dados no bd
        try {
            
        	Connection con = conectar();
        	
            String sql = "DELETE FROM tarefas WHERE id = " + id;
            PreparedStatement statement = con.prepareStatement(sql);
           
            int linhasExcluidas = statement.executeUpdate();
            if (linhasExcluidas > 0) {
                System.out.println("Tarefa exclu�da com sucesso");
            }
            statement.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
    
    
    public ArrayList<tarefas> editar_tarefas(String id) {
        ArrayList<tarefas> tarefas = new ArrayList<>();
        String sql = "SELECT * FROM tarefas WHERE id = "+id;
        
        try {
            Connection con = conectar();
            PreparedStatement statement = con.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            
            while (resultSet.next()) {
            	
            	int id_tarefa = resultSet.getInt(1);
                String titulo = resultSet.getString(2);
                String descricao = resultSet.getString(3);
                String dataCriacao = resultSet.getString(4);
                String dataConclusao = resultSet.getString(5);
                String status = resultSet.getString(6);
                
                if(id.equals(id_tarefa+"")) {
                      tarefas.add( new tarefas("" + id_tarefa, titulo, descricao, dataCriacao, dataConclusao, status));
                }
            }
            
            con.close();
            return tarefas;
            
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }

    }
    
    
    public void update_tarefa(tarefas tarefa, String id) {
        try {
            Connection con = conectar();

            String sql = "UPDATE tarefas SET titulo = ?, descricao = ?, data_criacao = ?, data_conclusao = ?, status = ? WHERE id = ?";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, tarefa.getTitulo());
            statement.setString(2, tarefa.getDescricao());
            statement.setString(3, tarefa.getDataCriacao());
            statement.setString(4, tarefa.getDataConclusao());
            statement.setString(5, tarefa.getStatus());
            statement.setString(6, id);

            int linhasAtualizadas = statement.executeUpdate();
            if (linhasAtualizadas > 0) {
                System.out.println("Tarefa editada com sucesso");
            }

            statement.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    
    public int login(HttpServletRequest request, String usuario, String senha) {
        String sql = "SELECT * FROM usuarios WHERE email = ?";
        int resultado = 0;
        
        try {
            Connection con = conectar();
            PreparedStatement statement = con.prepareStatement(sql);
            
            statement.setString(1, usuario);
            
            ResultSet resultSet = statement.executeQuery();
  
            if (resultSet.next()) {
            	
            	String senha_criptografada = resultSet.getString(5);
                
                if(verificarSenha(senha, senha_criptografada)) {
                	System.out.println("Login realizado com sucesso");
                    resultado = 1;
                    HttpSession session = request.getSession(true);
                    session.setAttribute("usuario_logado", resultSet.getInt(1));
                    session.getAttribute("usuario_logado");
                    System.out.println(session.getAttribute("usuario_logado"));
                }
      
            } else {
                System.out.println("Usu�rio ou senha inv�lidos");
                resultado = 0;
            }
            
            con.close();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
		return resultado;
    }
    
    public static String criptografarSenha(String senha) {
        String senhaCriptografada = BCrypt.gensalt();
        return BCrypt.hashpw(senha, senhaCriptografada);
    }
    
    public static boolean verificarSenha(String senhaDigitada, String senhaCriptografada) {
        return BCrypt.checkpw(senhaDigitada, senhaCriptografada);
    }
 
    
}
