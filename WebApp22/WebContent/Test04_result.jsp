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
<title>Test04_result.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) forEach문을 이용한 자료구조 활용 실습</h1>
	<hr>
</div>

<div>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
		
		<!-- 
		for (MyData dto : request.getAttribute("lists"))
		{
		} 
		-->
		
		<!-- 컬렉션 객체를 처리하기 위한 반복문 구성 -->
		<%-- 『<c:forEach var="dto" items="${lists }"></c:forEach>』 --%>
		<c:forEach var="dto" items="${lists }">
		<!-- items : 컬렉션(자료구조)이 들어감. 이걸 하나 꺼내서 변수에 담겠다. -->
		<tr>
			<td style="text-align: center;">${dto.name }</td>
			<td style="text-align: center;">${dto.age }</td>
			<!-- 원래는 private이기 때문에 getter를 사용해야 한다. 
			     그러나 dto.name 이렇게 쓰면 el이 알아서 getter 메소드 호출-->
		</tr>
		</c:forEach>
		
	</table>
</div>
</body>
</html>