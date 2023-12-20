<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import ="java.sql.*" %>

<%@ include file = "../db_conn/db_conn_oracle.jsp" %>

<%

	String sql = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	sql = "select * from lab";
	
	stmt = conn.createStatement();
	
	try {
		rs = stmt.executeQuery(sql);
		
		
	}catch (Exception e){
		out.println ("DB에 문제가 생겼습니다.");
		e.printStackTrace();
	}


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	<h2> DB의 값을 출력하는 페이지 </h2>
	
	<%
		if (rs.next()){
			do{
			%>	
			
		<table border="1" width ="600px">
		<tr><td colspan = "2"></td><td><%=rs.getString("subject") %></td></tr>
		<tr><td> 이름: </td><td><%=rs.getString("name") %></td></tr>
		<tr><td>이메일: </td><td><%=rs.getString("email") %></td></tr>
		<tr><td>내용: </td><td><%=rs.getString("contents") %></td></tr>
		</table>
		<br>
		
	<%
		}while(rs.next());
	
		}
	
	%>
	
	</center>

</body>
</html>