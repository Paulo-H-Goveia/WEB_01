<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.tarefas" %>
<%@ page import="java.util.ArrayList" %>
<% 
ArrayList<tarefas> lista_tarefas = (ArrayList<tarefas>) request.getAttribute("editarTarefa");

response.setCharacterEncoding("UTF-8");
%>
<%
if (session.getAttribute("usuario_logado") != null) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar tarefa</title>
<style>
     body {
      font-family: 'Open Sans';
      display: flex;
      justify-content: center;
      align-items: center;
      height: 97vh;
      background: linear-gradient(to bottom, #848484, #585a5b);
    }

    .container {
      width: 60%;
      padding: 20px;
      border: 1px solid #000000;
      border-radius: 5px;
      background: linear-gradient(to bottom, #848484, #585a5b);
      margin: 0 auto;
    }

    h2 {
      text-align: center;
	  font-weight: bolder;
	  color: #fff;
    }
    
    .form-group {
      margin-bottom: 10px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
      color: white;
    }

    .form-group input,
    .form-group textarea {
      width: 100%;
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }

    .form-group .btn {
      width: 100px;
      padding: 10px;
      border: none;
      border-radius: 3px;
      background-color: blue;
      color: #fff;
      cursor: pointer;
      font-weight: bolder;
      margin: auto;
      display: flex;
      justify-content: center;
      text-align: center;
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
<%
} else {
    response.sendRedirect("login.jsp");
}
%>