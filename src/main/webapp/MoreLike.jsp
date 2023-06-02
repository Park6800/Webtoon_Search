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
<title>웹툰 서치 - 선호작 보기</title>
</head>
<body>
<%
Object ID_ = session.getAttribute("user_id");
String ID_value = (String) ID_;
Integer ADMIN_ = (Integer) session.getAttribute("admin");
%>
	<nav>
	<div class="color_nav">
		<div class="top-nav">
			<div class="top-nav-left">
				<a href="Home.jsp" class="color_w"><img src="resource/img/Logo.png" style="width: 100px"></a>
			</div>
			<div class="serach">
				<select onchange="search_()" id=change_select>
					<option disabled="disabled" selected="selected">검색 조건</option>
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
				<%
				if (ID_value == null) {
				%>
				<ul>
					<li class="color_w">로그인</li>
					<li class="color_w">회원가입</li>
				</ul>
				<%
				} else {
				%>
				<ul>
					<li class="color_w"><%=ID_value%></li>
					<li><a href="Logout.jsp" class="color_w">로그아웃</a></li>
				</ul>
				<%
				}
				%>
			</div>
		</div>
		<hr>
		<div class="middle-nav">
			<div class="nav_genre">
				<ul>
					<li onclick="click_genre('스릴러');" id="스릴러" class="select_">스릴러</li>
					<li onclick="click_genre('로맨스');" id="로맨스" class="select_">로맨스</li>
					<li onclick="click_genre('로맨스판타지');" id="로맨스판타지" class="select_">로맨스
						판타지</li>
					<li onclick="click_genre('현대');" id="현대" class="select_">현대</li>
					<li onclick="click_genre('판타지');" id="판타지" class="select_">판타지</li>
					<li onclick="click_genre('무협');" id="무협" class="select_">무협</li>
					<li onclick="click_genre('개그');" id="개그" class="select_">개그</li>
				</ul>
			</div>
			<div class="color_w"><a href="My_info.jsp">내 정보 보기</a></div>
		</div>
		<hr>
		<div class="bot-nav" id="nav-b">
			<div class="submit_btn">
				<ul>
					<li>
						<form method="post" action="webtoonServlet" class="_post">
							<input type="submit" value="월요일" name="Day" class="btn_day" onclick="submit_Btn(event)"><input
								type="hidden" class="get_genre" name="Genre">
						</form>
					</li>
					<li>
						<form method="post" action="webtoonServlet" class="_post">
							<input type="submit" value="화요일" name="Day" class="btn_day" onclick="submit_Btn(event)"><input
								type="hidden" class="get_genre" name="Genre">
						</form>
					</li>
					<li>
						<form method="post" action="webtoonServlet" class="_post">
							<input type="submit" value="수요일" name="Day" class="btn_day" onclick="submit_Btn(event)"><input
								type="hidden" class="get_genre" name="Genre">
						</form>
					</li>
					<li>
						<form method="post" action="webtoonServlet" class="_post">
							<input type="submit" value="목요일" name="Day" class="btn_day" onclick="submit_Btn(event)"><input
								type="hidden" class="get_genre" name="Genre">
						</form>
					</li>
					<li>
						<form method="post" action="webtoonServlet" class="_post">
							<input type="submit" value="금요일" name="Day" class="btn_day" onclick="submit_Btn(event)"><input
								type=hidden class="get_genre" name="Genre">
						</form>
					</li>
					<li>
						<form method="post" action="webtoonServlet" class="_post">
							<input type="submit" value="토요일" name="Day" class="btn_day" onclick="submit_Btn(event)"><input
								type="hidden" class="get_genre" name="Genre">
						</form>
					</li>
					<li>
						<form method="post" action="webtoonServlet" class="_post">
							<input type="submit" value="일요일" name="Day" class="btn_day" onclick="submit_Btn(event)"><input
								type="hidden" class="get_genre" name="Genre">
						</form>
					</li>
				</ul>
			</div>
			<div class="color_w"><a href="MoreLike.jsp">내 선호작 보기</a></div>
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
			<button type="submit" class="btn_submit">
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
			if(count% 9 != 0 ){
				lastpage = (count/9)+1;
			}else{
				lastpage = count/9;
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