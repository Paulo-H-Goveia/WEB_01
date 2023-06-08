<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.tarefas" %>
<%@ page import="java.util.ArrayList" %>
<% 
ArrayList<tarefas> lista_tarefas = (ArrayList<tarefas>) request.getAttribute("listaTarefas");
%>

<!DOCTYPE html>
<html>
<head>
  <title>Lista de Tarefas</title>
  <style>
    body {
      font-family: Arial, sans-serif;
    }

    .container {
      max-width: 1000px;
      margin: 0 auto;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    table th, table td {
      padding: 8px;
      border: 1px solid #ccc;
      text-align: center;
    }

    .add-button {
      margin-bottom: 10px;
    }

    .add-button a {
      display: inline-block;
      padding: 8px 12px;
      background-color: #4CAF50;
      color: #fff;
      text-decoration: none;
      border-radius: 3px;
    }

    .action-button {
      display: inline-block;
      padding: 4px 8px;
      background-color: #ccc;
      color: #fff;
      text-decoration: none;
      border-radius: 3px;
    }

    .edit-button {
      background-color: #2196F3;
      color: #fff;
      border: none;
      padding: 5px 10px;
      cursor: pointer;
      border-radius: 3px;
    }

    .delete-button {
      background-color: #ff0000;
      color: #fff;
      border: none;
      padding: 5px 10px;
      cursor: pointer;
      border-radius: 3px;
    }
    
    .alinhar_btn_action{
      display: flex;
      justify-content: space-around;
    }
    
       
  </style>
</head>
<body>
  <div class="container">
    <h2>Lista de Tarefas</h2>
    <div class="add-button">
      <a href="cadastrar_tarefa.jsp">Adicionar</a>
    </div>
    <table>
      <tr>
        <th>ID</th>
        <th>Título</th>
        <th>Descrição</th>
        <th>Data de Criação</th>
        <th>Data de Conclusão</th>
        <th>Status</th>
        <th>Ação</th>
      </tr>
       <% if (lista_tarefas != null) {
              for (tarefas tarefa : lista_tarefas) {
       %>
       <tr>
       <td><%= tarefa.getId() %></td>
        <td><%= tarefa.getTitulo() %></td>
        <td><%= tarefa.getDescricao() %></td>
        <td><%= tarefa.getDataCriacao() %></td>
        <td><%= tarefa.getDataConclusao() %></td>
        <td><%= tarefa.getStatus().equals("ConcluÃ­da") ? "Concluída" : tarefa.getStatus() %></td>
        <td class="alinhar_btn_action">
          <form action="editar_tarefa" method="get">
          <input type="hidden" name="id" value="<%= tarefa.getId() %>">
          <div class="form-group">
               <input type="submit" value="Editar" class="edit-button">
          </div>
          </form>
          <form action="excluir_tarefa" method="post">
          <input type="hidden" name="id" value="<%= tarefa.getId() %>">
          <div class="form-group">
               <input type="submit" value="Excluir" class="delete-button">
          </div>
          </form>
        </td>
      </tr>
       <%
              }
         } else {
       %>
             <p>A lista de tarefas está vazia.</p>
       <%
         }
       %>
    </table>
  </div>
</body>
</html>
