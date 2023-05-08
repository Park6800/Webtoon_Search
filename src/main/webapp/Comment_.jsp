<%@page import="DB.DB_Conn"%>
<%@page import="DataClass.ReviewData"%>
<%@page import="java.util.List"%>
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
	String comment = "";
	if (request.getParameter("comment") != null) {
		comment = (String) (request.getParameter("comment"));
	}
	ReviewData Review_List = new DB_Conn().Review_comment_Write(comment);

		Object title_ = Review_List.getCOMMENT_TITLE();
		String Title_ = (String) title_;
		Object detail_ = Review_List.getCOMMENT();
		String Review = (String) detail_;
		Object day_ = Review_List.getDATA();
		String Date_ = (String) day_;

	%>
	<div><%=Title_%></div>
	<div><%=Review %></div>
	<div><%=Date_ %></div>
	
	
</body>
</html>