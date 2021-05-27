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
<title>Test02.jsp</title>
<link rel="stylesheet" type="style/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) if문 실습</h1>
	<hr>
</div>
<div>
	<!-- form 태그에서 action 속성을 생략할 경우
	     전송하는 데이터의 수신처는 자기 자신이다. -->
	<form>
		정수 : <input type="text" name="su"><br><br>
		<button type="submit" class="btn"
		style="width: 120px; font-size: 16pt;">결과확인</button>
	</form>
</div>

<div>
	<%-- <h2>${param.su }</h2> --%> <!-- 그냥 su면 getAttribute param.su는 getParameter -->
	
	<%-- 『<c:if test=""></c:if>』 : JSTL Core if 문 --%>
	<%-- 『test=""』 : 조건식 지정, 파라미터로 수신한 su 값에 값이 있으면... --%>
	<%-- 『param.su』: EL을 활용한 폼 전송 데이터 수신하는 부분 --%>
	
	<c:if test="${!empty param.su }"> <%-- 수신한 값이 없다면 null이 아니라 empty --%>	
		<c:if test="${param.su % 2 == 0 }">
			<h2>${param.su } : 짝수</h2>
		</c:if>
	
		<c:if test="${param.su % 2 != 0 }">	<%-- else가 존재하지 않는다 --%>
			<h2>${param.su } : 홀수</h2>
		</c:if>
	</c:if>

</div>


</body>
</html>