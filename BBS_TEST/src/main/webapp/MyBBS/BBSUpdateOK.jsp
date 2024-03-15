<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	//MySQL에 연결자
	Connection MyConn = null;
	Statement MyStmt = null;
	PreparedStatement MyPstmt = null;
	ResultSet myRs = null;
	String seq = request.getParameter("seq");
	String sTitle = request.getParameter("mTitle");
	String sContent = request.getParameter("mContent");

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
	
	out.println(sTitle);
	out.println(sContent);
	out.println(seq);
	
	String sql = "UPDATE tbl_BBSInfo SET vTitle=?, vContent=? WHERE nSeq=?";
	
	
	MyPstmt = MyConn.prepareStatement(sql);
	
    MyPstmt.setString(1, sTitle);
    MyPstmt.setString(2, sContent);
    MyPstmt.setString(3, seq);

	
	
	MyPstmt.executeUpdate();
	
}

catch (SQLException ex){
	out.println("DB 연결 에러. <br>)");
	out.println("SQLException: " + ex.getMessage());
	ex.printStackTrace();
}
finally{

}
%>
</body>
</html>