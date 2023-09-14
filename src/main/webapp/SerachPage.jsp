<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DataClass.WebtoonData"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹툰 서치 - 검색 결과</title>
<link rel="stylesheet" href="resource/css/searchpage.css">
</head>
<body>
	<%
	Object ID_ = session.getAttribute("user_id");
	String ID_value = (String) ID_;
	Object NAME_ = session.getAttribute("user_name");
	String NAME_value = (String) NAME_;
	Object BIRTH_ = session.getAttribute("user_birth");
	String BIRTH_value = (String) BIRTH_;
	Object GENDER_ = session.getAttribute("user_gender");
	String GENDER_value = (String) GENDER_;

	Integer ADMIN_ = (Integer) session.getAttribute("admin");
	Object chk = session.getAttribute("Serach_chk");
	String Chk = (String) chk;
	%>
<nav>
		<div class="top-nav">
			<div class="top-nav-left">
				<a href="Home.jsp" class="color_w"><img
					src="resource/img/Logo.png" style="width: 100px"></a>
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
				<ul>
					<%
					if (ID_value == null) {
					%>
					<li><a href="Login.jsp">로그인</a></li>
					<li><a href="Signup.jsp">회원가입</a></li>
					<%
					} else {
					%>
					<li><%=ID_value%></li>
					<li><a href="Logout.jsp">로그아웃</a></li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
		<hr>
		<div class="bot">
			<div class="bot-nav">
				<div class="w150">회원</div>
				<div class="w150">회원 2</div>
				<div class="w150">조회</div>
				<div class="w150">좋아요</div>
				<div class="w150">리뷰</div>
			</div>
		</div>
		<div class="hide-nav">
			<div class="hide_nav_width">
				<div class="around">
					<div class="pt20">회원 가입</div>
					<div class="pt20">회원 가입 정규식</div>
					<div class="pt20">로그인</div>
					<div class="pt20">로그아웃</div>

				</div>
				<div class="around">
					<div class="pt20">내 정보 보기</div>
					<div class="pt20">내 정보 변경</div>
					<div class="pt20">아아디 찾기</div>
					<div class="pt20">비밀 번호 찾기</div>
					<div class="pt20">회원 탈퇴</div>
				</div>
				<div class="around">
					<div class="pt20">이름순 정렬 조회</div>
					<div class="pt20">좋아요순 정렬 조회</div>
					<div class="pt20">조회순 정렬 조회</div>
					<div class="pt20">검색어 검색</div>
				</div>
				<div class="around">
					<div class="pt20">좋아요</div>
					<div class="pt20">좋아요 해제</div>
					<div class="pt20">좋아요 작품 보기</div>
					<div class="pt20">좋아요 수 표시</div>
				</div>
				<div class="around">
					<div class="pt20">리뷰 작성</div>
					<div class="pt20">작품 최근 리뷰 보기</div>
					<div class="pt20">작성한 리뷰 보기</div>
				</div>
			</div>
		</div>
</nav>
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
			<a href="#"><img src="<%=url%>" class="img_size" width="350";></a>
		</div>
		<div class="card_title"><%=title%></div>
		<div class="up_day"><%=day%></div>
		<div class="author">
			<div class="card_story_author"><%=story%></div>
			<div class="card_art_author"><%=art%></div>
		</div>
	</div>
	<%
	}
	%>
</body>
</html>