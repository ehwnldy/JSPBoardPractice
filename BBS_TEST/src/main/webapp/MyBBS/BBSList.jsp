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
<% //DB ����,  SQL�ۼ�,  ����

Connection MyConn = null;
Statement MyStmt = null;
Statement MyBBSStmt = null;
PreparedStatement MyPstmt = null;
ResultSet myRs = null;
int nTotalCount = 0; // ��ü �Խù� ����
int nTotalPage = 0; // ��ü ������ ����
int nPageSize = 5; // �� ȭ�鿡 ǥ�õ� �Խñ��� ��
String sPageNo = request.getParameter("pageno");
int nCurrentPage = 1;  // ���� ������ �ʱ�ȭ
int nStartNo = 0;
int nEndNo = 0;
if (sPageNo != null) // �Ѱܹ��� ������ ���� ������ �ִٸ� �� ������ currentPage�� ����
	nCurrentPage = Integer.parseInt(sPageNo);

try{
	// �Խ����� ����� ���� ���� ���
	/*
	pageSize : input 
	totalCount : select
	currentPage : currentPage > totalPage ? totalPage : currentPage;  �̷��� ����ϴ� ������ ���� �������� ��Ż �������� �Ѿ �� �ִ븦 ��Ż�������� ����
	totalPage : (totalCount - 1) / pageSize + 1
	startNo : (cuttentPage -1) * pageSize
	endNo : startNo + pageSize - 1
	endNO = endNo > totalCount ? totalCount : endNo;  �̷��� ����ϴ� ������ ���� �������� ��Ż �������� �Ѿ �� �ִ븦 ��Ż�������� ����
	StartPage : (currentPage -1) / 10 * 10 + 1
	enbPage : endPage = startPage + 9
	endPage = endPage > totalPage ? totalPage : endPage  �̷��� ����ϴ� ������ ���� �������� ��Ż �������� �Ѿ �� �ִ븦 ��Ż�������� ����
	*/
	

	//db ����
	String sUrl = "jdbc:mysql://localhost:3306/mydatabase";
	String sUser = "root";
	String sPassword = "abcd1234";
	Class.forName("com.mysql.jdbc.Driver");
	
	MyConn = DriverManager.getConnection(sUrl, sUser, sPassword);
	out.println("�����ͺ��̽� ������ �����߽��ϴ�.<br>");
	
	String sql = "select count(*) as Total from tbl_bbsinfo; ";
	MyStmt = MyConn.createStatement();
	myRs = MyStmt.executeQuery(sql);
	
	if(myRs.next()){
		nTotalCount = myRs.getInt("Total");
	}
	nTotalPage = (nTotalCount - 1)/ nPageSize +1; // ��ü ������ ����
%>

	<h1> ����Ʈ </h1>
	<div>
		���� ������ : <%=nCurrentPage %>, ��ü �Խù� ���� : <%=nTotalCount %>, ��ü ������ ���� : <%=nTotalPage %>,
	</div>
	<table border="1" width = "600">
		<tr>
			<th width="50">��ȣ</th>
			<th width="200">����</th>
			<th width="50">��ȸ��</th>
			<th width="300">�ۼ���</th>
		</tr>


<%	
	nStartNo = (nCurrentPage - 1) * nPageSize; // ������ ���� ���۹�ȣ
	if ( (nStartNo + nPageSize) > nTotalCount ){ // ������ ������ ó��
		nEndNo = nTotalCount - nStartNo;
	}
	else{
		nEndNo = nPageSize;
	}

	// ������ �ݺ������� ȭ�鿡 ǥ��
	sql = "SELECT * FROM tbl_bbsinfo ORDER BY dRegdate DESC LIMIT " + nStartNo +  " , "  + nEndNo +  " ; "  ;
	MyBBSStmt = MyConn.createStatement();
	myRs = MyBBSStmt.executeQuery(sql);
	// ������ ǥ�� ���� �ʱ�ȭ
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
	out.println("DB ���� ����. <br>)");
	out.println("SQLException: " + ex.getMessage());
	ex.printStackTrace();
}
finally{
	if(MyConn != null) MyConn.close();
	out.println("DB��������.<br>");
}
%>


	</table>
	
	<!-- ������ �׺���̼� -->
	<div>
		<a href="BBSList.jsp?pageno=1">[ó������]</a>
		
<% 
	if(nCurrentPage > 1) { 
%>
        <a href="BBSList.jsp?pageno=<%= nCurrentPage - 1 %>">[����]</a>
        
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
        <a href="BBSList.jsp?pageno=<%= nCurrentPage + 1 %>">[����]</a>
<% 
    } 
%>
		 
		 
		  
		<a href="BBSList.jsp?pageno=<%=nTotalPage%>">[����������]</a> 
	</div>
</body>
</html>