<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%

	request.setCharacterEncoding("UTF-8");
	String contentPage = request.getParameter("CONTENTPAGE");


%>

<table width="800" border="1" cellpadding="2" cellspacing="0">

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