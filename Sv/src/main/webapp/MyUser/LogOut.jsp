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
	session.removeAttribute("nid");
	session.removeAttribute("passwd");
	
	response.sendRedirect("../MainControl/index.jsp");
	%>
</body>
</html>