<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*, java.util.*" %>

<%@ include file = "../db_conn/db_conn_oracle.jsp" %>
      
<% 
	// DB에서 가져온 레코드셋을 rs에 담은 후 ArrayList에 저장 후 출력
	
    //선언만 된 상태 
    ArrayList<String> name = new ArrayList<>();             //이름, <String>, <> 생략 가능
    ArrayList<String> email = new ArrayList<>();            //메일
    ArrayList subject = new ArrayList();            		//제목
    ArrayList content = new ArrayList();            		//내용
    
    //객체 변수 선언
    String sql = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    sql = "select * from guestboard order by name desc";
    
    //pstmt 활성화
    pstmt = conn.prepareStatement(sql);
   
    try{
    //pstmt의 쿼리를 실행, rs는 guestboard 테이블의 레코드셋을 담고있다.
    rs = pstmt.executeQuery();
    
    }catch (Exception e) {
    		out.println("DB에 값을 읽어오는동안 오류가 발생되었습니다.");
    		e.printStackTrace();
    }
   
   //rs에 저장된 값을 ArrayList에 저장 
   if (rs.next()){
   		do {
   			//
   			name.add(rs.getString("name"));        //name : DB의 이름 레코드만 저장됨.
   			email.add(rs.getString("email"));
   			subject.add(rs.getString("subject"));
   			content.add(rs.getString("content"));
   		
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

	<h2> RS에 저장된 값을 ArrayList에 저장 후 출력 </h2>
	
	<table width ="600px" border = "1px">
		<tr><th> 이름 </th> <th> 이메일 </th> <th> 제목 </th> <th> 내용 </th> </tr>   <!-- th = 컬럼 나타낼 때  --> 
	
	<%
		// ArrayList에 0번 방부터 마지막 방까지 순환하면서 필드의 내용을 출력 
		for (int i = 0; i < name.size(); i++){
			
	
	
	%>
		<tr><td><%= name.get(i) %></td> 
			<td><%= email.get(i) %></td>                                     <!-- td = 값 찍을 때, DB에서 가져온 값을 계속 루프 돌림 -->
			<td><%= subject.get(i) %></td>
			<td><%= content.get(i) %></td> 
		</tr>
	
	<%
		}
	
	%>
	
	</table>
	

</body>
</html>