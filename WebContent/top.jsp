<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>


#logo{
	margin-left: 20px;
}


.deco{

	vertical-align : text-top;
	font-size: 20px;
	text-decoration: none;
}
	

</style>    



<script type="text/javascript">

//[ 즐겨찾기 ]를 눌렀을 때, 로그인이 되어있지 않은 상태면 알림창이 뜨고, 로그인이 되어있으면 페이지를 이동하게 한다.
function loginstatus(){ 
    <%
    if(session.getAttribute("id") == null){
    	%> alert("로그인 후 이용해주세요!"); <%
    }
    else{
    	%> location.href = "favorites.jsp"; <%
    }
    
    %>
}

</script>
    
<!--  메뉴부분 -->
<table>
	<tr>
		<!-- 로고 -->
		<td width = "70%"><a href="main.jsp"> <img src="pic/logo.PNG" width="240" height="100" alt="logo" id="logo"> </a></td>
		
		<!-- 로그인이 되어있지 않은 상태는 [ 로그인 ] , [ 회원가입 ]을 보여주고, 되어있지 않는 상태는 [ 로그아웃 ]을 보여주게 한다. -->
		<%
		if(session.getAttribute("id") == null){ // 세션이 없을 때(=로그인이 되어있지 않을 때)
	    	%> 
	    	<td><a href="login.jsp" class="deco">로그인</a> </td>
			<td><a href="signup.jsp" class="deco">회원가입</a> </td>
	    	<%
	    }
	    else{ // 세션이 있을 때(=로그인이 되어있을 때)
	    	%> <td><a href="logout.jsp" onclick="logout()" class="deco">로그아웃</a> </td> <%
	    }
		%>
		
		<td><a href="#" onclick="loginstatus()" class="deco"> 즐겨찾기 </a></td>	
			
		<td><a href="directsearch.jsp" class="deco"> 직접 검색 </a></td>	
	</tr>
</table>    

