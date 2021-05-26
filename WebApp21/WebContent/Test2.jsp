<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test2.jsp</title>
</head>
<body>

<div>
	<h1>서블릿에서 데이터 흐름 관찰</h1>
	<hr>
</div>

<div>
	<!-- 폼에서 구성한 값을 test2 → Test2.java 로 전송하며 페이지를 요청 -->
	<form action="<%=cp%>/test2" method="post">
		이름 <input type="text" name="name"><br>
		나이 <input type="text" name="age"><br>
		<button type="submit">확인</button>
	</form>
</div>
</body>
</html>