<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/css/signup.css">
</head>
<body>
	<div class="back_img">
		<div class="main_body">
				<div><a href="Home.jsp">홈으로 이미지</a></div>
		<div class=sub_body>
			<div class="Top_letter">
				<h2>회원가입</h2>
			</div>
				<form method="post" action="signServlet">
					<div class="input_value">
					<h4>아이디</h4>
					<input type="text" placeholder="영문자, 숫자 포함 8자 이상" class="input_info" name="Id_value">
					</div>
					<div class="input_value">
					<h4>비밀번호</h4>
					<input type="password" placeholder="영문자, 숫자, 특수문자 포함 10자 이상" class="input_info" name="Pw_value">
					</div>
					<div class="input_value">
					<h4>이름</h4>
					<input type="text" placeholder="이름을 입력해 주세요" class="input_info" name="Name_value">
					</div>
					<div class="input_value">
					<h4>생년월일</h4>
					<input type="text" placeholder="생년 월일 8자를 입력해주세요" class="input_info" name="Birth_value">
					</div>
					<div class="input_value">
					<h4>성별</h4>
					<select class="input_info" name="Gender_value">
						<option disabled="disabled" selected="selected">선택 안함</option>
						<option value="남" name="Gender_value">남자</option>
						<option value="여" name="Gender_value">여자</option>
					</select>
					</div>
					<div class="input_value">
					<button type="submit" class="input_info">가입하기</button>
					</div>
				</form>
			</div>
			</div>
	</div>
</body>
</html>