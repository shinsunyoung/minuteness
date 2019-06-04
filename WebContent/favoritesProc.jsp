<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미세미세 | 즐겨찾기</title>

<style>

#container{
	background-image : url("pic/background/favoritebackground.jpg");
	background-size: cover;
	width : 100%;
	height: 700px;
}

#listtb {
	font-size:25px;
	position: absolute;
	left :12%;
	top : 46%;
	width : 800px;
	height : 300px;
	text-align: center;
}

th {
	background-color: #adffeb;

}

h1{
	font-size : 50px;
	color : #1fe9b7;
}

#add_btn{
	position: absolute;
	left :63%;
	top : 50%;
	width: 300px;
	height: 100px;
	background-color: white;
}

#add_a{
	text-decoration: none;
	color : black;
	font-size:20px;
}

</style>

</head>
<body>

<div id="container">
<!-- 즐겨찾기 관리하는 곳 -->
<pre>






</pre>
<center><h1><%= session.getAttribute("id") %>님의 즐겨찾기</h1></center>

<button id="add_btn"><a href="add_favorite.jsp" id="add_a">즐겨찾기 추가하기</a></button>

<%

BufferedReader reader = null;

String filepath = application.getRealPath("/WEB-INF/user/"+session.getAttribute("id")+".txt");


reader = new BufferedReader(new FileReader(filepath));

// 패스워드 읽는 부분(필요 없는 부분)
String pw = reader.readLine();

String addr1_si = reader.readLine();
String addr1_gu = reader.readLine();

String addr2_si = reader.readLine();
String addr2_gu = reader.readLine();

String addr3_si = reader.readLine();
String addr3_gu = reader.readLine();

System.out.println("addr1_si : " + addr1_si);
System.out.println("addr2_si : " + addr2_si);
System.out.println("addr3_si : " + addr3_si);


%>

<!-- null이 아닌 것만 출력 -->

<script>

function favorite_location(num) {
	let addr1;
	let addr2;
	
	switch(num){
	case 1:
		addr1 = '<%= addr1_si %>';
		addr2 = '<%= addr1_gu %>';
		break;
	case 2:
		addr1 = '<%= addr2_si %>';
		addr2 = '<%= addr2_gu %>';
		break;
	case 3:
		addr1 = '<%= addr3_si %>';
		addr2 = '<%= addr3_gu %>';
		break;
	}
	
	
 	location.href = "thislocation.jsp?addr1="+addr1+"&addr2="+addr2; 

}

</script>

<table id="listtb">
	<tr>
		<th>시/도</th>
		<th>구</th>
		<th>바로가기</th>
	</tr>
	<%if(addr1_si != null){
		%>	
	<tr>
		<td> <% out.print(addr1_si); %> </td>
		<td> <% out.print(addr1_gu); %> </td>
		<td> <a href="#" onclick="favorite_location(1)">이동하기</a></td>
	</tr>
		<%
	}%>
	
	<%if(addr2_si != null){
		%>	
	<tr>
		<td> <% out.print(addr2_si); %> </td>
		<td> <% out.print(addr2_gu); %> </td>
		<td> <a href="#" onclick="favorite_location(2)">이동하기</a></td>
	</tr>
		<%
	}%>

	<%if(addr3_si != null){
		%>	
	<tr>
		<td> <% out.print(addr3_si); %> </td>
		<td> <% out.print(addr3_gu); %> </td>
		<td> <a href="#" onclick="favorite_location(3)">이동하기</a></td>
	</tr>
		<%
	}%>

</table>
</div>
</body>
</html>