<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

#container{
	background-image : url("pic/background/addfavoritebackground.jpg");
	background-size: cover;
	width : 100%;
	height: 700px;
	
}

#si{
	position: absolute;
	left :41%;
	top : 56%;
	width: 410px;
	height: 60px;
}


#gu{
	position: absolute;
	left :41%;
	top : 72%;
	width: 410px;
	height: 60px;
}

#search_btn{
	position: absolute;
	left :45%;
	top : 86%;
	width: 200px;
	height: 60px;
	background-color: white;
}


</style>

</head>
<body>

<div id="container">
	<form action="add_favoriteURI.jsp" method="POST">
		<input type="text" name="si" id="si" placeholder="앞 두글자만 입력 (인천광역시 -> 인천 / 충청북도 -> 충북)" required>
		<input type="text" name="gu" id="gu" placeholder="구, 군, 시 입력" required>
		<input type="submit" value="추가하기" id="search_btn">
	</form>
</div>

</body>
</html>