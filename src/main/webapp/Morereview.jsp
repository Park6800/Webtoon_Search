<%@page import="java.util.List"%>
<%@page import="DB.DB_Conn"%>
<%@page import="DataClass.ReviewData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹툰 서치 - 내 리뷰 더 보기</title>
<link rel="stylesheet" href="resource/css/morereview.css">
</head>
<body>
	<%
	Object ID_ = session.getAttribute("user_id");
	String ID_value = (String) ID_;
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
	<div class="body_container">
		<%
		int Number = 1;
		if (request.getParameter("npage") != null) {
			Number = Integer.parseInt(request.getParameter("npage"));
		}
		DB_Conn dbcon = new DB_Conn();
		List<ReviewData> Write_Review_List = new DB_Conn().Review_comment_20(ID_value, Number);
		for (ReviewData data : Write_Review_List) {
			String title = data.getCOMMENT_TITLE();
			String text = data.getCOMMENT();
			String day = data.getDATA().substring(0, 10);
		%>
		<a href="Comment_.jsp?comment=<%=data.getCOMMENT_TITLE()%>" class="color_b">
		<div class="list">
			<div class="title"><%=title%></div>
			<div class="text"><%=text%></div>
			<div class="day"><%=day%></div>
		</div>
		</a>
		<hr>
		<%
		}
		%>
	</div>
	<div class="page">
		<ul style="list-style: none;">
			<%
			int dp1 = 1;
			int dp2 = 5;
			int lastpage = 0;
			// 전체 게시글 카운트 개수 
			int count = dbcon.review_list(ID_value);

			// 한페이지에 10개 표시 한다는 전제하에 10의배수보다 많으면 마지막페이지 +1
			if (count % 10 != 0) {
				lastpage = (count / 10) + 1;
			} else {
				lastpage = count / 10;
			}
			for (int pageNum = dp1; pageNum <= lastpage; pageNum++) {
			%>
			<li><a href="Morereview.jsp?npage=<%=pageNum%>"><%=pageNum%></a></li>
			<%
			}
			%>
		</ul>
	</div>
</body>
</html>