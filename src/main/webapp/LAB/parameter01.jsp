<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	int a = 0;
	int b = 0;
	
	String c = null;
	String d = null;
	
	//1.
	c = request.getParameter("aa");        // parameter 로 받는건 다 string으로 받는다. 위에 string으로 설정했으므로
	d = request.getParameter("bb");
	
	a = Integer.parseInt(c);              // string으로 바꾼 c를 정수로 바꾼다.
	b = Integer.parseInt(d);

	out.println (a + "<p>");
	out.println (b + "<p>");
	
	//2.
	a = Integer.parseInt(request.getParameter("cc"));
	b = Integer.parseInt(request.getParameter("dd"));
	
	out.println("<hr>");
	out.println(a + "<p>");
	out.println (b + "<p>");

 %>   
    
    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>