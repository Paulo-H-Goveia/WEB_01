<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Criar Tarefa</title>
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
      width: 97%;
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
    
    .form-group select {
      width: 100%;
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 3px;
      height: 30px; /* Defina a altura desejada */
    }
    
    .btn_voltar {
      width: 100%;
      padding: 20px;
      border: none;
      border-radius: 3px;
      background-color: blue;
      color: #fff;
      cursor: pointer;
      text-align: center;
      height: 25px;
    }
    
  </style>
</head>
<body>
  <div class="container">
    <h2>Criar Tarefa</h2>
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
        <input value="Voltar" onclick="window.history.back()" class="btn_voltar">
      </div>
    </form>
  </div>
</body>
</html>