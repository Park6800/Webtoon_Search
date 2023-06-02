<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹툰 서치 - 회원 가입</title>
<link rel="stylesheet" href="resource/css/signup.css">
<script src="resource/js/signup.js"></script>
</head>

<body>
	<div class="back_img">
		<div class="main_body">
			<div class=sub_body>
				<div class="Top_letter">
					<h2>회원가입</h2>
				</div>
				<form method="post" action="signServlet"
					onsubmit="return validateForm()">
					<div class="input_value">
						<h4>아이디</h4>
						<input type="text" placeholder="영문자, 숫자 포함 8자 이상"
							class="input_info" name="Id_value" id="ID_" onblur="ID_input()">
						<div id="id_inner" class="c_red"></div>
					</div>
					<div class="input_value">
						<h4>비밀번호</h4>
						<input type="password" placeholder="영문자, 숫자, 특수문자 포함 10자 이상"
							class="input_info" name="Pw_value" id="PW_" onblur="PW_input()">
						<div id="pw_inner" class="c_red"></div>
					</div>
					<div class="input_value">
						<h4>이름</h4>
						<input type="text" placeholder="이름을 입력해 주세요" class="input_info"
							name="Name_value" id="NAME_" onblur="NAME_input()">
						<div id="name_inner" class="c_red"></div>
					</div>
					<div class="input_value">
						<h4>생년월일</h4>
						<input type="text" placeholder="생년 월일 8자를 입력해주세요"
							class="input_info" name="Birth_value" id="BIRTH_"
							onblur="BIRTH_input()">
						<div id="birth_inner" class="c_red"></div>
					</div>
					<div class="input_value">
						<h4>성별</h4>
						<select class="input_info" name="Gender_value"
							onblur="GENDER_input()" id="GENDER_">
							<option disabled="disabled" selected="selected" value="0">선택 안함</option>
							<option value="남">남자</option>
							<option value="여">여자</option>
						</select>
						<div id="gender_inner" class="c_red"></div>
					</div>
					<div class="input_value">
						<button type="submit" class="input_info">가입하기</button>
					</div>
				</form>
			</div>
			<div class="img_place">
				<div class="img_link">
					<a href="Home.jsp"><img src="resource/img/Logo.png"
						style="width: 100px">
						<p>홈으로 돌아가기</p></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>