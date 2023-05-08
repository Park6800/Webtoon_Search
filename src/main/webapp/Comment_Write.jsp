<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Object ID_ = session.getAttribute("user_id");
String ID_value = (String) ID_; 

String title_ = "";
if (request.getParameter("title") != null) {
	title_ = (String) (request.getParameter("title"));
}
%>
<form method="post" action="reviewwrite_Servlet">
	<input type="text" name="User_id" value="<%=ID_value %>">
	<input type="text" name="Title" value="<%=title_ %>">
	<input type="text" name="Commnet_title">
	<input type="text" name="Comment">
	<button type="submit">게시하기</button>
</form>
</body>
</html>