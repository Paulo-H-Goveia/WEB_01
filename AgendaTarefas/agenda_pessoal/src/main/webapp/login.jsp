<!DOCTYPE html>
<html>
<head>
  <title>Página de Login</title>
 <style>
    body {
      font-family: Arial, sans-serif;
      justify-content: center;
      align-items: center;
      height: 97vh;
      display:flex;
    }
    
    a{
      text-decoration: none;
      color: blue;
    }

    .container {
      width: 300px;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
      background-color: #f2f2f2;
      
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
      width: 96%;
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
    
    .register-link {
      text-align: center;
      margin-top: 10px;
    }

    .error-popup {
      position: absolute;
      margin-top: 360px;
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
    <h2>Login</h2>
    <form action="login" method="post">
      <div class="form-group">
        <label for="username">Email:</label>
        <input type="text" id="username" name="usuario" required>
      </div>
      <div class="form-group">
        <label for="password">Senha:</label>
        <input type="password" id="password" name="senha" required>
      </div>
      <div class="form-group">
        <input type="submit" value="Entrar" class="btn">
      </div>
    </form>
    <div class="register-link">
      <div style="text-align: center;"><span>Não tem uma conta ? </span><a href="http://localhost:8080/agenda_pessoal/cadastro.jsp">Cadastre-se aqui</a></div>
    </div>
  </div>
  <div class="error-popup" id="error-popup">Login ou senha incorretos</div>
</body>
</html>