package controller;

import java.io.IOException;

import dao.LoginDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
		dispatcher.forward(request, response);}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String username = request.getParameter("username");
        String password = request.getParameter("password");


        if (isValidCredentials(username, password)) {
            //login ok
            request.getSession().setAttribute("username", username);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/dadosuser.jsp");
    		dispatcher.forward(request, response);
            
        } else {
            // login invalido
        	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/login.jsp?error=1");
    		dispatcher.forward(request, response);
            
        }
    }

    private boolean isValidCredentials(String username, String password) {
        // TODO logica de autenticação
    	LoginDAO logindao = new LoginDAO();
    	boolean rs = false;
		try {
			rs = logindao.autenticaUser(username, password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return rs;
    }
}