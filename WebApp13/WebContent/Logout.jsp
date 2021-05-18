<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Logout.jsp
	
	/* session.removeAttribute("userId");
	session.removeAttribute("userPwd"); */
	//-- 세션의 사용자 아이디와 패스워드 삭제
	
	session.invalidate();
	//-- 기존 세션에 저장되어 있는 모든 항목을 제거하고 세션을 초기화.
	
	// 새롭게 요청할 페이지 안내
	response.sendRedirect("TestSession01.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>