<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미세미세 | 로그인</title>

<style>
#container{
	background-image : url("pic/background/loginbackground.jpg");
	background-size: cover;
	width : 100%;
	height: 700px;
}


#id{
	position: absolute;
	left :44%;
	top : 53%;
	width: 250px;
	height: 30px;
}

#password{
	position: absolute;
	left :44%;
	top : 60%;
	width: 250px;
	height: 30px;
}

#submit_btn{
	position: absolute;
	left :45%;
	top : 70%;
	width: 200px;
	height: 60px;
	background-color: white;
}

</style>

</head>

<body>

<div id="container">

<form  action=loginFIFO.jsp method="POST">
	<input type="text" name="id" id="id" required>
	<input type="password" name="password" id="password" required>
	<input type="submit" value="로그인" id="submit_btn">
</form>

</div>

</body>
</html>