<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="../MyStudy/MyStart.jsp">시작하기</a> <br>
	
	<a href="../MyEX/DataInput.jsp">중간고사</a> <br>
	
	<%
		String sSessionId = (String) session.getAttribute("nid");
		String sSessionPwd = (String) session.getAttribute("passwd");
		session.setMaxInactiveInterval(60*10);

	%>
	<%
		if (sSessionId != null){
			out.println("세션에 저장된 ID : " + sSessionId + "<BR>");
			out.println("세션에 저장된 PWD : " + sSessionPwd + "<BR>");
			
			%>
			<a href="../MyUser/UserUpdate.jsp">회원수정</a> <BR>
			<a href="http://localhost:8080/BBS_TEST/MyBBS/BBSList.jsp">게시판 목록</a> <BR>
			<a href="http://localhost:8080/BBS_TEST/MyBBS/BBSWrite.jsp?User=<%=sSessionId%>">게시물 작성</a> <BR>
			<a href="../MyUser/LogOut.jsp">로그아웃</a>
			<%
		}else{ %>
			<a href="../MyUser/UserInsert.jsp">회원가입</a>
			<form action="../MyUser/LoginOk.jsp" method="get" name="MainForm">
			로그인<br>
			<p>아이디 : <input type="text" name="mId" size = 10> </p>
			<p>비밀번호 : <input type="text" name="mPwd" size = 10> </p>
			<p><input type="submit"> </p>
		</form>
		<%
		}
	
	// 게시판을 만들기 위한 변수 계산
	/*
	pageSize : input 
	totalCount : select
	currentPage : currentPage > totalPage ? totalPage : currentPage;  이렇게 사용하는 이유는 현재 페이지가 토탈 페이지를 넘어갈 시 최대를 토탈페이지로 고정
	totalPage : (totalCount - 1) / pageSize + 1
	startNo : (cuttentPage -1) * pageSize
	endNo : startNo + pageSize - 1
	endNO = endNo > totalCount ? totalCount : endNo;  이렇게 사용하는 이유는 현재 페이지가 토탈 페이지를 넘어갈 시 최대를 토탈페이지로 고정
	StartPage : (currentPage -1) / 10 * 10 + 1
	enbPage : endPage = startPage + 9
	endPage = endPage > totalPage ? totalPage : endPage  이렇게 사용하는 이유는 현재 페이지가 토탈 페이지를 넘어갈 시 최대를 토탈페이지로 고정
	*/
	%>
	
	
	
	
</body>
</html>