<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미세미세 | 로그인</title>
</head>
<body>
 <%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	

	
	BufferedReader reader = null;
	
	try {
		
		String filepath = application.getRealPath("/WEB-INF/user/"+id+".txt");
		reader = new BufferedReader(new FileReader(filepath));
		

		String userpassword = reader.readLine();

		System.out.println("user password : " + userpassword);
		System.out.println("input password : " + password);
		
		if( password.equals( userpassword ) ){
			
		    // 세션 생성
		    session.setAttribute("id", id) ;
		 
		    // 세션 유지시간 설정(예 : 1시간)
		    session.setMaxInactiveInterval(60*60);
		
		    %>
			<script> alert("로그인 성공!"); </script>
			<meta http-equiv="refresh" content="1;url=main.jsp">
			<%  		reader.close();
		}
		else{
			System.out.println("하ㅏ라라");
			%>
			<script> alert("패스워드가 일치하지 않습니다!"); </script>
			<meta http-equiv="refresh" content="1;url=login.jsp">
			<%
		}
	}catch (Exception e){
		System.out.println("예외 발생" + e.getMessage());
		%> 
		<script> alert("없는 회원정보입니다."); </script>
		<meta http-equiv="refresh" content="1;url=login.jsp">
		<%  		
	}
	
%> 

</body>
</html>