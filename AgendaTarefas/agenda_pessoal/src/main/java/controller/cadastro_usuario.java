package controller;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO;
import model.usuarios;

/**
 * Servlet implementation class cadastro_usuario
 */
@WebServlet("/cadastro_usuario")
public class cadastro_usuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	DAO dao = new DAO();
	usuarios usuario = new usuarios(null, null, null, null);
	
    public cadastro_usuario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        usuario.setNome(request.getParameter("nome"));
        usuario.setTelefone(request.getParameter("telefone"));
        usuario.setEmail(request.getParameter("email"));
        usuario.setSenha(request.getParameter("senha"));
        
        if (dao.inserir_usuario(usuario) == 0) {
        	response.sendRedirect("http://localhost:8080/agenda_pessoal/listar_tarefas");
        }else {
        	response.sendRedirect("http://localhost:8080/agenda_pessoal/cadastro.jsp?status=rejected");
        }
        
	}
}
