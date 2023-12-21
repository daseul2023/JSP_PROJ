<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*, java.util.*" %>

<%@ include file = "../db_conn/db_conn_oracle.jsp" %>

<%

	ArrayList name = new ArrayList();
	ArrayList email = new ArrayList();
	ArrayList subject = new ArrayList();
	ArrayList contents = new ArrayList();

	
	String sql = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	sql = "select * from guestboard order by desc";
	
	pstmt = conn.prepareStatement(sql);
	
	
	try{
		rs = pstmt.executeQuery();
		
	}catch (Exception e){
		out.println("DB 값이 잘못되었습니다.");
		e.getStackTrace();
	}
	
	if(rs.next()){
		
		do{
			name.add(rs.getString("name"));
			name.add(rs.getString("email"));
			name.add(rs.getString("subject"));
			name.add(rs.getString("contents"));	
		}while(rs.next());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> RS에 저장된 값을 ArrayList 저장 후 출력 </h2>
	<table width = "600px" border = "1">
	<tr><th> 이름 </th><th> 메일 </th><th> 제목 </th><th> 내용 </th></tr>
	
	<%
		for (int i = 0; i<name.size(); i++){
			
	
	%>	
		<tr>
		<td> <%=name.get(i)  %> </td>
		<td> <%=email.get(i)  %> </td>
		<td> <%=subject.get(i)  %> </td>
		<td> <%=contents.get(i)  %> </td>
		</tr>
	<%
		}
	%>	
	
	
	</table>

</body>
</html>