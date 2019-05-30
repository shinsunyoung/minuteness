
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
	height: 900px;
	background-color: white;
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

</style>

</head>

<body>
	<div id="container"><br>
		
		<pre>
		
		
		</pre>
		
		<div id="showminutenss">

		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=00491ff0245e2ce8398c94efed353af8"></script>
		


		
		<%
		
			response.setContentType("text/html; charset=utf-8");
		
		
			String sido = "서울";
			String gu = "관악구";
			
			int minutess=0; // 미세먼지 농도 저장해놓을 곳

			
			// URL 만들기
			StringBuilder urlBuilder = new StringBuilder(
					"http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst"); /*URL*/
						
			urlBuilder.append("?" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("25", "UTF-8"));
 			urlBuilder.append("&" + URLEncoder.encode("sidoName", "UTF-8") + "=" + URLEncoder.encode(sido, "UTF-8"));
 			urlBuilder.append("&" + URLEncoder.encode("searchCondition", "UTF-8") + "=" + URLEncoder.encode("DAILY", "UTF-8"));							
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=J834632QleIYwupZYjL4XIKCe1iuffx2VSIcU5KBSYjkOXhiXXlpbFUGSEOSl%2BWF%2FzDUGzKlcUoei9ReziEgGQ%3D%3D");  

			URL url = new URL(urlBuilder.toString());

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");

			/*응답 읽기*/
			BufferedReader rd;
			
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			
			StringBuilder sb = new StringBuilder();
			String line;
		
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			} 
			
			//out.print(sb); 전체 다 보기
			
			rd.close();
			conn.disconnect();
			
	        /*xml document 생성*/
			InputSource is = new InputSource(new StringReader(sb.toString()));
	        Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(is);

	        /*xpath 생성*/
			XPath xpath = XPathFactory.newInstance().newXPath();

			// NodeList 가져오기 : row 아래에 있는 모든 col1 을 선택
	        NodeList cols = (NodeList)xpath.evaluate("/response/body/items/item/cityName", document, XPathConstants.NODESET);
	        NodeList value = (NodeList)xpath.evaluate("/response/body/items/item/pm10Value", document, XPathConstants.NODESET);
	        

	        // 선택한 구의 미세먼지 농도 보기
	        for( int idx=0; idx<cols.getLength(); idx++ ){
	           if(cols.item(idx).getTextContent().equals(gu)){
	        	  
	        	  minutess = Integer.parseInt(value.item(idx).getTextContent());
	        	  break;
	           }
	        }
	        
	        %>
	        
	        <div id="local">
	        	<br>
				<h1> <%= minutess %>PM <small>( <%= sido %>, <%= gu %> )</small> </h1>
				<br>
	        </div>
	        
	        <pre>
		
		
			</pre>
		
	        
	        <%

			if(minutess < 15){
				%>
				</div>
				

				
				
				<pre>
				

		
		
				</pre>
				<center>
				<img src="pic/face/best.PNG" width="250px">
				<p>오늘은 미세먼지가 <b>최고 좋은</b>날입니다. 맑은 공기를 맘껏 마실 수 있는 날입니다!</p>
				</center>
				<script>
					var container = document.getElementById("container");
					container.style.background = '#1976D3';
				</script>
				 <% 
			}
			else if(minutess < 30){
				%>
				<center>
				<img src="pic/face/good.PNG" width="250px">
				<p>오늘은 미세먼지가 <b>좋은</b>날입니다. 신선한 공기를 마셔보세요!</p>
				</center>
				<script>
					var container = document.getElementById("container");
					container.style.background = '#1378BB';
				</script>
				 <% 
			}
			else if(minutess < 40){ // 40
				%>
				<center>
				<img src="pic/face/somegood.PNG" width="250px">
				<p>오늘은 미세먼지가 <b>양호</b>한 날입니다. 쾌적한 공기를 즐기세요!</p>
				</center>
				<script>
					var container = document.getElementById("container");
					container.style.background = '#0098A6';
				</script>
				 <% 
			}
			
			else if(minutess < 50){ // 50
				%>
				<center>
				<img src="pic/face/soso.PNG" width="250px">
				<p>오늘은 미세먼지가 <b>보통</b>인 날입니다.산책을 하셔도 괜찮습니다!</p>
				</center>
				<script>
					var container = document.getElementById("container");
					container.style.background = '#398E3D';
				</script>
				 <% 
			}
			
			else if(minutess < 75){ // 75
				%>
				<center>
				<img src="pic/face/notgood.PNG" width="250px">
				<p>오늘은 미세먼지가 <b>나쁨</b>인 날입니다. 외출 시 마스크를 권장합니다!</p>
				</center>
				<script>
					var container = document.getElementById("container");
					container.style.background = '#F47F16';
				</script>
				 <% 
			}
			
			else if(minutess < 100){ // 100
				%>
				<center>
				<img src="pic/face/bad.PNG" width="250px">
				<p>오늘은 미세먼지가 <b>상당히 나쁨</b>인 날입니다. 외출 시 마스크를 꼭 착용하세요!</p>
				</center>
				<script>
					var container = document.getElementById("container");
					container.style.background = '#D84315';
				</script>
				 <% 
			}
			
			else if(minutess < 150){ // 100
				%>
				<center>
				<img src="pic/face/verybad.PNG" width="250px">
				<p>오늘은 미세먼지가 <b>매우 나쁨</b>인 날입니다. 가급적 외출을 삼가하세요!</p>
				</center>
				<script>
					var container = document.getElementById("container");
					container.style.background = '#C62827';
				</script>
				 <% 
			}
			else if(minutess < 300){ 
				%>
				<center>
				<img src="pic/face/muchbad.PNG" width="250px">
				<p>오늘은 미세먼지가 <b>최악</b>인 날입니다. 절대 외출하지 마세요!</p>
				</center>
				<script>
					var container = document.getElementById("container");
					container.style.background = '#212121';
				</script>
				 <% 
			}		

		%>
		<br>
		<center><div id="map" style="width:400px;height:200px;"></div></center>
		
		<script>
			
			var latitude;
			var longitude
			
				navigator.geolocation.getCurrentPosition(function(pos) {
			    latitude = pos.coords.latitude;
			    longitude = pos.coords.longitude;
			});
		
		
			// 카카오 다음 api
			var container = document.getElementById('map');
			
		
			var options = {
				center: new daum.maps.LatLng(latitude,longitude),
				level: 3
			};
			
			
			var map = new daum.maps.Map(container, options);
			
			
			
		</script>
	</div>
</body>
</html>