<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test002.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>include 디렉티브 실습</h1>
	<hr>
</div>

<%@include file="Test003.jsp" %>

<div>
	<%=str %><br>
	<%=name %><br>
</div>
</body>
</html>