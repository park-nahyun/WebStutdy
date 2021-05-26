<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	// 이전 페이지(Test.java → 서블릿)로부터 데이터 수신(result → getAttribute())
	String str = (String)request.getAttribute("result");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test2_result.jsp</title>
</head>
<body>

<div>
	<h1>최종 결과값 수신(Test2_result.jsp)</h1>
	<hr>
</div>

<div>
	<h3><%=str%></h3>
</div>
</body>
</html>