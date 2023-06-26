<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
if (session.getAttribute("usuario_logado") != null) {
%>
<!DOCTYPE html>
<html>
<head>
  <title>Nova Tarefa</title>
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
    
    .form-group select {
      width: 100%;
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 3px;
      height: 30px; 
    }
    
    .form-group .btn_voltar {
      widith: 35%;
      padding: 20px;
      border: none;
      border-radius: 3px;
      background-color: blue;
      color: #fff;
      cursor: pointer;
      text-align: center;
      height: 25px;
      font-weight: bolder;
      margin: auto;
      display: flex;
      justify-content: center;
    }
    
    h2 {
      text-align: center;
	  font-weight: bolder;
	  color: #fff;
    }
    
  </style>
</head>
<body>
  <div class="container">
    <h2>Nova Tarefa</h2>
    <form action="cadastro_tarefa" method="post">
      <div class="form-group">
        <label for="titulo">Título:</label>
        <input type="text" id="titulo" name="titulo" required>
      </div>
      <div class="form-group">
        <label for="descricao">Descrição:</label>
        <textarea id="descricao" name="descricao" rows="4" required></textarea>
      </div>
      <div class="form-group">
        <label for="dataCriacao">Data de Criação:</label>
        <input type="date" id="dataCriacao" name="dataCriacao" required>
      </div>
      <div class="form-group">
        <label for="dataConclusao">Data de Conclusão:</label>
        <input type="date" id="dataConclusao" name="dataConclusao" required>
      </div>
      <div class="form-group">
        <label for="status">Status:</label>
        <select id="status" name="status" required>
          <option value="Pendente">Pendente</option>
          <option value="Em andamento">Em andamento</option>
          <option value="Concluída">Concluída</option>
        </select>
      </div>
      <div class="form-group">
        <input type="submit" value="Criar" class="btn">
      </div>
      <div class="form-group">
        <input value="Voltar" onclick="window.history.back()" class="btn">
      </div>
    </form>
  </div>
</body>
</html>

<%
} else {
    
    response.sendRedirect("login.jsp");
}
%>