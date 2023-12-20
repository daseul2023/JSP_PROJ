<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*, java.util.*" %>

<% request.setCharacterEncoding("UTF-8");  %>

<%

	String na = request.getParameter("name");
	String em = request.getParameter("email");
	String sub = request.getParameter("subject");
	String cont = request.getParameter("contents");


%>

<%@ include file = "../db_conn/db_conn_oracle.jsp"  %>

<%
	String sql =null;
	Statement stmt = null;
	
	sql = "insert into mem (name,email,subject,contents)";
	sql = sql + " values ('"+na+"','"+em+"','"+sub+"','"+cont+"')";
	
	out.println(sql);
	
	stmt = conn.createStatement();
	
	try {
		stmt.execute(sql);
		
	}catch (Exception e){
		
		e.printStackTrace();
		out.println ("DB 저장에 실패하였습니다.");
	}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<p style="background-color: red">asd</p><p>
	<h1> 넘어오는 변수 값 출력 </h1>
	<%= na %> <br>   
	<%= em %> <br>
	<%= sub %> <br>
	<%= cont %> <br>
	
	<h2> Statement </h2>

</body>
</html>