<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>


<%
	request.setCharacterEncoding("UTF-8");
	String sLogId = request.getParameter("mId");
	String sLogPwd = request.getParameter("mPwd");
%>


	
<%
	Connection MyConn = null;
	Statement MyStmt = null;
	ResultSet MyRs = null;
	int nLoginResult = 0; // 1 = 로그인 성공, -1 = 아이디 없음, -2 = 비밀번호틀림 
try{
	String sUrl = "jdbc:mysql://localhost:3306/mydatabase";
	String sUser = "root";
	String sPassword = "abcd1234";
	//jdbc.Driver 롤 로딩
	Class.forName("com.mysql.jdbc.Driver");
	
	MyConn = DriverManager.getConnection(sUrl, sUser, sPassword);
	out.println("데이터베이스 연결이 성공했습니다.<br>");
	
	String sql = "SELECT * FROM tbl_userinfo ";
	sql += "WHERE vId = '" + sLogId + "'";
	
	MyStmt = MyConn.createStatement();
	MyStmt.executeQuery(sql);
	
	MyRs = MyStmt.executeQuery(sql);
	
	
	
	 if (MyRs.next()) {
         String sDB_ID = MyRs.getString("vId");
         String sDB_Pwd = MyRs.getString("vPwd");

         if (sDB_ID.equals(sLogId) && sDB_Pwd.equals(sLogPwd)) {
             out.println("로그인 성공");
             
         	session.setAttribute("nid", sLogId);
        	session.setAttribute("passwd", sLogPwd);
            response.sendRedirect("../MainControl/index.jsp");
             
             
         } else {
             out.println("로그인 실패:비밀번호가 일치하지 않습니다.");
             nLoginResult = -2;
             response.sendRedirect("../MainControl/index.jsp");
         }
     } else {
         out.println("로그인 실패: 해당 아이디가 존재하지 않습니다.");
         nLoginResult = -1;
         response.sendRedirect("../MainControl/index.jsp");
     }
	
	
	
	
	
}
catch(SQLException ex){
	out.println("DB 연결 에러. <br>)");
	out.println("SQLException: " + ex.getMessage());
	ex.printStackTrace();
}
finally{
	if(MyConn != null) MyConn.close();
	if(MyStmt != null) MyStmt.close();
	out.println("DB연결해제.<br>");
	
	
}

%>

	로그인 아이디 : <%=sLogId %> <br>
	로그인 비밀번호 : <%=sLogPwd %> <br>

	
</body>
</html>