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
	request.setCharacterEncoding("UTF-8");
	
	String nIsRedirect = request.getParameter("isRedirect");
	String sName = request.getParameter("mName");
	String sNum1 = request.getParameter("mNum1");
	String sNum2 = request.getParameter("mNum2");
	String sNum3 = request.getParameter("mNum3");
	String sTotalNum = sNum1 + "-" + sNum2 + "-" + sNum3;
	
	String sUser = request.getParameter("mRsp");
	String sUserFinal = "";
	String sComFinal = "";
	String sResult = "";
	int nCom =  (int)(Math.random()*3)+1;
	// 총 횟수를 선언 후 폼으로 넘긴다 그 후 초기화된 총 횟수 변수 밑에 request문으로 stotalcount로 불러온 후 계속 저장한다 이 모든 문은 0으로 선언한 이후에 실행한다 else문 안에 하면 좋겠지?
	// 아래 초기화가 페이지 전달시 계속 실행되기에 문제가 발생함 이를 히든으로 로그인 페이지에서 0을 전달하고 이 페이지에서 라다이렉트 시 1을 전달하면 됨
	int mTotalCount = 0;
	int mWinCount = 0;
	int mWinRate = 0;
	
	
	%>
	
	<% 
	if (sUser == null){ sUserFinal = "없음"; sComFinal = "없음";}
	else{
		int nUserFinal = Integer.parseInt(sUser);
		
		String sTotalCount = request.getParameter("nTotalCount");
		mTotalCount = Integer.parseInt(sTotalCount);
		mTotalCount = mTotalCount + 1;
		
		String sWinCount = request.getParameter("nWinCount");
		mWinCount = Integer.parseInt(sWinCount);
		
	
		
	    if (nUserFinal == 1){
	        sUserFinal = "가위"; 
	    }
	    else if (nUserFinal == 2){
	        sUserFinal = "바위"; 
	    }
	    else if (nUserFinal == 3){
	        sUserFinal = "보";   
	    }	
	    
	    if (nCom == 1){
	        sComFinal = "가위"; 
	    }
	    else if (nCom == 2){
	        sComFinal = "바위"; 
	    }
	    else if (nCom == 3){
	        sComFinal = "보";   
	    }	
	    
		if(nUserFinal==nCom ){
			sResult = "비김";
		}
		else if ( (nUserFinal==1 && nCom==2) || (nUserFinal==2 && nCom==3) || (nUserFinal==3 && nCom==1)){
			sResult = "컴퓨터 승";
			
			
		}
		else{
			sResult = "사용자 승";
			mWinCount = mWinCount + 1;
		}
		
		mWinRate = (int)(((double)mWinCount / mTotalCount) * 100);

	}
	%>
	
	이름 : <%=sName %> <br>
	전화번호 : <%=sTotalNum %> <br>
	<br><br>
	
	<p>가위바위보 결과   <%=mTotalCount %>/<%=mWinCount %>>/<%=mWinRate  %><br>
	<%=sName %> 선택 : <%=sUserFinal %> <br>
	컴퓨터 선택 : <%=sComFinal %> <br>
	결과 : <%=sResult %><br><br>
	<%=nIsRedirect %>
	
	<form action="GameStart.jsp" method="post" name="MainForm">
	<p>가위바위보 시작<br>
	<!--3항 연산자 조건 ? 참일시 : 거짓일시  -->
	<input type="radio" name="mRsp" value="1" <%= "가위".equals(sUserFinal) ? "checked" : "" %>>가위
	<input type="radio" name="mRsp" value="2" <%= "바위".equals(sUserFinal) ? "checked" : "" %>>바위
	<input type="radio" name="mRsp" value="3" <%= "보".equals(sUserFinal) ? "checked" : "" %>>보
	<input type="hidden" name="mName" value=<%=sName %>>
	<input type="hidden" name="mNum1" value=<%=sNum1 %>>
	<input type="hidden" name="mNum2" value=<%=sNum2 %>>
	<input type="hidden" name="mNum3" value=<%=sNum3 %>>
	<input type="hidden" name="nTotalCount" value = <%=mTotalCount %>>
	<input type="hidden" name="nWinCount" value = <%=mWinCount %>>
	<input type="hidden" name="isRedirect" value = "1">
	

	
	<p>시작 <input type="submit"> <br>

	</form>

</body>
</html>