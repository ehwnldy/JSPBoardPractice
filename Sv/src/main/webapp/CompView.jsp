<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Component View

<%
	request.setCharacterEncoding("UTF-8");

	String sId = request.getParameter("mId");
	String sPwd = request.getParameter("mPwd");
	String sEmail = request.getParameter("mEmail");
	String sNum = request.getParameter("mNum");
	String sCheck = request.getParameter("mCheck");
%>
<br>
아이디 : <%=sId %> <br>
비밀번호 : <%=sPwd %> <br>
이메일 : <%=sEmail %> <br> 
숫자 : <%=sNum %> <br>
체크 : <%=sCheck %> <br>

</body>
</html>