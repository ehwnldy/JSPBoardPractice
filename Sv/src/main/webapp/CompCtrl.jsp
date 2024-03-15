<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	====================== <br>
	<form action="main.jsp" method="post" name="mainForm">
		로그인 <br><br>
		별명 : <input type="text" name="mNick" size="10" autofocus="autofocus" value="배상현" > <br>
		이메일 : <input type="text" name="mLoginMail" placeholder="이메일 입력" value="BaeSH" size="5"> @
		<select name="mUrl" size="1" >
			<option value="daelim.ac.kr">대림대 메일</option>
			<option value="daum.net">다음 메일</option>
			<option value="naver.com">네이버 메일</option>
		</select> <br>
		로그인 : <input type="submit"> <br>
	</form>
	====================== <br>
	COMPONENT CONTROL
	
	<%
		// 1.form tag 설정
		// 2.form tag 속성 입력
		// 3.모든 conponent에 name 부여  이상이 컨트롤페이지의 역할 mvc 중 c
	%>
	
	<form action="CompView.jsp" method="post" name="ctrlForm" >  <!-- Post, Get의 차이는 전송한 데이터를 단순 보여주기에는 GET이 적합(수정하지 않음, 마우스클릭, 목록보여주기) 외에는 POST(로그인)  가져오다, 수행하다.-->
	<p> 입력 : <input type="text" name="mId" size="10" value="BaeSangHyun" > </p> <br>
	<p> 비밀번호 : <input type="password" name="mPwd" required="required" style="background-color: yellow" value="12341"> </p> <br>
	<p> 이메일 : <input type="email" name="mEmail" placeholder="이메일 입력" value="aa@email.com"> </p> <br>
	<p> 숫자 : <input type="number" name="mNum" value="2"> </p> <br>
	<p> 체크 : <input type="checkbox" name="mCheck" value="checked"> </p> <br>
	<p> 초기화 : <input type="reset"> </p> <br>
	<p> 전송 : <input type="submit"> </p> <br>
	</form>
	
	
	<p> 라디오1 : <input type="radio" checked="checked"> </p> <br>
	<p> 라디오2 : <input type="radio" > </p> <br>
	<p> 전송 : <input type="submit"> </p> <br>
	<p> 초기화 : <input type="reset"> </p> <br>
	<p> 범위 : <input type="range"> </p> <br>
	<p> 날짜 : <input type="date"> </p> <br>
	<p> 색깔 : <input type="color"> </p> <br>
	<p> 숨김 : <input type="hidden">asdasd </p> <br> 
	
	
	<p> <textarea rows="4" cols="30"placeholder="메모나 본문을 입력하세요."></textarea> </p>
	<p> <select name="fruit">
			<option value = "A"> Apple
			<option value = "B" selected="selected">Banana 
			<option value = "O"> Orange
		</select>
	
</body>
</html>