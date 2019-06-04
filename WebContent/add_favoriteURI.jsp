<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=UTF-8");
	

	String si = request.getParameter("si");
	String gu = request.getParameter("gu");
	
	String filename = session.getAttribute("id") + ".txt";
	
	try{

		PrintWriter writer = new PrintWriter(new FileWriter(application.getRealPath("/WEB-INF/user/"+filename), true));
		
		writer.write(si + "\n");
		writer.write(gu + "\n");
		
		%> 
		<script>
			alert("게시글이 저장되었습니다!");
		</script>
		
		<%
		writer.close();
	}
	catch(Exception e){
		out.println("오류 발생");
		e.printStackTrace();
	}

%>

<meta http-equiv="refresh" content="1;url=favorites.jsp">
</body>
</html>