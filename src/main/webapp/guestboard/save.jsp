<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- JSP 에서 , java.sql 패키지의 하위 모든 클래스를 import
			java.util 패키지의 하위 모든 클래스를 import 
 -->
<%@ page import = "java.sql.*, java.util.*" %>

<!-- 클라이언트에서 넘어오는 한글이 깨어지지 않게 처리  -->
<%  request.setCharacterEncoding("UTF-8");  %>

<!-- 클라이언트에서 넘어오는 값을 받아서 출력 : request 객체  -->
<% 
	// http://localhost:8181/JSP_PROJ/guestboard/save.jsp?name=gildong&email=aaa%40aaa.com&subject=aa&contents=bb
	//  파라미터 :  ?변수명=값&변수명=값&변수명=값
	//  파라미터로 넘어오는 값은 모두 String    
	
	String na = request.getParameter("name"); 
	String em = request.getParameter("email"); 
	String sub = request.getParameter("subject"); 
	String cont = request.getParameter("contents"); 

%>

<!-- DB Connection 객체를 불러들임 -->
<%@ include file ="../db_conn/db_conn_mysql.jsp" %>

<!-- Statement 객체를 사용해서 DB에 저장함. -->

<%
	//client에서 받은 값을 DB에 저장함.
	String sql = null;         //sql <== SQL 쿼리를 저장하는 변수
	Statement stmt = null;     //stmt <== SQL 쿼리를 담아서 DB에 적용하는 객체

	sql = "insert into guestboard (name,email,subject,content)";
	sql = sql + " values ( '"+na +"', '"+ em +"','"+ sub +"','"+ cont +"')";  // values 앞에 공백이 있어야 붙어 나오지 않는다.
	                      // "" 앞뒤로 ''작은 따옴표로 묶어줘야 오라클에서 실행 시 오류가 안난다.
	                      // 문자열(values)과 변수(na,em 등) 연결할 때는 + 붙여줘야함.

	out.println(sql);
	
	//Statement 객체를 활성화 : Connection 객체로 Statement 객체를 생성함.
	stmt = conn.createStatement();
	
	
	// stmt 를 사용해서 DB에 값을 insert 
	try {
		//DB에 값을 넣을 때 오류가 발생되더라도 전체 프로그램이 중지되지 않도록 설정
		stmt.execute(sql);               //DataBase에 저장완료, select 문이 들어가면 사용
			// execute = insert, update, delete문일 경우 사용
		
		
	}catch (Exception e) {
		
		e.printStackTrace();                // 오류 났을 때 확인 가능
		out.println("DB 저장에 실패했습니다.");
	}
	


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<p><p><p>             <!-- p기능에는 엔터 기능뿐만 아니라 스타일이랑 변화를 줄 수 있음.  -->
	<!--  변수에 담긴값을 출력  -->
	<h2> 넘어오는 변수 값 출력 </h2>
	<%= na %> <br>        <!-- br에는 엔터 기능만 있기 때문에 스타일이나 변화를 줄 수 없음.  -->
	<%= em %> <br>
	<%= sub %> <br> 
	<%= cont %> <br> 
	
	<h1> Statement </h1>


</body>
</html>