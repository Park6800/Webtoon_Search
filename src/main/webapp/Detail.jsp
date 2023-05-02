<%@page import="DataClass.WebtoonData"%>
<%@page import="Updata_servlet.updata_Servlet"%>
<%@page import="DataClass.CountData"%>
<%@page import="DB.DB_Conn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/css/detail.css">
<script src="https://kit.fontawesome.com/7bb4972374.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous">
</head>
<body>
	<%
	// 유저 ID 정보 가져오기
	Object ID_ = session.getAttribute("user_id");
	String ID_value = (String) ID_;

	// 해당 링크의 title 가져오기
	String title_ = "";
	if (request.getParameter("title") != null) {
		title_ = (String) (request.getParameter("title"));
	}
	%>
	<nav>
		<div class="top-nav">
			<div class="top-nav-left">
				<a href="Home.jsp">도서관</a>
			</div>
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
				<%
				if (ID_value == null) {
				%>
				<ul>
					<li>로그인</li>
					<li>회원가입</li>
				</ul>
				<%
				} else {
				%>
				<ul>
					<li><%=ID_value%></li>
					<li><a href="Logout.jsp">로그아웃</a></li>
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
					<li onclick="click_genre('로맨스 판타지');" id="로맨스 판타지" class="select_">로맨스
						판타지</li>
					<li onclick="click_genre('현대');" id="현대" class="select_">현대</li>
					<li onclick="click_genre('판타지');" id="판타지" class="select_">판타지</li>
					<li onclick="click_genre('무협');" id="액션" class="select_">무협</li>
					<li onclick="click_genre('개그');" id="코믹" class="select_">개그</li>
				</ul>
			</div>
			<div>내 정보 보기</div>
		</div>
		<hr>
		<div class="bot-nav" id="nav-b">
			<div class="submit_btn">
				<ul>
					<li>
						<form method="post" action="webtoonServlet">
							<input type="submit" value="월요일" name="Day" class="btn_day"><input
								type="hidden" class="get_genre" name="Genre">
						</form>
					</li>
					<li>
						<form method="post" action="webtoonServlet">
							<input type="submit" value="화요일" name="Day" class="btn_day"><input
								type="hidden" class="get_genre" name="Genre">
						</form>
					</li>
					<li>
						<form method="post" action="webtoonServlet">
							<input type="submit" value="수요일" name="Day" class="btn_day"><input
								type="hidden" class="get_genre" name="Genre">
						</form>
					</li>
					<li>
						<form method="post" action="webtoonServlet">
							<input type="submit" value="목요일" name="Day" class="btn_day"><input
								type="hidden" class="get_genre" name="Genre">
						</form>
					</li>
					<li>
						<form method="post" action="webtoonServlet">
							<input type="submit" value="금요일" name="Day" class="btn_day"><input
								type="hidden" class="get_genre" name="Genre">
						</form>
					</li>
					<li>
						<form method="post" action="webtoonServlet">
							<input type="submit" value="토요일" name="Day" class="btn_day"><input
								type="hidden" class="get_genre" name="Genre">
						</form>
					</li>
					<li>
						<form method="post" action="webtoonServlet">
							<input type="submit" value="일요일" name="Day" class="btn_day"><input
								type="hidden" class="get_genre" name="Genre">
						</form>
					</li>
				</ul>
			</div>
			<div>예정</div>
		</div>
	</nav>
	<%
	WebtoonData conn = new DB_Conn().liked_img(ID_value, title_);
	%>
	<div class="body_container">
		<div class="container_nav">
			<div class="title_info">
				<h2><%=title_%></h2>
				<img src="<%=conn.getURL()%>">
				<div class="information">
					<div class="genre">
						장르 :
						<%=conn.getGENRE()%>
					</div>
					<div class="day">
						연재 요일 : <%=conn.getDAY() %>
					</div>
					<div class="company">
						연재 회사 : <%=conn.getCOMPANY() %>
						<br>
						바로 가기 : <a href="https://www.naver.com"><%=conn.getCOMPANY() %></a>
					</div>
					<div class="story">
						글 작가 : <%=conn.getSTORY_AUTHOR() %>
					</div>
					<div class="art">
						그림 작가 : <%=conn.getART_AUTHOR() %>
					</div>
				</div>
			</div>
			<div class="Like_btn">
			<%CountData con_ = new DB_Conn().conut_Data(ID_value, title_); %>
				<div class="count_num">
				<%=con_.getCOUNT() %>
				</div>
				<%
				CountData con = new DB_Conn().liked_(ID_value, title_);
				Object Like_ = session.getAttribute("Liked_");
				String like = (String) Like_;

				if (con == null) {
				%>
				<form method="post" action="likeServlet">
					<input type="hidden" value="<%=ID_value%>" name="Id"> <input
						type="hidden" value="<%=title_%>" name="Title"> <input
						type="hidden" value="1" name="Like"> <input type="hidden"
						value="1" name="Click">
					<button type="submit">
						<i class="fa-regular fa-heart"></i>
					</button>
				</form>
				<%
				} else {
				String like_ = "0";
				if (!con.getLIKE().equals("")) {
					like_ = con.getLIKE();
				}
				String url = con.getURL();
				if (!like_.equals("1")) {
				%>
				<form method="post" action="likeServlet">
					<input type="hidden" value="<%=ID_value%>" name="Id"> <input
						type="hidden" value="<%=title_%>" name="Title"> <input
						type="hidden" value="1" name="Like"> <input type="hidden"
						value="1" name="Click">
					<button type="submit">
						<i class="fa-regular fa-heart"></i>
					</button>
				</form>
				<%
				} else {
				%>
				<form method="post" action="hateServlet">
					<input type="hidden" value="<%=ID_value%>" name="Id"> <input
						type="hidden" value="<%=title_%>" name="Title">
					<button type="submit">
						<i class="fa-solid fa-heart"></i>
					</button>
				</form>
				<%
				}
				}
				%>
					<!-- CountData Connn = new DB_Conn().conut_Data(ID_value, title_); -->
			</div>
		</div>
	</div>
</body>
</html>