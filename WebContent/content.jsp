
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
	height: 1000px;
	background-color: white;
}
</style>

</head>

<body>
	<div id="container">
		<%
		
			response.setContentType("text/html; charset=utf-8");
		
			String sido = "인천";
			String gu = "계양구";
			
			int minutess=0; // 미세먼지 농도 저장해놓을 곳

			
			/*호출하기*/
			StringBuilder urlBuilder = new StringBuilder(
					"http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnMesureSidoLIst"); /*URL*/
						
			urlBuilder.append("?" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("25", "UTF-8"));
 			urlBuilder.append("&" + URLEncoder.encode("sidoName", "UTF-8") + "=" + URLEncoder.encode(sido, "UTF-8"));
 			urlBuilder.append("&" + URLEncoder.encode("searchCondition", "UTF-8") + "=" + URLEncoder.encode("DAILY", "UTF-8"));							
			urlBuilder.append("&" + URLEncoder.encode("ServiceKey", "UTF-8") + "=");  

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
	        	  out.print(gu + "의 미세먼지는" + value.item(idx).getTextContent());
	        	  minutess = Integer.parseInt(value.item(idx).getTextContent());
	        	  break;
	           }
	        }

			if(minutess < 100){
				%>
				<p style="background-color:'red'; ">소풍을 나가셔요~~^^</p>
				 <% 
				 out.print("상쾌상쾌~");
			}

			


			
			

		%>
	</div>
</body>
</html>