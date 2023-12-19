<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*, java.util.*" %>

<%  request.setCharacterEncoding("UTF-8");  %>

<% 
	
	String na = request.getParameter("name"); 
	String age = request.getParameter("age"); 
	String wei = request.getParameter("weight"); 
	String addr = request.getParameter("address"); 
	String pho = request.getParameter("phone"); 

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2> 넘어오는 변수 값 출력 </h2>
	<%= na %> <br> 
	<%= age %> <br>
	<%= wei %> <br> 
	<%= addr %> <br> 
	<%= pho %> <br> 


</body>
</html>