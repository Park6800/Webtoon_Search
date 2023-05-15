<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/css/delete.css">
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

	
	Object Error = session.getAttribute("error");
	String pw_Chk = (String) Error;
	session.removeAttribute("error");
	
	%>
	<% if(ID_value == null){
		 PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요')");
            script.println("location.href = 'Login.jsp'");
            script.println("</script>");
		} else {
			 if(pw_Chk != null) {
				 PrintWriter script = response.getWriter();
		            script.println("<script>");
		            script.println("alert('비밀번호를 틀렸습니다.')");
		            script.println("location.href = 'Delete.jsp'");
		            script.println("</script>");
			} else {
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
		<div class="container">
			<h2>회원 탈퇴</h2>
		</div>
		<div class="input_container">
			<form method="post" action="delete_Servlet">
				<div class="input_info">
					<h4>ID</h4>
					<input type="text" name="user_id" value=<%=ID_value%> readonly>
				</div>
				<div class="input_info">
					<h4>PW</h4>
					<input type="password" placeholder="탈퇴 할 계정 PW를 입력하세요"
						name="user_pw">
				</div>
				<div class="motion">
					<p>정말 탈퇴하시겠습니까?</p>
					<button type="submit">탈퇴하기</button>
					<a href="Home.jsp">돌아가기</a>
				</div>
			</form>
		</div>
	</div>
	<%
		}}
	%>
</body>
</html>