<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
<title>Insert title here</title>

<style>
* {
	font-family: 'Nanum Gothic';
}

body {
	background-color: #1FE9B7;
}

table{
	width : 100%;
	height : 100%;

}

</style>

</head>
<body>


<%

	request.setCharacterEncoding("UTF-8");
	String contentPage = request.getParameter("CONTENTPAGE");


%>

<table width="800" cellpadding="2" cellspacing="0">

<tr>
	<td colspan="2">
		<jsp:include page="top.jsp" flush="false" />
	</td>
</tr>

<tr>
	<td width="200">
		<jsp:include page="left.jsp" flush="false" />
	</td>
	<td>
		<jsp:include page="<%= contentPage %>" flush="false" />
	</td>
</tr>

<tr>
	<td colspan="2">
		<jsp:include page="bottom.jsp" flush="false" />
	</td>
</tr>


</table>

</body>
</html>