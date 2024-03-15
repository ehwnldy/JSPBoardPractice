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
	request.setCharacterEncoding("UTF-8");

	String sNick = request.getParameter("mNick");
	String sLoginMail = request.getParameter("mLoginMail");
	String sUrl = request.getParameter("mUrl");
	
	String sEmail = sLoginMail+"@"+sUrl;
	
%>

별명 : <%=sNick %> <br>
이메일 : <%=sEmail %> <br>


=============<br>
가위바위보<br>

<form action="rspResult.jsp" method="post">
	나는 : <input type="radio" name="mRsp" value="1" >가위
	<input type="radio" name="mRsp" value="2" >바위
	<input type="radio" name="mRsp" value="3" >보<br>
	<input type="hidden" name="sNick" value=<%=sNick %>>
	시작 <input type="submit"> <br>
</form>

=============<br>

</body>
</html>