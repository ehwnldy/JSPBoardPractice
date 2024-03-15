<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
</head>
	<script type="text/javascript">
		function CheckForm() {
			window.location.href="UserUpdateOK.jsp"
		}
	</script>


<body>
	<%
	// 세션이 끊기는 조건 시간초과, 브라우저(전체)가 닫힘
	String sSessionId = (String) session.getAttribute("nid");
	String sSessionPwd = (String) session.getAttribute("passwd");
	session.setMaxInactiveInterval(60*10);
	
	if (sSessionId == null){ %>
		<script type="text/javascript">
			alert("먼저 로그인하세요");
			location.href="../MainControl/index.jsp"
		</script> <%
	}

	%>
	
	<%
	Connection MyConn = null;
	Statement MyStmt = null;
	PreparedStatement MyPstmt = null;
	
	String DB_ID = "";
	String DB_PWD = "";
	String DB_NAME = "";
	String DB_PHONE = "";
	int DB_GEN = 1;
	String DB_ADDR = "";
	
	try{
		//db 접속
		String sUrl = "jdbc:mysql://localhost:3306/mydatabase";
		String sUser = "root";
		String sPassword = "abcd1234";
		Class.forName("com.mysql.jdbc.Driver");
		
		MyConn = DriverManager.getConnection(sUrl, sUser, sPassword);
		out.println("데이터베이스 연결이 성공했습니다.<br>");
		
		String sql = "SELECT * FROM tbl_userinfo WHERE vId = '" + sSessionId + "'";
		
		Statement stmt = MyConn.createStatement();

		ResultSet rs = stmt.executeQuery(sql);
		//select count(*) from tbl_bbsinfo << 가진 레코드의 개수 카운트 함수
		
		 if (rs.next()) {
	         String sDB_ID = rs.getString("vId");
	         String sDB_PWD = rs.getString("vPwd");
	         String sDB_NAME = rs.getString("vName");
	         String sDB_PHONE = rs.getString("vNum");
	         String sDB_GEN = rs.getString("vGen");
	         String sDB_ADDR = rs.getString("vAddr");
	         

	         if (sDB_ID.equals(sSessionId)) {
	             out.println("로그인 성공");
	             DB_ID = sSessionId;
	             DB_PWD = sSessionPwd;
	             DB_NAME = sDB_NAME;
       
	         }else{
	        	out.println("로그인 실패"); 
	         }
	        	 	        	         	 
		 }
 
	             
		
			
	}catch (SQLException ex){
		out.println("DB 연결 에러. <br>)");
		out.println("SQLException: " + ex.getMessage());
		ex.printStackTrace();
	}
	finally{
		if(MyConn != null) MyConn.close();
		out.println("DB연결해제.<br>");
	}

	
	%>
		<H1>회원수정</H1> 
	
		<form action="UserUpdateOK.jsp" method="post" name="userForm" >
				<p>	아이디 : <%=DB_ID %> <br>
				<p>	비번 : <%=DB_PWD %> <br>
				<p>	이름 : <%=DB_NAME %> <br>
				
				<p>	핸드폰 : <input type="text" name="mPhone" value=01033332222><br>
				숫자만 입력가능 <br>
				<p>	성별 : <input type="radio" name="mDev" value="1" checked >남
						  <input type="radio" name="mDev" value="2">여<br>
				
				<p>	주소 : <input type="text" name="mAddr" value="서울"> <br>
				
				<input type="hidden" name="DB_ID" value="<%=DB_ID%>">
   				<input type="hidden" name="DB_PWD" value="<%=DB_PWD%>">
	    		<input type="hidden" name="DB_NAME" value="<%=DB_NAME%>">

				
				<input type="submit" value="확인" >
		</form>
</body>
</html>