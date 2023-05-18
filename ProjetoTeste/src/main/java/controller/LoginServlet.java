package controller;

import java.io.IOException;

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
            response.sendRedirect("dadosuser.jsp");
        } else {
            // login inalido
            response.sendRedirect("login.jsp?error=1");
        }
    }

    private boolean isValidCredentials(String username, String password) {
        // TODO logica de autenticação
        return username.equals("admin") && password.equals("password");
    }
}