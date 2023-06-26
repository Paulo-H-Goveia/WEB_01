<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.tarefas" %>
<%@ page import="java.util.ArrayList" %>
<% 
ArrayList<tarefas> lista_tarefas = (ArrayList<tarefas>) request.getAttribute("listaTarefas");
%>
<%
if (session.getAttribute("usuario_logado") != null) {
    
%>
<!DOCTYPE html>
<html>
<head>
    <title>Tarefas</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to bottom, #848484, #585a5b);
            color: #fff;
            background-repeat: no-repeat;
            background-size: cover;
            height: 100vh;
            font-family: 'Open Sans';
            font-weight: bold;
        }

        .container {
            padding: 20px;
        }

        .task-card {
            background: linear-gradient(to bottom, #848484, #585a5b);
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            position: relative;
            margin-bottom: 20px;
            width: 60%;
        }

        .task-card:before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            border-radius: 10px;
            background: linear-gradient(to bottom right, #2c3e50, #3498db);
            opacity: 0.9;
            z-index: -1;
        }

        .task-card h3 {
            color: #fff;
            font-size: 28px;
            margin-top: 0;
        }

        .task-card p {
            color: #fff;
        }

        .task-card p.status {
            margin-bottom: 10px;
        }

        .countdown {
            font-size: 18px;
            font-weight: bold;
            color: #fff;
            position: absolute;
            bottom: 20px;
            right: 20px;
        }

        .empty-list {
            text-align: center;
            font-weight: bold;
            margin-top: 20px;
        }

        .edit-button,
        .delete-button {
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            margin: auto;
      		display: flex;
      		justify-content: center;
        }

        .edit-button {
            background-color: #27ae60;
            color: #fff;
            border: none;
            margin-right: 10px;
        }

        .delete-button {
            background-color: #e74c3c;
            color: #fff;
            border: none;
        }
        
        .add-button{
            padding-bottom: 20px;
        }
        
        h2 {
	      font-weight: bolder;
	      color: #fff;
    	}
        
    </style>
</head>
<body>
    <div class="container">
        <h2>Tarefas</h2>
<div class="add-button">
        <a href="cadastrar_tarefa.jsp" class="btn btn-primary">Adicionar Tarefa</a>
    </div>
        <% if (lista_tarefas != null && !lista_tarefas.isEmpty()) { %>
            <% for (tarefas tarefa : lista_tarefas) { %>
                <div class="task-card">
                    <h3><%= tarefa.getTitulo() %></h3>
                    <p><%= tarefa.getDescricao() %></p>
                    <p class="status">Status: <%= tarefa.getStatus().equals("Concluída") ? "Concluída" : tarefa.getStatus() %></p>

                    <% if (tarefa.getStatus().equals("Concluída")) { %>
                        <p>Tarefa concluída.</p>
                    <% } %>
                   
                    <div class="btn-group" role="group">
                        <form action="editar_tarefa" method="get">
                            <input type="hidden" name="id" value="<%= tarefa.getId() %>">
                            <button type="submit" class="btn btn-primary edit-button">Editar</button>
                        </form>
                        <form action="excluir_tarefa" method="post">
                            <input type="hidden" name="id" value="<%= tarefa.getId() %>">
                            <button type="submit" class="btn btn-danger delete-button">Excluir</button>
                        </form>
                    </div>
                </div>
            <% } %>
        <% } else { %>
            <p class="empty-list">A lista de eventos está vazia.</p>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


<%
} else {
   
    response.sendRedirect("login.jsp");
}
%>
