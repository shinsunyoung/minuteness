<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>미세미세 | 직접검색</title>
</head>
<body>
<%

	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=UTF-8");


	String si = URLEncoder.encode(request.getParameter("si"));
	String gu = URLEncoder.encode(request.getParameter("gu"));
	
	
	response.sendRedirect("thislocation.jsp?addr1="+si+"&addr2="+gu);

%>
</body>
</html>