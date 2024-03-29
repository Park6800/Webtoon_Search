<%@page import="org.apache.jasper.tagplugins.jstl.core.Remove"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="DataClass.WebtoonData"%>
<%@page import="DataClass.ReviewData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="DB.DB_Conn"%>
<%@page import="DataClass.CountData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resource/css/home.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<title>웹툰 서치</title>
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
	<div class="main_body">
		<div class="body_container">
			<div class="img_in">
				<div class="swiper-container first">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img src="resource/img/배너1.png" class="top_banner">
						</div>
						<div class="swiper-slide">
							<img src="resource/img/배너2.png" class="top_banner">
						</div>
						<div class="swiper-slide">
							<img src="resource/img/배너3.png" class="top_banner">
						</div>
						<div class="swiper-slide">
							<img src="resource/img/배너4.png" class="top_banner">
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
							<div class="login_like_none">로그인 이후 사용 가능 합니다.</div>
							<%
							} else {
							%>
							<div class="right_in">
							<div class="login_like">
								<%
								List<CountData> likedWebtoons = new DB_Conn().getLikedWebtoons(ID_value);
								for (CountData data : likedWebtoons) {
									String title = data.getTITLE();
								%>
								<a href="Detail.jsp?title=<%=title%>" class="Like_link"> 제목
									: <%=title%>
								</a>
								<hr>
								<%
								}
								%>
							</div>
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
				<div class="login_container"> 
					기존 이용자
				</div>
				<div class="login_in">
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
						<div class="find_id">
							<a href="Find_id.jsp">아이디 찾기</a>
						</div>
						<div class="find_pw">
							<a href="Find_pw.jsp">비밀 번호 찾기</a>
						</div>
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
									<a href="My_info.jsp">내 정보 보기</a>
								</div>
							</div>
						</div>
						<hr>
						<div class="mt-30">
							<a href="Logout.jsp" class="color_black">로그아웃</a> <a
								href="Delete.jsp" class="color_black">회원탈퇴</a>
						</div>
					</div>
					<%
					}
					%>
					</div>
				</div>
				<div class="Write_review_list">
					<%
					if (ID_value == null) {
					%>
					<h3 class="h2_display">내가 남긴 리뷰 목록</h3>
					<div class="Write_in">
					<div class="more_review_list_not_loign">로그인 이후 사용 가능합니다.</div>
					</div>
					<%
					} else {
					%>
					<h3 class="h3_display">내가 남긴 리뷰 목록</h3>
					<div class="Write_in">
					<%
					List<ReviewData> Write_Review_List = new DB_Conn().Review_comment_(ID_value);
					for (ReviewData data : Write_Review_List) {
						String title = data.getCOMMENT_TITLE();
						String date = data.getDATA();
					%>
					<div class="review_list">
						<div>
							<a href="Comment_.jsp?comment=<%=data.getCOMMENT_TITLE()%>"
								class="color_b">
								<div class="review_item">
									<div class="review_head">
										<%=data.getCOMMENT_TITLE()%>
									</div>
									<div class="review_date">
										<%=data.getDATA().substring(0, 10)%>
									</div>
								</div>
							</a>
						</div>
					</div>
					<%
					}
					%>
					</div>
					<div class="more_review_list">
						<a href="Morereview.jsp">더보기</a>
					</div>
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
	<div class="container_pick">
		<div>
			<h2>랜덤 픽</h2>
		</div>
		<div class="live_recomend">
			<%
			if (ID_value == null) {
			%>
			<div class="pick_after">
				<div class="pick_list_a">
					<div class="more_review_list_not_loign">
						<div>로그인 이후 사용 가능합니다.</div>
					</div>
				</div>
			</div>
			<%
			} else {
			List<WebtoonData> Random_webtoon_list = new DB_Conn().Random_pick(ID_value);
			for (WebtoonData data : Random_webtoon_list) {
				String title = data.getTITLE();
				String genre = data.getGENRE();
				String url = data.getURL();
			%>
			<form method="post" action="updata_Servlet">
				<button class="pick">
					<input type="hidden" value="<%=title%>" name="Title">
					<div class="pick_list_b">
						<div class="pick_img">
							<img src="<%=url%>" class="pick_imgs">
						</div>
						<div class="book_introduction">
							<div class="book_title">
								제목 :
								<%=title%></div>
							<div class="book_genre">
								장르 :
								<%=genre%></div>
						</div>
					</div>
					</a>
				</button>
			</form>
			<%
			}
			}
			%>
		</div>
	</div>
	<footer>
		<div class="footer_fot">
			<ul>
				<li>고객 센터</li>
				<li>이용 약관</li>
				<li>개인 정보 처리 방침</li>
				<li>쿠키 설정</li>
				<li>회사 정보</li>
			</ul>
		</div>
		<div class="reserved">이미지 제공 : Naver , KakaoPage</div>
		<div class="reserved">© 2023. Park Jun Beom. All
			rights reserved.</div>
	</footer>
</body>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="resource/js/home.js"></script>
<script src="resource/js/swiper.js"></script>
</html>