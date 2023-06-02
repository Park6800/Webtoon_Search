<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹툰 서치 - 아이디 찾기</title>
<link rel="stylesheet" href="resource/css/find.css">
</head>
<body>
<% 
	Object ID_ = session.getAttribute("user_id");
	String ID_value = (String) ID_;
%>
	<div class="body_container">
		<div class="find">
		<div class="img_link">
		<a href="Home.jsp"><img src="resource/img/Logo.png" style="width: 100px"></a>
		</div>
			<div class="find_btn">
				<button><a href="Find_id.jsp">아이디 찾기</a></button><button><a href="Find_pw.jsp">비밀번호 찾기</a></button>
			</div>
			<div class="input_user_info">
				<form method="post" action="findid_Servlet">
					<div class="input_name">
						<h4>이름</h4>
						<input type="text" placeholder="이름을 입력하세요" class="info" name="user_name">
					</div>
					<div class="input_birth">
						<h4>생년월일</h4>
						<input type="text" placeholder="생년월일을 입력하세요" class="info" name="user_birth">
					</div>
					<button type="submit" class="submit_btn">아이디 찾기</button>
				</form>
			</div>
			<%if(ID_value == null) { %>
		<div class="find_id_result">
			
		</div>
		<% } else { %>
		<div class="find_id_result">
			<%=ID_value %>
		</div>
		<%} 
		session.removeAttribute("user_id");
		%>
		</div>
	</div>
</body>
</html>