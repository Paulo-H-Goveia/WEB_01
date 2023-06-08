<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.tarefas" %>
<%@ page import="java.util.ArrayList" %>
<% 
ArrayList<tarefas> lista_tarefas = (ArrayList<tarefas>) request.getAttribute("editarTarefa");

response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar tarefa</title>
<style>
    body {
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 97vh;
    }

    .container {
      width: 400px;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #f2f2f2;
      margin: 0 auto;
    }

    h2 {
      text-align: center;
    }

    .form-group {
      margin-bottom: 10px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }

    .form-group input,
    .form-group textarea {
      width: 100%;
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }

    .form-group .btn {
      width: 100%;
      padding: 10px;
      border: none;
      border-radius: 3px;
      background-color: #4CAF50;
      color: #fff;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <% if (lista_tarefas != null) {
              for (tarefas tarefa : lista_tarefas) {
       %>
  <div class="container">
    <h2>Editar Tarefa</h2>
    <form action="update_tarefa" method="post">
    <input type="hidden" id="titulo" name="id" value="<%= tarefa.getId() %>" required>
      <div class="form-group">
        <label for="titulo">Título:</label>
        <input type="text" id="titulo" name="titulo" value="<%= tarefa.getTitulo() %>" required>
      </div>
      <div class="form-group">
        <label for="descricao">Descrição:</label>
        <textarea id="descricao" name="descricao" rows="4" required><%= tarefa.getDescricao() %></textarea>
      </div>
      <div class="form-group">
        <label for="dataCriacao">Data de Criação:</label>
        <input type="date" id="dataCriacao" name="dataCriacao" value="<%= tarefa.getDataCriacao() %>" required>
      </div>
      <div class="form-group">
        <label for="dataConclusao">Data de Conclusão:</label>
        <input type="date" id="dataConclusao" name="dataConclusao" value="<%= tarefa.getDataConclusao() %>" required>
      </div>
      <div class="form-group">
        <label for="status">Status:</label>
        <select id="status" name="status"  required>
          <option value="Pendente" <% if(tarefa.getStatus().toString().equals("Pendente")) { %> selected <% } %>>Pendente</option>
          <option value="Em andamento" <% if(tarefa.getStatus().toString().equals("Em andamento")) { %> selected <% } %>>Em andamento</option>
          <option value="Concluída" <% if(tarefa.getStatus().toString().equals("Concluída")) { %> selected <% } %>>Concluída</option>
        </select>
      </div>
      <div class="form-group">
        <input type="submit" value="Salvar" class="btn">
      </div>
    </form>
  </div>
  <%}} %>
</body>
</html>