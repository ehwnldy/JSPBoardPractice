<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<form action="GameStart.jsp" method="post" name="MainForm">
		가위바위보 로그인 <br>
		<input type="hidden" name = "isRedirect" value = "0">
		<p> 이름 : <input type="text" value="BaeSangHyun" name="mName">
		<p> 전화번호 
		<select name="mNum1">
			<option value="010"> 010 </option>
			<option value="031"> 031 </option>
			<option value="032"> 032 </option>
		</select> 
		 - <input type="text" name="mNum2" value="5693" size="5"> - <input type="text" name="mNum3" value="3669" size = "5" >
		 <p>로그인 : <input type="submit"> <br>
	</form>
</body>
</html>