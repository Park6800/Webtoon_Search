<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DataClass.WebtoonData"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
			ArrayList<WebtoonData> toonlist = (ArrayList<WebtoonData>) session.getAttribute("toon_list");
			for (WebtoonData webtoon : toonlist) {
				String title = webtoon.getTITLE();
				String day = webtoon.getDAY();
				String story = webtoon.getSTORY_AUTHOR();
				String art = webtoon.getART_AUTHOR();
				String url = webtoon.getURL();
			%>
				<div class="info_card">
				<div class="card_img">
					<img src="<%=url%>" class="img_size">
				</div>
				<div class="card_title"><%=title%></div>
				<div class="up_day"><%=day%></div>
				<div class="author">
					<div class="card_story_author"><%=story%></div>
					<div class="card_art_author"><%=art%></div>
				</div>
			</div>
			<%} %>
</body>
</html>