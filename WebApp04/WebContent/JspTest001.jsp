<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립트 릿(Scriptlet) 영역
	String name = "이희주";
	name += "는 홍길동이 아니다.";
	
	int result;
	result = 10 + 20;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JspTest001.jsp</title>
</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<h2>박나현</h2>
	<h2><%= name %></h2>	<!-- 이걸 표현식이라고 한다 -->
	<h2></h2>
</div>

</body>
</html>