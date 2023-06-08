package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO;
import model.tarefas;

@WebServlet("/listar_tarefas")
public class listar_tarefas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	DAO dao = new DAO();
    
    public listar_tarefas() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<tarefas> lista = dao.listar_tarefas();
        request.setAttribute("listaTarefas", lista);

        for (int i = 0; i < lista.size(); i++){
            tarefas tarefa = lista.get(i);
        }

        request.getRequestDispatcher("/listar_tarefas.jsp").forward(request, response);
    }


}
