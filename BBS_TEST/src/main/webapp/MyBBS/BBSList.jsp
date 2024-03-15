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
<% //DB 연결,  SQL작성,  실행

Connection MyConn = null;
Statement MyStmt = null;
Statement MyBBSStmt = null;
PreparedStatement MyPstmt = null;
ResultSet myRs = null;
int nTotalCount = 0; // 전체 게시물 개수
int nTotalPage = 0; // 전체 페이지 개수
int nPageSize = 5; // 한 화면에 표시될 게시글의 수
String sPageNo = request.getParameter("pageno");
int nCurrentPage = 1;  // 현재 페이지 초기화
int nStartNo = 0;
int nEndNo = 0;
if (sPageNo != null) // 넘겨받은 페이지 선택 정보가 있다면 그 정보를 currentPage에 저장
	nCurrentPage = Integer.parseInt(sPageNo);

try{
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
	

	//db 접속
	String sUrl = "jdbc:mysql://localhost:3306/mydatabase";
	String sUser = "root";
	String sPassword = "abcd1234";
	Class.forName("com.mysql.jdbc.Driver");
	
	MyConn = DriverManager.getConnection(sUrl, sUser, sPassword);
	out.println("데이터베이스 연결이 성공했습니다.<br>");
	
	String sql = "select count(*) as Total from tbl_bbsinfo; ";
	MyStmt = MyConn.createStatement();
	myRs = MyStmt.executeQuery(sql);
	
	if(myRs.next()){
		nTotalCount = myRs.getInt("Total");
	}
	nTotalPage = (nTotalCount - 1)/ nPageSize +1; // 전체 페이지 개수
%>

	<h1> 리스트 </h1>
	<div>
		현재 페이지 : <%=nCurrentPage %>, 전체 게시물 개수 : <%=nTotalCount %>, 전체 페이지 개수 : <%=nTotalPage %>,
	</div>
	<table border="1" width = "600">
		<tr>
			<th width="50">번호</th>
			<th width="200">제목</th>
			<th width="50">조회수</th>
			<th width="300">작성일</th>
		</tr>


<%	
	nStartNo = (nCurrentPage - 1) * nPageSize; // 가지고 오는 시작번호
	if ( (nStartNo + nPageSize) > nTotalCount ){ // 마지막 페이지 처리
		nEndNo = nTotalCount - nStartNo;
	}
	else{
		nEndNo = nPageSize;
	}

	// 데이터 반복문으로 화면에 표시
	sql = "SELECT * FROM tbl_bbsinfo ORDER BY dRegdate DESC LIMIT " + nStartNo +  " , "  + nEndNo +  " ; "  ;
	MyBBSStmt = MyConn.createStatement();
	myRs = MyBBSStmt.executeQuery(sql);
	// 페이지 표시 변수 초기화
	int nSeq = 0;
	String sTitle = "";
	int nView = 0;
	String sRegDate = "";
	
	while(myRs.next()){
		nSeq = myRs.getInt("nSeq");
		sTitle = myRs.getString("vTitle");
		nView = myRs.getInt("nView");
		sRegDate = myRs.getString("dRegDate");
		%>
				<tr>
			<td><%=nSeq %></td>
			<td><a href="BBSUpdate.jsp?seq=<%=nSeq%>"> <%=sTitle %> </a></td>
			<td><%=nView %></td>
			<td><%=sRegDate %></td>
		</tr>	
		<%
		
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


	</table>
	
	<!-- 페이지 네비게이션 -->
	<div>
		<a href="BBSList.jsp?pageno=1">[처음으로]</a>
		
<% 
	if(nCurrentPage > 1) { 
%>
        <a href="BBSList.jsp?pageno=<%= nCurrentPage - 1 %>">[이전]</a>
        
<% 
    } 
%>
		
<% 
	for(int i = 1; i <= nTotalPage; i++) { 
%>
        <a href="BBSList.jsp?pageno=<%= i %>"><%= i %></a>
<%  
	}
%>
    
<% 
	if(nCurrentPage < nTotalPage) { 
%>
        <a href="BBSList.jsp?pageno=<%= nCurrentPage + 1 %>">[다음]</a>
<% 
    } 
%>
		 
		 
		  
		<a href="BBSList.jsp?pageno=<%=nTotalPage%>">[마지막으로]</a> 
	</div>
</body>
</html>