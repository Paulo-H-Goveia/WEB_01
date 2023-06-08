<!DOCTYPE html>
<html>
<head>
  <title>Página de Cadastro</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 97vh;
    }

    .container {
      width: 300px;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #f2f2f2;
    }
    
    a{
      text-decoration: none;
      color: blue;
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

    .form-group input {
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
    
    .btn_voltar {
      width: 94%;
      padding: 10px;
      border: none;
      border-radius: 3px;
      background-color: blue;
      color: #fff;
      cursor: pointer;
      height: 15px;
    }
    
    label{
      font-family: Arial, sans-serif;
    }
    
        .register-link {
      text-align: center;
      margin-top: 10px;
    }

    .error-popup {
      position: absolute;
      margin-top: 460px;
      left: 50%;
      transform: translate(-50%, -50%);
      width: 100%;
      max-width: 300px; /* Defina a largura máxima desejada */
      background-color: #ffffff;
      border: 1px solid #cccccc;
      padding: 10px 20px 10px 20px;
      text-align: center;
      background-color: red;
      color: white;
    }
    
    .custom-div {
      width: 300px;
      margin: 0 auto;
      background-color: #f1f1f1; /* cor de fundo desejada */
    }
    
  </style>
  <script>
    function redirectToCadastro() {
      window.location.href = "http://localhost:8080/agenda_pessoal/login.jsp";
    }
    
    window.addEventListener('DOMContentLoaded', function() {
        var urlParams = new URLSearchParams(window.location.search);
        var status = urlParams.get('status');
        
        if (status === 'rejected') {
          var errorPopup = document.getElementById('error-popup');
          errorPopup.style.display = 'block';
        }else{
      	 var errorPopup = document.getElementById('error-popup');
           errorPopup.style.display = 'none';
        }
      });
    
  </script>
</head>
<body>
  <div class="container">
    <h2>Cadastro</h2>
    <form action="cadastro_usuario" method="post">
      <div class="form-group">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required>
      </div>
      <div class="form-group">
        <label for="telefone">Telefone:</label>
        <input type="text" id="telefone" name="telefone" required>
      </div>
      <div class="form-group">
        <label for="email">E-mail:</label>
        <input type="email" id="email" name="email" required>
      </div>
      <div class="form-group">
        <label for="senha">Senha:</label>
        <input type="password" id="senha" name="senha" required>
      </div>
      <div class="form-group">
        <input type="submit" value="Cadastrar" class="btn">
      </div>
      <div style="text-align: center;"><span>Já tem uma conta ? </span><a href="http://localhost:8080/agenda_pessoal/login.jsp">Faça login aqui</a></div>
    </form>
  </div>
  <div class="error-popup" id="error-popup">O endereço de email já está em uso</div>
</body>
</html>
