package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.tarefas;
import model.DAO;

@WebServlet("/update_tarefa")
public class update_tarefa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    tarefas tarefa = new tarefas(null,null,null,null,null,null);
    DAO dao = new DAO();
	
    public update_tarefa() {
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
		String id = request.getParameter("id");
		tarefa.setTitulo(request.getParameter("titulo"));
		tarefa.setDescricao(request.getParameter("descricao"));
		tarefa.setDataCriacao(request.getParameter("dataCriacao"));
		tarefa.setDataConclusao(request.getParameter("dataConclusao"));
		tarefa.setStatus(request.getParameter("status"));
        
        dao.update_tarefa(tarefa, id+"");
        response.sendRedirect("http://localhost:8080/agenda_pessoal/listar_tarefas");
	}

}
