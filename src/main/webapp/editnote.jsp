<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
	<%
	String check=(String)session.getAttribute("check");
	if(check!=null)
	{
		String note=request.getParameter("note");
		String adddate=request.getParameter("adddate");
	%>
	<h1 class="text-center">edit Note</h1>
	<div class="container">
	<form action="editenote">
		<textarea rows="" cols="" class="form-control" name="note"><%=note %></textarea>
		<input type="hidden" name="userid" value="<%=check%>">
		<input type="hidden" name="oldnote" value="<%=note%>">
		<button class="btn btn-success">Submit</button>
	</form>
	</div>
	<%
	}else{
		response.sendRedirect("login.jsp");
	}
	%>
</body>
</html>