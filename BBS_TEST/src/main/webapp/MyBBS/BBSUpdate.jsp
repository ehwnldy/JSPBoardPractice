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
	String sTitle = ""; // DB���� ����
	String sId = ""; // DB���� ����
	String sContent = ""; // DB���� ����
	
	
	try {
		//MySQL ��������
			String sUrl = "jdbc:mysql://localhost:3306/mydatabase";
			String sUser = "root";
			String sPassword = "abcd1234";
			//jdbc.Driver �� �ε�
			Class.forName("com.mysql.jdbc.Driver");
			
			//MySQL�� �����ϴ� �޼ҵ��̸� ����� MyConn(������)�� ����
			MyConn = DriverManager.getConnection(sUrl, sUser, sPassword);
			out.println("�����ͺ��̽� ������ �����߽��ϴ�.<br>");
			
			
			
		}
		catch (SQLException ex){
			out.println("DB ���� ����. <br>)");
			out.println("SQLException: " + ex.getMessage());
			ex.printStackTrace();
		}
		finally{
	
	}
%>
 <!-- �Խñ� ���� �ڵ�� BBSWrite.jsp �� �����Ͽ� BBSUpdateOK.jsp�� �����ϱ�  -->
	<form action="BBSUpdateOK.jsp?seq=<%=seq%>" name= "fileForm" method="post" enctype="multipart/form-data">
		���� : <input type="text" name="mTitle" value=" <%=sTitle %>   "> <br><br>
		�ۼ��� : <%=sId %><br><br>
		���� : <input type="text" name="mContent" value=" <%=sContent %>  ">
		<input type="hidden" name = "Seq" value=<%=seq%> >
		<hr>
		<input type="submit" value="OK">
	</form>

</body>
</html>