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
	<hr>
	<!-- 해당 코드는 톰캣9.0까지 호환  -->
<%
	String sID = request.getParameter("User");
%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	//MySQL에 연결자
	Connection MyConn = null;
	Statement MyStmt = null;
	PreparedStatement MyPstmt = null;
	ResultSet rs = null;
	
	String sName = ""; // 선언을 외부 블럭에 하여 스코프(확장)

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
	
	
	String sql = "select * from tbl_userinfo ";
	sql += " where vId = '"+sID+"' ";

	MyStmt = MyConn.createStatement();
	rs = MyStmt.executeQuery(sql);
	
	
	while(rs.next()){
		sName = rs.getString("vName");
	}
}

catch (SQLException ex){
	out.println("DB 연결 에러. <br>)");
	out.println("SQLException: " + ex.getMessage());
	ex.printStackTrace();
}
finally{

}
%>
	
	<form action="BBSWriteOK.jsp" name= "fileForm" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="mTitle" value="test"> <br><br>
		작성자 : <%=sName %><br><br>
		내용 : <input type="text" name="mContent" value="내용">
		파일선택 : <input type="file" name="fileName">
		<hr>
		<input type="submit" value="OK">
		<input type="hidden" name="mID" value=<%=sID %>>
	</form>
	
<%


%>

</body>
</html>