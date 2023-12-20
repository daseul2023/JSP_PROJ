<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*, java.util.*" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
	String na = request.getParameter("name");
	String em = request.getParameter("email");
	String sub = request.getParameter("subject");
	String cont = request.getParameter("contents");


%>

<%@ include file = "../db_conn/db_conn_oracle.jsp" %>

<%
	String sql = null;
	PreparedStatement pstmt = null;
	
	sql = "insert into mem (name,email,subject,contents)";
	sql = sql + " values (?,?,?,?)";
	
	pstmt = conn.prepareStatement(sql);
	
	
	pstmt.setString(1, na);
	pstmt.setString(2, em);
	pstmt.setString(3, sub);
	pstmt.setString(4, cont);
	
	try {
		pstmt.executeUpdate();
		
	}catch (Exception e){
		
		e.printStackTrace();
		out.println ("DB 저장에 실패했습니다");
	}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<p><p><p>
	<h2> 넘어오는 변수 값 출력 </h2>
	<%= na %> <br>
	<%= em %> <br>
	<%= sub %> <br>
	<%= cont %> <br>
	
	<h1> PreparedStatement </h1>

</body>
</html>