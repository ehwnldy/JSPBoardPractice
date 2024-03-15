<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

function CheckForm() {
	var mid = document.userForm.mid.value;
	if (mid == ""){
		alert("아이디를 입력하라");
		document.userForm.mid.focus();
		return false;
	}
	//아이디 영문자만 허용 및 10자 이상 체크
	if (!/^[a-zA-Z]+$/.test(mid)) {
		alert("아이디는 영문자로만 입력할 수 있습니다.");
		document.userForm.mid.focus();
		return false;
	}
	if (mid.length < 8) {
		alert("아이디는 8자 이상이어야 합니다.");
		document.userForm.mid.focus();
		return false;
	}
	
	//핸드폰 11자리 숫자만 허용
	var phone = document.userForm.mPhone.value;
	if (!/^[0-9]{11}$/.test(phone)) {
		alert("핸드폰은 11자리 숫자로만 입력할 수 있습니다.");
		document.userForm.mPhone.focus();
		return false;
	}
			
	//비밀번호 유효성 검사 추가
	var password = document.userForm.passwd.value;
	if (!/^[a-zA-Z0-9&^]+$/.test(password)) {
		alert("비밀번호는 영어 소문자, 숫자, &, ^ 만 가능합니다.");
		document.userForm.passwd.focus();
		return false;
	}

	//비밀번호 2개 일치 체크
	var p1 = document.userForm.passwd.value;
	var p2 = document.userForm.passwd1.value;
	
	if(p1 != p2){
		alert("비밀번호가 일치하지 않습니다.");
		return false;
	}
	document.userForm.submit();
}



function CheckForm2() {
	document.scoreForm.submit();
}
</script>
<body>
회원가입

		<form action="UserInsertOK.jsp" method="post" name="userForm" >
				<p>	아이디 : <input type="text" name="mid" value=""> <br>
					아이디 8자리 이상<br>
				<p>	비번 : <input type="password" name="passwd" value=1234><br>
					비밀번호 영어 소문자, 숫자, &, ^ 만 가능<br>
				<p>	비번확인 : <input type="password" name="passwd1" value=1234><br>
				
				<p>	이름 : <input type="text" name="mName" value="배상현"> <br>
				
				<p>	핸드폰 : <input type="text" name="mPhone" value=01033332222><br>
				숫자만 입력가능 <br>
				<p>	성별 : <input type="radio" name="mDev" value="1" checked >남
							<input type="radio" name="mDev" value="2">여<br>
				
				<p>	주소 : <input type="text" name="mAddr" value="서울"> <br>
				
				<input type="button" value="확인" onclick="CheckForm()">
		</form>

</body>
</html>
