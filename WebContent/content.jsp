<%@page import="java.util.ResourceBundle"%>
<%@page import="javax.xml.xpath.XPathConstants"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="javax.xml.xpath.XPathFactory"%>
<%@page import="javax.xml.xpath.XPath"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="java.io.StringReader"%>
<%@page import="org.xml.sax.InputSource"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.net.HttpURLConnection"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");

	out.println(session.getAttribute("id"));


%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="//fonts.googleapis.com/earlyaccess/nanumgothic.css">
<meta charset="UTF-8">
<title>미세미세 | HOME</title>

<style>

#container {
	width: 100%;
	height: 800px;
	background-image: url("pic/background.jpg");
	
}

h1 { 
	color:black;
	margin-left: 44%;
}

#showminutenss{
	margin:0 auto;
}

#local{
	background-color:white;
}


p{
	font-size:15px;
	color: white;
}

#yellowbtn{
	position: absolute;
	left :18%;
	top : 53%;
}


#greenbtn{
	position: absolute;
	left :70%;
	top : 53%;
}

</style>

</head>

<body>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00491ff0245e2ce8398c94efed353af8&libraries=services"></script>
	
			

	
	<div id="container"><br>
		
		<pre>
		
		
		</pre>
		
		<div id="showminutenss">

		
		<script>
		
			var addr1;
			var addr2;
		
				
			navigator.geolocation.getCurrentPosition(function(pos) {
				
			    latitude = pos.coords.latitude;
			    longitude = pos.coords.longitude;
				
				// 위도경도 - > 주소 변경
				var geocoder = new daum.maps.services.Geocoder();

				var coord = new daum.maps.LatLng(latitude,longitude);
				
				var callback = function(result, status) {
				    if (status === daum.maps.services.Status.OK) {
				        console.log(result[0].address.region_1depth_name +' ' + result[0].address.region_2depth_name);
				        addr1 = result[0].address.region_1depth_name;
				        addr2 = result[0].address.region_2depth_name;
				    }
				    else {
				    	console.log("error : 위도경도 -> 주소 변경 ");
				    }
				};

				geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
				
			});
			
			
			function gothislocation(){
				location.href = "thislocation.jsp?addr1="+addr1+"&addr2="+addr2;
			}
			
			
		</script>
		
		<a href="#" onclick="gothislocation()"  ><img src="pic/letsgoyellow.png" id="yellowbtn"></a>
		<a href="#" onclick="gothislocation()"  ><img src="pic/gotitgreen.png" id="greenbtn"></a><br>
		<br>

		
	
	</div>
</body>
</html>