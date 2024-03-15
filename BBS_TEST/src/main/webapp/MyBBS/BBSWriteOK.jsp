<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
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
// 경로를 다르게 지정하는 이유는 사용자가 접근할 수 없게 가상 경로를 만듦
	String realFolder="";
	String saveFolder="upfile"; // 저장할 경로
	
	ServletContext context = this.getServletContext(); // 절대경로를 얻음
	realFolder = context.getRealPath(saveFolder); // saveFolder의 절대경로를 얻음
	
	String testFolder = application.getRealPath("/") + saveFolder;
	
	out.println("1 : " + realFolder + "<br><br>");
	//아래는 application.getRealPath()의 경로 = context.getRealPath()
	//C:\202230214\ServerPrograming(2)\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps
	out.println("2 : " + application.getRealPath("/") + "<br><br>");
	out.println("3 : " + testFolder + "<br><br>");
	
	// 파일 업로드
	
	int sizeLimit = 5 * 1024 * 1024 ; //한 번에 업로드 될 최대 용량 바이트
	
	DefaultFileRenamePolicy MyPolicy = new DefaultFileRenamePolicy();
	MultipartRequest MyMtR = new MultipartRequest(request,realFolder,sizeLimit,"utf-8",MyPolicy);
	
	// 파라미터는 각각 폼에서 가져온 인자 값을 얻기 위해 request객체를 전달
	// 업로드 될 파일의 위치를 입력
	// 파일의 최대 크기를 입력받고 넘어가면 예외 발생
	// 한글 인코딩
	// 중복된 파일의 경우 이름 변환 DefaultFileRenamePolicy
	
	// multipart/form-data 형식으로 전송되었기 때문에 request.getParameter로 수신 불가능 multipartrequest객체의 getParameter사용
	
	String sID = MyMtR.getParameter("mID");
	String sTitle = MyMtR.getParameter("mTitle");
	String sContent = MyMtR.getParameter("mContent");
	
	out.println("제목 : " + sTitle + "<BR>");
	out.println("내용 : " + sContent + "<BR>");
	
	Enumeration<?> myFiles = MyMtR.getFileNames();
	// input type = "file"인 모든 파라미터를 반환
			
	String sOrgFile = "";
	String sSaveFile = "";
	while(myFiles.hasMoreElements()){
		String sMyElement = (String)myFiles.nextElement();
		
	 	sOrgFile = MyMtR.getOriginalFileName(sMyElement);
		sSaveFile = MyMtR.getFilesystemName(sMyElement);
		String sFileType = MyMtR.getContentType(sMyElement);
		File fileUpFile = MyMtR.getFile(sMyElement);
		
		out.print("1. 요청 파라미터명 : " + sMyElement + "<BR>");		
		out.print("2. 실제 파일명 : " + sOrgFile + "<BR>");
		// 이름 중복시 변경하여 저장
		out.print("3. 저장 파일명 : " + sSaveFile + "<BR>");
		out.print("4. 파일 유형 : " + sFileType + "<BR>");
		if(fileUpFile != null){
			long length = MyMtR.getFile(sMyElement).length();
			out.print("5. 파일 크기 : " + length + "<BR>"); //바이트
		}
		

		
	}
%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	//MySQL에 연결자
	Connection MyConn = null;
	Statement MyStmt = null;
	PreparedStatement MyPstmt = null;
	

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
	
	String a;
	
	

	String sql = "INSERT INTO tbl_bbsinfo ";
	sql += "(vTitle, vContent, vID, nView, vSecret, nNotice, dRegdate, vRealFile, vServerFile) ";
	sql += "VALUES ('"+sTitle+"', '"+sContent+"', '"+sID+"', 0, 'F', 0, now(),'"+sOrgFile+"','"+sSaveFile+"')";

	MyStmt = MyConn.createStatement();
	MyStmt.executeUpdate(sql);

	
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