<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//만약에 hidden으로 넘겼으면 request.getParameter("userName")
	String userName = (String)session.getAttribute("userName");
	String userBirth = (String)session.getAttribute("userBirth");
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	session.removeAttribute("userName");
	session.removeAttribute("userId");
	session.removeAttribute("userBirth");
	session.removeAttribute("userPwd"); // 리무브 해도 상관없음. 이미 값을 담아놨기 때문에

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>세션 처리 내용 확인</h1>
</div>

<div>
	<h2>이름 : <%=userName%> </h2>
	<h2>생일 : <%=userBirth%> </h2>
	<h2>아이디 : <%=userId%> </h2>
	<h2>비밀번호 : <%=userPwd%> </h2>
</div>

</body>
</html>