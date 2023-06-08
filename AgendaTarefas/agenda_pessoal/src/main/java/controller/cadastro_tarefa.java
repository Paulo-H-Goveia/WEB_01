package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO;
import model.tarefas;

 
@WebServlet("/cadastro_tarefa")
public class cadastro_tarefa extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	DAO dao = new DAO();
	tarefas tarefa = new tarefas(null,null, null, null, null, null);

    public cadastro_tarefa() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		tarefa.setTitulo(request.getParameter("titulo"));
		tarefa.setDescricao(request.getParameter("descricao"));
		tarefa.setDataCriacao(request.getParameter("dataCriacao"));
		tarefa.setDataConclusao(request.getParameter("dataConclusao"));
		tarefa.setStatus(request.getParameter("status"));
        
        dao.inserir_tarefa(tarefa);
        response.sendRedirect("http://localhost:8080/agenda_pessoal/listar_tarefas");
	}

}
