<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<form action="GameStart.jsp" method="post" name="MainForm" >
				가위바위보 로그인 <br>
				<p>	이름 : <input type="text" value="이윤래" name="mName"> <br> 
				<p>	전화번호 : <select name="mTel_1" size="1">
		 										<option value="010">010</option>
		 										<option value="031">031</option>		
		 										<option value="032">032</option>
										</select> -
										<input type="text" value="9981" name="mTel_2" size= "4">-
										<input type="text" value="1072" name="mTel_3" size= "4">
				<p>	로그인 : <input type="submit" ><br>
		</form>

</body>
</html>