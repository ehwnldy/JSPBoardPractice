<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("utf-8"); //한글 처리용
		String sName = request.getParameter("mName");
		if (sName == null){
				response.sendRedirect("GameLogin.jsp");
		}	
		String sTel_1 = request.getParameter("mTel_1");
		String sTel_2 = request.getParameter("mTel_2");
		String sTel_3 = request.getParameter("mTel_3");
		String sSaveTel = sTel_1 + sTel_2 + sTel_3;
		String sShowTel = sTel_1 + "-" + sTel_2 + "-" + sTel_3;
%>

<%
		int nUser = 0;
		int nCom = 0;
		String sResult = "";		
		int nTotalNo = 0;  // 총 실행 횟수
		int nUserWinNo = 0;  // 사용자가 이긴  횟수
		int nUserWinRate = 0;	
		if ( (sName != null) && (sTel_1 == null)   ) {// 가위바위보 할때만 실행되야 됨
				
				
				// 중요함 
				String sTotalNo = request.getParameter("mTotalNo"); 
				nTotalNo  = Integer.parseInt(sTotalNo);  // 문자를 숫자로
				nTotalNo = nTotalNo + 1;
				
				String sUserWinNo = request.getParameter("mUserWinNo");
				nUserWinNo  = Integer.parseInt(sUserWinNo);  // 문자를 숫자로
				
				//1. 사용자가 선택한 값 저장 (1:가위 , 2:바위, 3:보)
				String sUser = request.getParameter("mRadio");
				nUser  = Integer.parseInt(sUser);  // 문자를 숫자로
				//2. 컴퓨터가 추출한 값 저장 ( 1,2,3 중에서 랜덤하게 추출 : 
				nCom = ((int)(Math.random()*3))+1;
				
				//3. nUser 와	nCom 으로 결과 유출
				if (nUser==1){
						if (nCom == 1){
							sResult = "비김";
						}
						else if (nCom == 2){
							sResult = "컴퓨터 승";
						}
						else if (nCom == 3){
							sResult = sName + "승";
							nUserWinNo = nUserWinNo + 1;
						}
				}
				else if (nUser==2){
						if (nCom == 1){
							sResult = sName + "승";
							nUserWinNo = nUserWinNo + 1;
							
						}
						else if (nCom == 2){
							sResult = "비김";
						}
						else if (nCom == 3){
							sResult = "컴퓨터 승";
						}
				}
				else if (nUser==3){
					if (nCom == 1){
						sResult = "컴퓨터 승";
					}
					else if (nCom == 2){
						sResult = sName + "승";
						nUserWinNo = nUserWinNo + 1;
						
					}
					else if (nCom == 3){
						sResult = "비김";
					}
				}
				
				nUserWinRate = (int)(((double)nUserWinNo / nTotalNo) * 100);
		}
			
	%>
		이름 : <%=sName %> <br>
		전화번호 : <%=sShowTel%> <br>
		<br>
		
		<p>	가위바위보 결과  <br>
		<%=sName %> 선택 : <%=nUser %> <br>
		컴퓨터 선택 : <%=nCom %><br>
		결과 :  <%=sResult %> <br>	<br>


		<p>	실행 결과  <br>
		총 실행횟수 :  <%=nTotalNo %> <br>
		<%=sName %>이 이긴 횟수 : <%=nUserWinNo %>  회 <br>
		<%=sName %>의 승률 : <%=nUserWinRate %>   % <br><br>
		
		
		<p>	가위바위보 시작  <br>
		<form action="GameStart.jsp" method="post" name="MainForm" >
				<input type=hidden name="mTotalNo" value="<%=nTotalNo %>" >
				<input type=hidden name="mUserWinNo" value="<%=nUserWinNo %>" >
				<input type=hidden name="mName" value="<%=sName %>" >
				<%				
				if (nUser == 1){
				%>	
					<input type=radio name="mRadio" value="1" checked>가위
					<input type=radio name="mRadio" value="2" >바위
					<input type=radio name="mRadio" value="3" >보 <br>
				<%
				}
				else if (nUser == 2){
				%>
					<input type=radio name="mRadio" value="1" >가위
					<input type=radio name="mRadio" value="2" checked>바위
					<input type=radio name="mRadio" value="3" >보 <br>
				<%
				}
				else if (nUser == 3){
				%>
					<input type=radio name="mRadio" value="1" >가위
					<input type=radio name="mRadio" value="2" >바위
					<input type=radio name="mRadio" value="3" checked>보 <br>
				<%
				}
				else{
				 %>
					<input type=radio name="mRadio" value="1" >가위
					<input type=radio name="mRadio" value="2" >바위
					<input type=radio name="mRadio" value="3" >보 <br>
				<%
				}
				%>				 
				<p>	시작 <input type="submit" ><br>
		</form>
</body>
</html>