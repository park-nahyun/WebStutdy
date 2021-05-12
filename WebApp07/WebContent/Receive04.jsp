<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 이전 페이지(Send03.html)로부터 데이터 수신
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	String userCity = request.getParameter("userCity");
	String userGender = request.getParameter("userGender");
	
	String userSubject[] = request.getParameterValues("userSubject");
	
	String str = "";
    
    if (userSubject != null)
    {
    	/* for(String item : userSubject)
    	{
    		str += " [ " + item + " ] ";
    	} */
    	
    	for(int i=0 ; i<userSubject.length ; i++)
    	{
    		str += " [ " + userSubject[i] + " ] ";
    	} 
    }
	
    // ※ 추후에는 수신된 데이터를... 쿼리문을 통해 DB에 입력하는
    //    과정 등이 포함될 것임을 염두하여 작업을 진행할 수 있도록 하자
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type = "text/css">
	span {color: blue; font-weight: : bold; font-size: 15pt;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 04</h1>
	<hr>
</div>

<div>
	<h2>가입 승인 내역</h2>
	<p>회원가입이 완료되었습니다.</p><br>
	<p>회원 ID : <span><%=userId%></span>,</p>
	<p>비밀번호 : <span><%=userPwd%></span>,</p>
	<p>이름 : <span><%=userName%></span>,</p>
	<p>성별 : <span><%=userGender%></span>,</p>
	<p>지역 : <span><%=userCity%></span>,</p>
	<p>전화번호 : <span><%=userTel%></span>,</p>
	<p>수강 과목 : <span><%=str%></span> 입니다.
	
	<br><br>
</div>
</body>
</html>