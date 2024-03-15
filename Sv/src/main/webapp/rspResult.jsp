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

	String sUser = request.getParameter("sNick");
	int nUser = Integer.parseInt(request.getParameter("mRsp"));
	
	int nCom =  (int)(Math.random()*3)+1;
	
	String sUserFinal = "";
	String sComFinal = "";
	String sResult = "";
	// 1=가위, 2=바위, 3=보

    if (nUser == 1){
        sUserFinal = "가위"; 
    }
    else if (nUser == 2){
        sUserFinal = "바위"; 
    }
    else if (nUser == 3){
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
			
			
		
	if(nUser==nCom ){
		sResult = "비김";
	}
	else if ( (nUser==1 && nCom==2) || (nUser==2 && nCom==3) || (nUser==3 && nCom==1)){
		sResult = "컴퓨터 승";
	}
	else{
		sResult = "사용자 승";
	}
		
%>


<%=sUser %> : <%=sUserFinal%> <br>
컴퓨터 : <%=sComFinal %> <br>

결과 : <%=sResult %>
</body>

</html>