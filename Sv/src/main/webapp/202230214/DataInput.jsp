<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="ResNCalcu.jsp" method="post" name="MainForm">
		아이디 : <input type="text" name="mId" value ="BaeSangHyun" ><br>
		비밀번호 : <input type="password" name="mPwd" value="qlalfqjsgh"><br>
		비번확인 : <input type="password" name="mIsPwd" ><br>
		핸드폰 : <input type="text" name= "mNum" maxlength="11" value="01056933669">	<br>
		생년월일 :	<input type="text" name="mDate" value="20010406" maxlength="8"  >	<br>
		취미 :<input type="checkbox" name="mHabit" value="Music" > 음악,
		 	<input type="checkbox" name="mHabit" value="PT" >운동 ,
		 	<input type="checkbox" name="mHabit" value="Movie">영화 <br><br>
		 	<input type="hidden" name="mFirstNum" value="0">
		 	<input type="hidden" name="mSecondNum" value="0">
		<input type="submit" value="제출"> 
	</form>
</body>
</html>