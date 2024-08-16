<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
  body {
    background-image: url('backgroundls.jpg'); 
    background-size: cover;
    background-position: center;
    font-family: Arial, sans-serif;
  }

  .glass-container {
    max-width: 500px;
    margin: 5% auto;
    padding: 30px;
    border-radius: 15px;
    background: rgba(255, 255, 255, 0.2);
    box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.3);
  }

  h1 {
    font-size: 2.5rem;
  }

  label, .form-control, .glass-container {
    color: navy;
  }

  .form-control {
    background: rgba(255, 255, 255, 0.1);
  }

  .form-control:focus {
    background: rgba(255, 255, 255, 0.2);
  }

  .btn-primary {
    background-color: #007bff;
    border-color: #007bff;
  }

  .btn-success {
    background-color: #28a745;
    border-color: #28a745;
  }
</style>
</head>
<body>
<div class="container">
  <h1 class="text-center text-nevy p-4">Sign Up</h1>
  <div class="glass-container">
    <form action="signup" method="post" class="text-center">
      <div class="mb-3">
        <label for="userid" class="form-label">Enter Username</label>
        <input type="text" class="form-control text-center border border-dark " id="userid" name="userid" aria-describedby="emailHelp">
      </div>
      <div class="mb-3">
        <label for="Password" class="form-label">Password</label>
        <input type="password" class="form-control text-center border border-dark" name="password" id="Password">
      </div>
      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control text-center border border-dark" name="email" id="email">
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
      <p>or</p>
      <a href="login.jsp" class="btn btn-success">Login</a>
    </form>
  </div>
  <%@ include file="msg.jsp" %>
</div>
</body>
</html>
