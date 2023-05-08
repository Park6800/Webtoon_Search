<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/css/login.css">
</head>
<body>
<% String Chk = (String)session.getAttribute("chk"); 
		if(Chk =="1"){
			session.removeAttribute("chk");
		%>
		<script>
			alert("존재하지 않는 아이디 입니다.");
		</script>
		
	<%
	session.removeAttribute("chk");}
	else if(Chk == "2"){
		
	%>
	<script>
			alert("비밀번호가 틀립니다.");
		</script>
	<%
	session.removeAttribute("chk");}
	%>
	<div class="body_space">
		<div class="use_space">
			<div class="detail_spcae">
				<h3>로그인</h3>
				<div class="Loign_space">
					<form class="right_login" method="post" action="loginServlet">
						<div class="input_info">ID</div>
						<input type="text" placeholder="8자리 이상 ID를 입력하세요" class="info_value" name="Id" id="input_id">
						<div class="input_info">PW</div>
						<input type="password" placeholder="10자리 이상 특수문자 포함 PW를 입력하세요" class="info_value" name="Pw" id="input_pw">
						<button type="submit" class="login_btn">로그인</button>
					</form>
					<div class="find_info">
						<div class="find_id"><a href="#">아이디 찾기</a></div>
						<div class="find_pw"><a href="#">비밀번호 찾기</a></div>
					</div>
					<div class="sign_up">
						<div>아직 가입한 계정이 없으시다면
							<p><a href="Signup.jsp" class="move_signpage">지금 바로 가입하기</a></p>
						</div>
					</div>
				</div>
				<div class="another_space">
				
				</div>
			</div>
		</div>
	</div>
</body>
</html>