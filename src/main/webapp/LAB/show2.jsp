<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.sql.*" %>

<%@ include file = "../db_conn/db_conn_oracle.jsp" %>

<%

	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
		
	sql = "select * from lab order by desc";

	pstmt = conn.prepareStatement(sql);
	
	try{
		rs = pstmt.executeQuery();
		
	}catch (Exception e){
		out.println ("DB 접속에 이상이 생겼습니다.");
		e.getStackTrace();
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> PreparedStatement 쿼리 실행 후 rs에 담아서 출력 </h2>
	
	<table width ="600px" border="1">
	<tr><th> 이름 </th><th> 메일 </th><th> 제목 </th><th> 내용 </th></tr>
	<% if(rs.next()){
		do {
	%>
	 	<tr>
	 		<td><%= rs.getString("name") %></td>
	 		<td><%= rs.getString("email") %></td>
	 		<td><%= rs.getString("subject") %></td>
	 		<td><%= rs.getString("contents") %></td>
	 	</tr>
	
	<% 
	}while(rs.next());
	}else {
		out.println ("DB 값이 존재하지 않습니다.");
	}
	%>
	</table>
</body>
</html>