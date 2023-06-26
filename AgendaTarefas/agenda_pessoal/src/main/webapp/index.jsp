<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
 <style>
 
    body {
      font-family: 'Open Sans';
      justify-content: center;
      align-items: center;
      height: 97vh;
      display:flex;
       background: linear-gradient(to bottom, #848484, #585a5b);
    }
    
    a{
      text-decoration: none;
      color: rgb(230, 105, 252);
    }

    .container {
      width: 40%;
      height: 40%;
      padding: 20px;
      border: 1px solid #000000;
      border-radius: 5px;
      background: linear-gradient(to bottom, #848484, #585a5b);
      
    }

    h2 {
      text-align: center;
      color: #ccc;
    }

    .form-group {
      margin-bottom: 10px;
    }

    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
      color: #ccc;
    }

    .form-group input {
      width: 96%;
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }

    .form-group .btn {
      width: 35%;
      padding: 10px;
      border: none;
      border-radius: 3px;
      background-color: blue;
      color: #fff;
      cursor: pointer;
      text-align: center;
      margin: auto;
      display: flex;
      justify-content: center;
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
      max-width: 300px;
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
      background-color: #f1f1f1;
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
      <div style="text-align: center;"><a href="http://localhost:8080/agenda_pessoal/cadastro.jsp">Cadastre-se aqui</a></div>
    </div>
  </div>
  <div class="error-popup" id="error-popup">Login ou senha incorretos</div>
</body>
</html>