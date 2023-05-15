<%@page import="DataClass.WebtoonData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DB.DB_Conn"%>
<%@page import="DataClass.CountData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resource/css/morelike.css">
<title>Insert title here</title>
</head>
<body>
<%
Object ID_ = session.getAttribute("user_id");
String ID_value = (String) ID_;
Integer ADMIN_ = (Integer) session.getAttribute("admin");
%>
	<nav>
		<div class="top-nav">
			<div class="top-nav-left"><a href="Home.jsp"><img src="resource/img/Logo.png" style="width: 100px"></a></div>
			<div class="serach">
				<select onchange="search_()" id=change_select>
					<option value="Title">제목 검색</option>
					<option value="Story">글 작가 검색</option>
					<option value="Art">그림 작가 검색</option>
				</select>
				<form method="post" action="search_input">
					<input type="text" placeholder="검색어를 입력" class="serach_text"
						id="serach_form">
				</form>
			</div>
			<div class="top-nav-right">
				<ul>
					<% if(ID_value == null) {%>
					<li>로그인</li>
					<li><a href="Signup.jsp">회원가입</a></li>
					<%} else { %>
					<li><%=ID_value %></li>
					<li><a href="Logout.jsp">로그아웃</a></li>
					<%} %>
				</ul>
			</div>
		</div>
		<hr>
		<div class="bot">
			<div class="bot-nav">
				<div class="w150">도서관</div>
				<div class="w150">온라인</div>
				<div class="w150">질문 | 답변</div>
				<div class="w150">장르 1</div>
				<div class="w150">장르 2</div>
			</div>
		</div>
		<div class="hide-nav">
			<div class="hide_nav_width">
				<div class="around">
					<div class="pt20">찾아 오는 길</div>
					<div class="pt20">이용 시간 안내</div>
					<div class="pt20">기증 안내</div>
					<div class="pt20">자원 봉사</div>
				</div>
				<div class="around">
					<div class="pt20">온라인 도서관</div>
					<div class="pt20">새로 들어온 책</div>
					<div class="pt20">도서 택배 대출</div>
				</div>
				<div class="around">
					<div class="pt20">질</div>
					<div class="pt20">문</div>
					<div class="pt20">답</div>
					<div class="pt20">변</div>
				</div>
				<div class="around">
					<div class="pt20">질</div>
					<div class="pt20">문</div>
					<div class="pt20">답</div>
					<div class="pt20">변</div>
				</div>
				<div class="around">
					<div class="pt20">질</div>
					<div class="pt20">문</div>
					<div class="pt20">답</div>
					<div class="pt20">변</div>
				</div>
			</div>
		</div>
	</nav>
	<div class="like_list">
		<div class="list_container">
			<%
			int Number = 1;
			 if (request.getParameter("npage") != null)
			    {
				 Number = Integer.parseInt(request.getParameter("npage"));
			     }   
			DB_Conn dbcon = new DB_Conn();
			List<WebtoonData> likedWebtoons_list = new DB_Conn().likedWebtoons_list(ID_value, Number);
			for (WebtoonData data : likedWebtoons_list) {
			String title = data.getTITLE();
			String day = data.getDAY();
			String story = data.getSTORY_AUTHOR();
			String art = data.getART_AUTHOR();
			String url = data.getURL();
			%>
			<form method="post" action="updata_Servlet">
			<button type="submit">
			<input type="hidden" name="Title" value="<%=title %>" >
			<div class="list_item">
				<div class="like_url"><img src="<%=url %>"></div>
				<div class="like_title"><%=title %></div>
				<div class="like_story"><%=story %></div>
				<div class="like_art"><%=art %></div>
				<div class="like_day"><%=day %></div>
			</div>
			</button>
			</form>
			<%} %>
		</div>
			<div class="page">
				<ul style="list-style: none;">
		<% 
			int dp1 = 1;
			int dp2 = 5;
			int lastpage = 0;
			// 전체 게시글 카운트 개수 
			int count =  dbcon.like_list(ID_value); 
			
			// 한페이지에 10개 표시 한다는 전제하에 10의배수보다 많으면 마지막페이지 +1
			if(count% 10 != 0 ){
				lastpage = (count/10)+1;
			}else{
				lastpage = count/10;
			}
			for(int pageNum = dp1; pageNum<=lastpage;pageNum++){
	 	%>
					<li><a href="MoreLike.jsp?npage=<%=pageNum %>"><%= pageNum %></a></li>
		<%
			}	
		%>
				</ul>
			</div>
	</div>
</body>
</html>