<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); // 이 request는 Send10의 request

	String userName = request.getParameter("userName");
	
	request.setAttribute("message", "반갑습니다.");
	// get, set 한 쌍.. request 객체에 값을 임의로 설정하기 위함
	//-- request 객체의 key(message)의 값 안에
	//   "반갑습니다."를 value 로 넣는 작업 수행
	
	//   ※ 리다이렉트
	response.sendRedirect("Receive10.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10_re.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>


<div>
	<h2>리다이렉트</h2>
</div>

<div>
	<p>이름 : <%=userName %></p>
</div>
</body>
</html>