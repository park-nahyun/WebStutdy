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
<title>Test07.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) import문 실습</h1>
	<h2>배수 확인하기</h2>
	<hr>
</div>

<div>
	<p> c:import 는 URL 처리에 관여하며,
	URL을 사용하여 다른 자원의 결과를 삽입할 때 사용하게 된다.</p>
</div>
<br>

<!-- 변수 지정(url) -->
<c:set var="url" value="gugudan.jsp"></c:set>

<!-- c:import 활용 -->
<!-- 특정 페이지(Gugudan.jsp)를 import 시키면서 그 페이지에서 필요로 하는 값(dan)을 전송해줄 수 있음 -->
<c:import url="${url }" var="impt">
	<c:param name="dan" value="7"></c:param>
</c:import>

<!-- 결과 화면 출력 -->
<!-- escapeXml="false" 는 클라이언트가 볼 수 있는 형태로 out 시키는 옵션 -->
<c:out value="${impt }" escapeXml="false"></c:out> 

<!-- 결과 화면 출력 -->
<!-- 결과 화면 출력 과정에서 HTML 코드를 함께 출력하는 구문 -->
<!-- escapeXml 속성의 기본값(default)은 true로 설정되어 있다. -->
<c:out value="${impt }"></c:out>

</body>
</html>