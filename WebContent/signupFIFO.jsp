<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미세미세 | 회원가입</title>
</head>
<body>

<%

	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");

	String filename = id + ".txt";
	
	PrintWriter writer = null;
	
	String result;
	
	String filepath = application.getRealPath("/WEB-INF/user/"+filename);
	writer = new PrintWriter(filepath);
	writer.printf("%s\n", password);

	
	%> 
	<script>
		alert("회원가입을 축하합니다!");
	</script>
	
	<%
	
	
	writer.flush();
	writer.close();

%>

<meta http-equiv="refresh" content="1;url=main.jsp">

</body>
</html>