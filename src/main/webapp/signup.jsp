<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="logsin.css">
</head>
<body>
<div class="container">
	<h1 class="text-center text-light p-4">Sign Up</h1>
	<div class="container">
		<div class="container-fluid w-50  border border-black p-4 bg-dark text-light">
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
</div>
</body>
</html>