<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVCSample02.jsp</title>
</head>
<body>

<div>
	<h1>MVC 관련 실습 3</h1>
	<hr>
</div>

<div>
	<!-- 컨트롤러(MVCSample02.java)로부터 수신한 결과 -->
	<ul>
		<c:forEach var="i" items="${ lists}">
			<li>
				${i }
			</li>
		</c:forEach>
	</ul>
</div>
</body>
</html>