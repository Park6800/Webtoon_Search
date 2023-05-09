<%@page import="DataClass.ReviewData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DB.DB_Conn"%>
<%@page import="DataClass.CountData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resource/css/home.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<title>전자 도서</title>
</head>

<body>
	<%
	Object ID_ = session.getAttribute("user_id");
	String ID_value = (String) ID_;
	Integer ADMIN_ = (Integer) session.getAttribute("admin");
	%>
	<nav>
		<div class="top-nav">
			<div class="top-nav-left">도서관</div>
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
	<div class="main_body">
		<div class="body_container">
			<div class="img_in">
				<div class="swiper-container first">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img src="resource/img/book1-001.png" class="top_banner">
						</div>
						<div class="swiper-slide">
							<img src="resource/img/book1-002.png" class="top_banner">
						</div>
						<div class="swiper-slide">
							<img src="resource/img/book1-001.png" class="top_banner">
						</div>
						<div class="swiper-slide">
							<img src="resource/img/book1-002.png" class="top_banner">
						</div>
					</div>
					<div class="swiper-button-next">
						<i class="icon-angle3-right"></i>
					</div>
					<div class="swiper-button-prev">
						<i class="icon-angle3-left"></i>
					</div>
				</div>
			</div>
			<div class="con-right">
				<div class="right_half">
					<div class="live_best">선호 작품</div>
					<div class="like_list">
						<%
						if (ID_value == null) {
						%>
						<div class="login_like">로그인 이후 사용 가능 합니다.</div>
						<%
						} else {
						%>
						<div class="login_like">
							<%
							List<CountData> likedWebtoons = new DB_Conn().getLikedWebtoons(ID_value);
							for (CountData data : likedWebtoons) {
								String title = data.getTITLE();
							%>
							제목 :
							<%=title%>
							<hr>
							<%
							}
							%>
						</div>
						<div class="like_more">
							<a href="MoreLike.jsp">더보기</a>
						</div>
						<%
						}
						%>
					</div>
				</div>
				<div class="right_half_lp">
					기존 이용자
					<%
				if (ID_value == null) {
				%>
					<form class="inline_b" method="post" action="loginServlet">
						<input type="text" class="w_text" placeholder="ID를 입력하세요"
							name="Id" id="input_id"> <input type="password"
							class="w_text" placeholder="PW를 입력하세요" name="Pw" id="input_pw">
						<button type="submit" class="btn_login" onclick="submit_btn()">로그인</button>
					</form>
					<div class="find">
						<div class="find_id">아이디 찾기</div>
						<div class="find_pw">비밀 번호 찾기</div>
					</div>
					<div class="sign_up">
						<a href="Signup.jsp">처음 오셧나요? <span>회원 가입 ></span></a>
					</div>
					<%
					} else if (ID_value != null) {
					%>
					<div class="user">
						<div class="Account">
							<span><%=ID_%></span>님 환영합니다.
						</div>
						<hr>
						<div class="user_img">
							<img src="resource/img/user.png">
							<div class="user_mid">
								<div class="mid">
									<a href="Logout.jsp">로그아웃</a>
								</div>
								<div class="mid">내 정보 보기</div>
							</div>
						</div>
						<hr>
					</div>
					<%
					}
					%>
				</div>
				<div class="Write_review_list">
					<%
					if (ID_value == null) {
					%>
					<h3 class="h2_display">내가 남긴 리뷰 목록</h3>
					<div class="more_review_list_not_loign">로그인 이후 사용 가능합니다.</div>
					<%
					} else {
					%>
					<h3 class="h3_display">내가 남긴 리뷰 목록</h3>
					<%
					List<ReviewData> Write_Review_List = new DB_Conn().Review_comment_(ID_value);
					for (ReviewData data : Write_Review_List) {
						String title = data.getCOMMENT_TITLE();
						String date = data.getDATA();
					%>
					<div class="review_list">
						<div class="review_item">
							<div class="review_head">
								<%=title%>
							</div>
							<div class="review_date">
								<%=data.getDATA().substring(0, 10)%>
							</div>
						</div>
					</div>
					<%
					}
					%>
					<div class="more_review_list">더보기</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
	<div class="sel_genre">
		<form method="post" action="webtoonServlet" id="form"
			onsubmit="return false;">
			<select class="select_view" onchange="chageLangSelect()"
				id="sel_chan" name="Genre">
				<option selected disabled value="">장르 선택</option>
				<option value="스릴러">스릴러</option>
				<option value="로맨스">로맨스</option>
				<option value="로맨스판타지">로맨스판타지</option>
				<option value="현대">현대</option>
				<option value="판타지">판타지</option>
				<option value="무협">무협</option>
				<option value="개그">개그</option>
			</select> <select class="select_view" onchange="chageLangSelect()"
				id="sel_day" name="Day">
				<option selected disabled value="">요일 선택</option>
				<option value="월요일">월요일</option>
				<option value="화요일">화요일</option>
				<option value="수요일">수요일</option>
				<option value="목요일">목요일</option>
				<option value="금요일">금요일</option>
				<option value="토요일">토요일</option>
				<option value="일요일">일요일</option>
			</select>
			<button class="btn_submit" type="submit" id="send">조회</button>
		</form>
	</div>
	<div class="genre">
		<h2>장르</h2>
		<div class="genres">
			<div class="imgs" name="Thriller">
				<div class="genre_"
					onclick="select_genre('Thriller'); change_sel('스릴러');"
					id="Thriller">스릴러</div>
			</div>
			<div class="imgs" name="Romance">
				<div class="genre_"
					onclick="select_genre('Romance'); change_sel('로맨스');" id="Romance">
					로맨스</div>
			</div>
			<div class="imgs" name="Romance_Fantasy">
				<div class="genre_"
					onclick="select_genre('Romance_Fantasy'); change_sel('로맨스판타지');"
					id="Romance_Fantasy">로맨스판타지</div>
			</div>
			<div class="imgs" name="Modern">
				<div class="genre_"
					onclick="select_genre('Modern'); change_sel('현대');" id="Modern">
					현대</div>
			</div>
			<div class="imgs" name="Fantasy">
				<div class="genre_"
					onclick="select_genre('Fantasy'); change_sel('판타지');" id="Fantasy">
					판타지</div>
			</div>
			<div class="imgs" name="Action">
				<div class="genre_"
					onclick="select_genre('Action'); change_sel('무협');" id="Action">
					무협</div>
			</div>
			<div class="imgs" name="Comic">
				<div class="genre_"
					onclick="select_genre('Comic'); change_sel('개그');" id="Comic">
					개그</div>
			</div>
		</div>
	</div>
	<div class="genre">
		<h2>요일</h2>
		<div class="genres">
			<div class="imgs" name="Monday">
				<div class="day_" onclick="select_day('Monday'); change_day('월요일');"
					id="Monday">월요일</div>
			</div>
			<div class="imgs" name="TuesDay">
				<div class="day_"
					onclick="select_day('TuesDay'); change_day('화요일');" id="TuesDay">
					화요일</div>
			</div>
			<div class="imgs" name="WednesDay">
				<div class="day_"
					onclick="select_day('WednesDay'); change_day('수요일');"
					id="WednesDay">수요일</div>
			</div>
			<div class="imgs" name="ThursDay">
				<div class="day_"
					onclick="select_day('ThursDay'); change_day('목요일');" id="ThursDay">
					목요일</div>
			</div>
			<div class="imgs" name="FriDay">
				<div class="day_" onclick="select_day('FriDay'); change_day('금요일');"
					id="FriDay">금요일</div>
			</div>
			<div class="imgs" name="SaturDay">
				<div class="day_"
					onclick="select_day('SaturDay'); change_day('토요일');" id="SaturDay">
					토요일</div>
			</div>
			<div class="imgs" name="SunDay">
				<div class="day_" onclick="select_day('SunDay'); change_day('일요일');"
					id="SunDay">일요일</div>
			</div>
		</div>
	</div>
	<div class="live_recomend">
		<!-- 해당 픽은 당일 당일 설정 페이지 관리자가 설정 -->
		<h2>추천 픽</h2>
		<div class="pick">
			<div class="pick_list">
				<div class="pick_img">
					<img src="resource/img/th.jpg" class="pick_imgs">
				</div>
				<div class="book_introduction">
					<div class="book_genre">장르 : 게임 판타지</div>
					<div class="book_title">제목 : 달빛 조각사</div>
					<div class="book_author">작가 : 남희성</div>
				</div>
			</div>
			<div class="pick_list">
				<div class="pick_img">
					<img src="resource/img/아크.png" class="pick_imgs">
				</div>
				<div class="book_introduction">
					<div class="book_genre">장르 : 게임 판타지</div>
					<div class="book_title">제목 : 아크</div>
					<div class="book_author">작가 : 유성</div>
				</div>
			</div>
			<div class="pick_list">
				<div class="pick_img">
					<img src="resource/img/th.jpg" class="pick_imgs">
				</div>
				<div class="book_introduction">
					<div class="book_genre">장르 : 게임 판타지</div>
					<div class="book_title">제목 : 달빛 조각사</div>
					<div class="book_author">작가 : 남희성</div>
				</div>
			</div>
			<div class="pick_list">
				<div class="pick_img">
					<img src="resource/img/th.jpg" class="pick_imgs">
				</div>
				<div class="book_introduction">
					<div class="book_genre">장르 : 게임 판타지</div>
					<div class="book_title">제목 : 달빛 조각사</div>
					<div class="book_author">작가 : 남희성</div>
				</div>
			</div>
		</div>
	</div>
	<div class="img_banner">
		<img src="resource/img/1610703127371.jpg" class="Img">
		<div class="img_font">이미지 위의 문구</div>
	</div>
	<div class="live_recomend_bot">
		<!-- 신작 , 업데이트 순-->
		<h2>추천 수</h2>
		<div class="pick">
			<div class="pick_list">
				<div class="pick_img">
					<img src="resource/img/th.jpg" class="pick_imgs">
				</div>
				<div class="book_introduction">
					<div class="book_genre">장르 : 게임 판타지</div>
					<div class="book_title">제목 : 달빛 조각사</div>
					<div class="book_author">작가 : 남희성</div>
				</div>
			</div>
			<div class="pick_list">
				<div class="pick_img">
					<img src="resource/img/th.jpg" class="pick_imgs">
				</div>
				<div class="book_introduction">
					<div class="book_genre">장르 : 게임 판타지</div>
					<div class="book_title">제목 : 달빛 조각사</div>
					<div class="book_author">작가 : 남희성</div>
				</div>
			</div>
			<div class="pick_list">
				<div class="pick_img">
					<img src="resource/img/th.jpg" class="pick_imgs">
				</div>
				<div class="book_introduction">
					<div class="book_genre">장르 : 게임 판타지</div>
					<div class="book_title">제목 : 달빛 조각사</div>
					<div class="book_author">작가 : 남희성</div>
				</div>
			</div>
			<div class="pick_list">
				<div class="pick_img">
					<img src="resource/img/th.jpg" class="pick_imgs">
				</div>
				<div class="book_introduction">
					<div class="book_genre">장르 : 게임 판타지</div>
					<div class="book_title">제목 : 달빛 조각사</div>
					<div class="book_author">작가 : 남희성</div>
				</div>
			</div>
		</div>
	</div>

	<footer> </footer>
</body>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="resource/js/home.js"></script>
<script src="resource/js/swiper.js"></script>
</html>