<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	request.setAttribute("message", "안녕하세요.");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10_for.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 10</h1>
	<hr>
</div>

<div>
	<h2>포워드</h2>
</div>

<div>
	<p>이름 : <%=userName %></p>
	<!-- ※ 포워드 -->
	<jsp:forward page="Receive10.jsp"></jsp:forward>
</div>
</body>
</html>