<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String userName = request.getParameter("userName");
	String userBirth = request.getParameter("user");
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/Default.css">
</head>
<body>

<div>
	<h1>세션 처리 내용 확인</h1>
</div>

<div>
	<%=userName%>
	<%=userBirth%>
	<%=userId%>
	<%=userPwd%>
</div>

</body>
</html>