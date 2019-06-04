<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미세미세 | 직접 검색</title>

<style>

#container{
	background-image : url("pic/background/directbackground.jpg");
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

#kosis{
	text-decoration: none;
	color:white;
}

</style>

</head>
<body>

<div id="container">

	<pre>
	
	</pre>
	<a id="kosis" href="http://kosis.kr/statHtml/statHtml.do?orgId=315&tblId=TX_315_2009_H1009">전국 시, 군, 구 행정구역 현황 보러가기 (KOSIS)</a>
	
	<form  action=directsearchURI.jsp method="POST">
		<input type="text" name="si" id="si" placeholder="앞 두글자만 입력 (인천광역시 -> 인천 / 충청북도 -> 충북)" required>
		<input type="text" name="gu" id="gu" placeholder="구, 군, 시 입력" required>
		<input type="submit" value="검색" id="search_btn">
	</form>

</div>

</body>
</html>