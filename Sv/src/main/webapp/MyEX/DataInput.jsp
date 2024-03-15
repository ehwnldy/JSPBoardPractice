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
		//alert(document.MainForm.mId.value);
		if (document.MainForm.mId.value == ""){
			alert("아이디를 입력하세요.")	;
			document.MainForm.mId.focus();
			return false;
		}
				
 		if (document.MainForm.mPwd.value != document.MainForm.mIsPwd.value){
			alert("비번이 다릅니다.");
			return false;
			
		}

		for(count = 0; count < document.MainForm.mPwd.value.length; count++){
			var ch = document.MainForm.mPwd.value.charAt(count);
			if ((ch < 'A' || ch > 'Z') && (ch < 'a' || ch > 'z') && (ch < '0' || ch > '9')){
				alert("비번은 영문 대문자로만 입력하세요");
				return false;
			}
		}
		
		
		if (isNaN(document.MainForm.mNum.value) ) {
		    alert("핸드폰 번호는 숫자만 가능합니다.");
		    return false;
		}
 		
		window.location.href = "ResNCalcu.jsp";
		
	}
	
</script>

<body>
	
	<form action="ResNCalcu.jsp" method="post" name="MainForm">
		아이디 : <input type="text" name="mId" value ="qotkdgus" ><br>
		비밀번호 : <input type="password" name="mPwd" value="qlalfqjsgh"><br>
		비번확인 : <input type="password" name="mIsPwd" ><br>
		핸드폰 : <input type="text" name= "mNum" maxlength="11" value="01056933669">	<br>
		생년월일 :	<input type="text" name="mDate" value="20010406" maxlength="8"  >	<br>
		취미 :<input type="checkbox" name="mHabit" value="Music" > 음악,
		 	<input type="checkbox" name="mHabit" value="PT" >운동 ,
		 	<input type="checkbox" name="mHabit" value="Movie">영화 <br><br>
		<input type="hidden" name="nOper" value="0">
		<input type="button" value="제출" onclick="CheckForm()">
	</form>
</body>
</html>