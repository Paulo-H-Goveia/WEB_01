package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;
import model.tarefas;

@WebServlet("/excluir_tarefa")
public class excluir_tarefa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	DAO dao = new DAO();
	tarefas tarefa = new tarefas(null,null, null, null, null, null);
	
    public excluir_tarefa() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("doGET ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("doPOST ").append(request.getContextPath());
        dao.excluir_tarefa(request.getParameter("id"));
        response.sendRedirect("http://localhost:8080/agenda_pessoal/listar_tarefas");
	}

}
