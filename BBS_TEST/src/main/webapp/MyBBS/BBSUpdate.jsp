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
	Connection MyConn = null;
	Statement MyStmt = null;
	PreparedStatement MyPstmt = null;
	ResultSet myRs = null;
	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq");
	String sTitle = ""; // DB에서 받음
	String sId = ""; // DB에서 받음
	String sContent = ""; // DB에서 받음
	
	
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
			
			
			
		}
		catch (SQLException ex){
			out.println("DB 연결 에러. <br>)");
			out.println("SQLException: " + ex.getMessage());
			ex.printStackTrace();
		}
		finally{
	
	}
%>
 <!-- 게시글 수정 코드는 BBSWrite.jsp 를 참고하여 BBSUpdateOK.jsp를 제작하기  -->
	<form action="BBSUpdateOK.jsp?seq=<%=seq%>" name= "fileForm" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="mTitle" value=" <%=sTitle %>   "> <br><br>
		작성자 : <%=sId %><br><br>
		내용 : <input type="text" name="mContent" value=" <%=sContent %>  ">
		<input type="hidden" name = "Seq" value=<%=seq%> >
		<hr>
		<input type="submit" value="OK">
	</form>

</body>
</html>