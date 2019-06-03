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
    
<!--  nav bar -->
<table>
	<tr>
		<td width = "70%"><a href="main.jsp"> <img src="pic/logo.PNG" width="240" height="100" alt="logo" id="logo"> </a></td>
		<td><a href="login.jsp" class="deco">로그인</a> </td>
		<td><a href="signup.jsp" class="deco">회원가입</a> </td>
		<td><a href="#" onclick="loginstatus()" class="deco"> 즐겨찾기 </a>
		
		   <!--  out.println(session.getAttribute("id")); -->
		
		</td>		
		<td><a href="#" class="deco"> 직접 검색 </a></td>
		<td><a href="#" class="deco"> 날씨 예보 </a></td>		
	</tr>
</table>    

