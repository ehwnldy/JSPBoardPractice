<%@page import="org.apache.naming.java.javaURLContextFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- 바디태그 실행시 myFunction함수 실행 (like init) -->
<body onload = "myFunction()">

시작!!
<br>

<!-- %! == 메소드 선언 -->
<%!
	String makeItLower(String data){
		return data.toLowerCase();
}
%>

<!-- html -->
<p> 아이디 : <input type="text" name="">  </p>
<p> 패스워드 : <input type="text" name="">  </p>
<br><br>

<script type="text/javascript">
	/* js */
	function myFunction() {
		alert("onload 이벤트 발생함!!");
		//document.body.style.background = "gray";
	}
</script>

<br><br>

<%
	/* java */
	int a = 2;
	int b = 3;
	int sum = a + b;
	out.println(sum);
		
	out.println("hello CANDY");
%>

<br>
<!-- 표현식 %=! == 결과값 출력  -->
<p> 현재 일시 : <%=new java.util.Date()%></p>
<br><br><br>
1. 대림대학교 : <a href="https://www.daelim.ac.kr/intro.do">[바 로 가 기]</a>
<br>	
<img alt="고양이사진" src="../MyImages/MyStudy/cat.jpg" >


</body>
</html>