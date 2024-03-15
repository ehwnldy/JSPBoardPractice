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
<%
	request.setCharacterEncoding("utf-8");
    String nid = request.getParameter("mid");
    String passwd = request.getParameter("passwd");
    String mName = request.getParameter("mName");
    String mPhone = request.getParameter("mPhone");
    String mDev = request.getParameter("mDev").equals("1") ? "남" : "여";
    String mAddr = request.getParameter("mAddr");
%>
<h1>회원가입 정보 확인</h1>

<p>아이디 : <%= nid %></p>
<p>비밀번호 : <%= passwd %></p>
<p>이름 : <%= mName %></p>
<p>핸드폰 : <%= mPhone %></p>
<p>성별 : <%= mDev %></p>
<p>주소 : <%= mAddr %></p>


<%
//MySQL에 연결자
Connection MyConn = null;
Statement MyStmt = null;
PreparedStatement MyPstmt = null;

int sDev = mDev.equals("남") ? 1 : 2;

try {
//MySQL 접속정보
	String sUrl = "jdbc:mysql://localhost:3306/mydatabase";
	String sUser = "root";
	String sPassword = "abcd1234";
	//jdbc.Driver 롤 로딩
	Class.forName("com.mysql.jdbc.Driver");
	
	//MySQL에 연결하는 메소드이며 결과물 MyConn(연결자)에 저장
	MyConn = DriverManager.getConnection(sUrl, sUser, sPassword);
	out.println("데이터베이스 연결이 성공했습니다.<br>");
	
	
	String sql = "insert into tbl_userinfo ";
	sql += " (vId, vPwd, vName, vNum, vGen, vAddr, dRegDate) ";
	sql += " values ";
	/* sql += " ('사용자77', '비밀번호77', '이아아', '01056934775', 1, '서울시 강동구', now()) "; */
	
	/* sql += "('" + nid + "', '" + passwd + "', '" + mName + "', '" + mPhone + "', " +
               (mDev.equals("남") ? 1 : 2) + ", '" + mAddr + "', NOW())";
	
	MyStmt = MyConn.createStatement();
	MyStmt.executeUpdate(sql); */
	
	// preparedStatement의 쿼리문 질의 방식 ?를 사용 이름 그대로 먼저컴파일방식
/* 		Statement: SQL 쿼리 문자열을 문자열로 구성하므로 복잡한 쿼리나 긴 쿼리의 가독성이 떨어질 수 있습니다.
		PreparedStatement: SQL 쿼리 문자열에 파라미터를 사용하여 가독성이 향상되며, 쿼리의 구조를 더 명확하게 파악할 수 있습니다.
*/ 

	sql += "(? ,? ,? ,? ,?, ?, NOW())";
	
	MyPstmt = MyConn.prepareStatement(sql);
	MyPstmt.setString(1, nid);
	MyPstmt.setString(2, passwd);
	MyPstmt.setString(3, mName);
	MyPstmt.setString(4, mPhone);
	MyPstmt.setInt(5, sDev);
	MyPstmt.setString(6, mAddr);
	
	
	MyPstmt.executeUpdate();
	
	
	
	
}

catch (SQLException ex){
	out.println("DB 연결 에러. <br>)");
	out.println("SQLException: " + ex.getMessage());
	ex.printStackTrace();
}
finally{
	if(MyConn != null) MyConn.close();
	out.println("DB연결해제.<br>");
	session.setAttribute("nid", nid);
	session.setAttribute("passwd", passwd);
	response.sendRedirect("../MainControl/index.jsp");
}
%>


</body>
</html>