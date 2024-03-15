<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%  //세션 처리
	String sSessionId = (String) session.getAttribute("nid");
	String sSessionPwd = (String) session.getAttribute("passwd");
	
	// 세션이 끊기는 조건 == 시간초과, 브라우저(전체)가 닫힘
	session.setMaxInactiveInterval(60*10);
	
	if (sSessionId == null){ %>
		<script type="text/javascript">
			alert("먼저 로그인하세요");
			location.href="../MainControl/index.jsp"
		</script> <%
	}
	
	
	/* 
	<form action ="jsp 파일" method = "post">
	*/
%>

<% //넘어온 값 저장
	request.setCharacterEncoding("UTF-8");

	String mId = request.getParameter("DB_ID");
	String mPwd = request.getParameter("DB_PWD");
	String mName = request.getParameter("DB_NAME");
	String mPhone = request.getParameter("mPhone");
	String mDev = request.getParameter("mDev");
	String mAddr = request.getParameter("mAddr");
	
	
%>

<% //DB 연결,  SQL작성,  실행

Connection MyConn = null;
Statement MyStmt = null;
PreparedStatement MyPstmt = null;


try{
	//db 접속
	String sUrl = "jdbc:mysql://localhost:3306/mydatabase";
	String sUser = "root";
	String sPassword = "abcd1234";
	Class.forName("com.mysql.jdbc.Driver");
	
	MyConn = DriverManager.getConnection(sUrl, sUser, sPassword);
	out.println("데이터베이스 연결이 성공했습니다.<br>");
	
	String sql = "UPDATE tbl_userinfo SET vPwd=?, vName=?, vNum=?, vGen=?, vAddr=?, dRegDate=NOW() WHERE vId=?";
	
	
	MyPstmt = MyConn.prepareStatement(sql);
	
    MyPstmt.setString(1, mPwd);
    MyPstmt.setString(2, mName);
    MyPstmt.setString(3, mPhone);
    MyPstmt.setString(4, mDev);
    MyPstmt.setString(5, mAddr);
    MyPstmt.setString(6, mId);
	
	
	MyPstmt.executeUpdate();
	
	//response.sendRedirect("../");
	

		
}catch (SQLException ex){
	out.println("DB 연결 에러. <br>)");
	out.println("SQLException: " + ex.getMessage());
	ex.printStackTrace();
}
finally{
	if(MyConn != null) MyConn.close();
	out.println("DB연결해제.<br>");
}




	//회원 정보 수정으로 가서 확인
%>

<h1>회원 정보 수정 확인</h1>

<p> 아이디 : <%=mId %></p>
<p> 비밀번호 : <%=mPwd %></p>
<p> 이름 : <%=mName %></p>
<p> 전화번호 : <%=mPhone %></p>
<p> 성별 : <%=mDev %></p>
<p> 주소 : <%=mAddr %></p>

</body>
</html>