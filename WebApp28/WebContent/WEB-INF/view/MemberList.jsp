<%@page import="com.test.mvc.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main">
</head>
<body>

<div>
	<h1>회원 출력 페이지</h1>
	<h2>MemberList.jsp</h2>
	<hr>
</div>

<div>
	<table class="table">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
		</tr>
		
		<c:forEach var="dto" items="${lists}">
		<tr>
			<td style="text-align: center;">${dto.memberId }</td>
			<td style="text-align: center;">${dto.memberPw }</td>
			<td style="text-align: center;">${dto.name }</td>
			<td style="text-align: center;">${dto.tel }</td>
			<td style="text-align: center;">${dto.email }</td>
		</tr>
		</c:forEach>
	</table>
	
	<a href="memberinsertForm"><button type="button">회원등록</button></a>
</div>

</body>
</html>