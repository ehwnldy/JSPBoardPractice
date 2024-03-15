<%@page import="javax.swing.text.Document"%>
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
	String sId = request.getParameter("mId");
	String sPwd = request.getParameter("mPwd");
	String sIsPwd = request.getParameter("mIsPwd");
	String sDate = request.getParameter("mDate");
	String sNum = request.getParameter("mNum");
	String [] sHabit = request.getParameterValues("mHabit");
	
	String sNum1 = sNum.substring(0,3);
	String sNum2 = sNum.substring(3,7);
	String sNum3 = sNum.substring(7,11);
	
	String nIsPwd = "";
	
	String sYear = sDate.substring(0,4);
	int sAge = 2023 - Integer.parseInt(sYear);

	if(sPwd.equals(sIsPwd)){
		nIsPwd = "입력한 비번 2개가 동일합니다.";
	}
	else{
		nIsPwd = "입력한 비번 2개가 다릅니다.";
		out.println(sIsPwd);
	}
	
	
	String mFirstNum = request.getParameter("nFirstNum");
	String mSecondNum = request.getParameter("nSecondNum");
	
	
	%>
	
	아이디 : <%=sId %> <br>
	비번 : <%=sPwd %> <br>
	비번확인 <%=nIsPwd %> <br>
	핸드폰 :<%=sNum1 %> - <%=sNum2 %> - <%=sNum3 %> <br>
	나이 : <%=sAge %> 세 <br>
	취미 : <% 
	if (sHabit != null){
		for(int i = 0 ; i < sHabit.length ; i++){
			out.println(sHabit[i]);
		}
	}
	
	
	%> <br>
	
	
	계산기 <br>
	<form action="ResNCalcu.jsp" name="MainForm">
	
		<input type="text" name="nFirstNum" size ="4"> 
		
		<select name="nOper">
			<option  value="1"> + </option>
			<option  value="2"> - </option>
			<option  value="3"> * </option>
			<option  value="4"> / </option>
		
		</select>   
		
		<input type="text" name="nSecondNum" size ="4"> <br>
		
		<input type="hidden" name= "mId" value = <%=sId %>>
		<input type="hidden" name= "mPwd" value = <%=sPwd %>>
		<input type="hidden" name= "mIsPwd" value = <%=sIsPwd %>>
		<input type="hidden" name= "mDate" value = <%=sDate %>>
		<input type="hidden" name= "mNum" value = <%=sNum %>>
		<input type="hidden" name= "mHabit" value = <%=sHabit %>>
		<input type="hidden" name= "sOper"  >
		<input type="hidden" name="mHabit" value = <%=sHabit %>>
		 <br>
		<%
			
		%>
		<input type="submit" value="제출">
	</form>
	
	
</body>
</html>