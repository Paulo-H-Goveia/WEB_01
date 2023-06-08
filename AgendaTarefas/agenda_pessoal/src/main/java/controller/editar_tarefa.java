package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.tarefas;
import model.DAO;


@WebServlet("/editar_tarefa")
public class editar_tarefa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    DAO dao = new DAO();
	
    public editar_tarefa() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String id = request.getParameter("id");
    	
    	ArrayList<tarefas> lista = dao.editar_tarefas(id);
        request.setAttribute("editarTarefa", lista);

        for (int i = 0; i < lista.size(); i++){
            tarefas tarefa = lista.get(i);
        }

        request.getRequestDispatcher("/editar_tarefa.jsp").forward(request, response);
    }

}
