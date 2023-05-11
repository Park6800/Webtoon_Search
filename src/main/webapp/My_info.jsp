<%@page import="javax.swing.text.Style"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/css/my_info.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	<%
	session.removeAttribute("Serach_chk");
	if (Chk != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('검색 조건에 맞는 물건이 없습니다')");
		script.println("</script>");
	}
	%>
	<nav>
		<div class="top-nav">
			<div class="top-nav-left">
				<a href="Home.jsp">도서관</a>
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
	<div class="fix_profile_container">
		<div class="in_container">
			<div class="profile">
				<div class="fix_guide">
					<h2>프로필 수정</h2>
					<p>프로필과 개인정보를 수정할 수 있습니다.</p>
				</div>
				<form mathod="post" action="user_info_updata_Servlet">
				<div class="fix_info">
					<table>
						<thead>
							<tr>
								<th class="color_gray"></th>
								<th>내 정보</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th class="color_gray">아이디</th>
								<th><%=ID_value%>
								<input type="hidden" value="<%=ID_value%>">
								</th>
							</tr>
							<tr>
								<th class="color_gray">실명</th>
								<th><%=NAME_value %>
								<div class="none">
								<input type="text" placeholder="변경할 이름을 입력하세요" class="change_info" name="user_name" id="Name">
								</div>
								</th>
							</tr>
							<tr>
								<th class="color_gray">성별</th>
								<th><%=GENDER_value %>
								<div class="none">
								<select class="change_info" name="user_gender" id="Gender">
									<option selected="selected" disabled="disabled">성별을 선택</option>
									<option value="남">남성</option>
									<option value="여">여성</option>
								</select>
								</div>
								</th>
							</tr>
							<tr>
								<th class="color_gray">생년월일</th>
								<th><%=BIRTH_value %>
								<div class="none">
								<input type="text" placeholder="변경할 생년월일 8자리를 입력해주세요" class="change_info" name="user_birth" id="Birth">
								</div>
								</th>
							</tr>
							<tr>
								<th class="color_gray">전화 번호</th>
								<th>+82 10-6***-6***
								<div class="none">
								<input type="text" placeholder="변경할 전화번호를 입력해주세요" class="change_info">
								</div>
								</th>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="fix_btn">
						<button type="button" class="fix_button" id="change_btn">수정</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script src="resource/js/my_info.js"></script>
</html>