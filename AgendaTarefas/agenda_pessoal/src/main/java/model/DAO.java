package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DAO {
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://127.0.0.1:3306/dbagenda?useTimezone=true&serverTimezone=UTC";
    private String user = "root";
    private String password = "admin123456789";
    
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
    
    public int inserir_usuario(usuarios usuario) {

    	int resultado = 0;
    	
    	// Inserir os dados no banco de dados
        try {
            
        	Connection con1 = conectar();   	
        	
        	String sql1 = "SELECT * FROM usuarios WHERE email = ?";

            PreparedStatement statement1 = con1.prepareStatement(sql1);
                
            statement1.setString(1, usuario.getEmail());
                
            ResultSet resultSet = statement1.executeQuery();
            
            while (resultSet.next()) {
                resultado ++;
            }
        	
            statement1.close();
            con1.close();
            
            System.out.println(resultado);
        	
        	if(resultado == 0) {
        		
        		Connection con = conectar();
        		String sql = "INSERT INTO usuarios (nome,telefone, email, senha) VALUES (?, ?, ?, ?)";
        		PreparedStatement statement = con.prepareStatement(sql);
        		
                statement.setString(1, usuario.getNome() );
                statement.setString(2, usuario.getTelefone());
                statement.setString(3, usuario.getEmail());
                statement.setString(4, usuario.getSenha());
                int linhasInseridas = statement.executeUpdate();
                if (linhasInseridas > 0) {
                    System.out.println("Usuário adicionado com sucesso");
                }
                statement.close();
                con.close();
        		
        	}
        	

        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return resultado;
        
	}
    
    
    public void inserir_tarefa(tarefas tarefa) {

        // Inserir os dados no banco de dados
        try {
            
        	Connection con = conectar();
        	
            String sql = "INSERT INTO tarefas (titulo, descricao, data_criacao, data_conclusao, status) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, tarefa.getTitulo() );
            statement.setString(2, tarefa.getDescricao());
            statement.setString(3, tarefa.getDataCriacao());
            statement.setString(4, tarefa.getDataConclusao());
            statement.setString(5, tarefa.getStatus());
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
    
    
    public ArrayList<tarefas> listar_tarefas() {
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
                
                tarefas.add( new tarefas("" + id, titulo, descricao, dataCriacao, dataConclusao, status));

            }
            
            con.close();
            return tarefas;
            
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }

    }
    
    
    public void excluir_tarefa(String id) {

        // Deletar os dados no banco de dados
        try {
            
        	Connection con = conectar();
        	
            String sql = "DELETE FROM tarefas WHERE id = " + id;
            PreparedStatement statement = con.prepareStatement(sql);
           
            int linhasExcluidas = statement.executeUpdate();
            if (linhasExcluidas > 0) {
                System.out.println("Tarefa excluída com sucesso");
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
            statement.setString(6, id+""); // Definir o valor do ID

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
    
    
    
    public int login(String usuario, String senha) {
        String sql = "SELECT * FROM usuarios WHERE email = ? AND senha = ?";
        int resultado = 0;
        
        try {
            Connection con = conectar();
            PreparedStatement statement = con.prepareStatement(sql);
            
            statement.setString(1, usuario);
            statement.setString(2, senha);
            
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                System.out.println("Login realizado com sucesso");
                resultado = 1;
            } else {
                System.out.println("Usuário ou senha inválidos");
                resultado = 0;
            }
            
            con.close();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
		return resultado;
    }
 
    
}
