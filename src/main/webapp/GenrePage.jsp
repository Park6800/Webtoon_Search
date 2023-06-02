<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DataClass.WebtoonData"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹툰 서치 - 장르 페이지</title>
<link rel="stylesheet" href="resource/css/genrepage.css">
<script src="resource/js/genrepage.js"></script>
</head>
<body>
	<%
	Object ID_ = session.getAttribute("user_id");
	String ID_value = (String) ID_;
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
	<div class="main_body">
	<div class="search_btn">
		<%ArrayList<WebtoonData> toonlist = (ArrayList<WebtoonData>) session.getAttribute("toon_list");
		WebtoonData webtooon = toonlist.get(1);
		String Genre = webtooon.getGENRE();
		String Day = webtooon.getDAY();
		%>
		<form method="post" action="webtoonServlet">
		<input type="hidden" name="Genre" value="<%=Genre %>">
		<input type="hidden" name="Day" value="<%=Day %>">
		<button type="submit" class="search__btn">가나다 순</button>
		</form>
		<form method="post" action="searchview_Servlet">
		<input type="hidden" value="<%=Genre %>" name="Genre">
		<input type="hidden" value="<%=Day %>" name="Day">
		<button type="submit" class="search__btn">조회 순</button>
		</form>
		<form method="post" action="searchlike_Servlet">
		<input type="hidden" value="<%=Genre %>" name="Genre">
		<input type="hidden" value="<%=Day %>" name="Day">
		<button type="submit" class="search__btn">좋아요 순</button>
		</form>
	</div>
		<div class="informations">
			<%
			for (WebtoonData webtoon : toonlist) {
				String title = webtoon.getTITLE();
				String day = webtoon.getDAY();
				String story = webtoon.getSTORY_AUTHOR();
				String art = webtoon.getART_AUTHOR();
				String url = webtoon.getURL();
				String like = webtoon.getLIKE();
				String genre = webtoon.getGENRE();

				Object LIKED = session.getAttribute("Liked_");
				String liked = (String) LIKED;
			%>
					<form method="post" action="updata_Servlet">
						<input type="hidden" value="<%=title%>" name="Title">
						
						<div class="info_card">
						<button type="submit" class="btn_shape">
							<div class="card_img">
								<img src="<%=url%>" class="img_size">
							</div>
							<div class="card_title"><%=title%></div>
						<div class="up_day"><%=day%></div>
						<div class="author">
							<div class="card_story_author"><%=story%></div>
							<div class="card_art_author"><%=art%></div>
						</div>
						</button>
						</div>
					</form>		
			<%
			}
			%>
		</div>
	</div>
</body>

</html>
