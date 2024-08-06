<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String msg=(String)session.getAttribute("msg");
	if(msg!=null)
	{
	%>
	<p class="text-danger text-center"><%=msg %></p>
	<%
	session.removeAttribute("msg");
	}
	%>
</body>
</html>