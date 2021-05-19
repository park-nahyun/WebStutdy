<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	// 쿠키는 증발하기 때문에 파괴는 못함
	// 쿠키 정보가 없는 채로 덮어쓰기 하는 것
	
	Cookie killCookie = new Cookie("cookie_test", null); // 이름을 쿠키 테스트, 값을 널..
	//-- 비어있는 내용으로 기존의 쿠키를 덮어쓰기 하는 개념
	
	killCookie.setMaxAge(0);
	response.addCookie(killCookie); 
	//-- 처음 쿠키를 구성할 때도 『addCookie()』로 처리하였기 때문에
	//   삭제할 때에도(덮어쓰기 할 때에도) 『addCookie()』로 처리해야 안정적으로 삭제됨. (다른 방법 쓰지마)
	
	// ※ 여기서 쿠키 삭제는 클라이언트 입장에서의 삭제이다.
	//    한 명의 클라이언트가 쿠키를 삭제했다고 해서
	//    다른 클라이언트들의 쿠키도 삭제되면 안되기 때문에...
	//    이 쿠키의 정보는 로컬 PC 에서 (브라우저가) 컨트롤 한다.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestRemoveCookie.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>쿠키 정보 삭제하기</h1>
	<hr>
</div>

<div>
	<h2>성공적으로 쿠키를 지웠습니다~!!!!</h2>
</div>

<div>
	<a href="TestSetCookie.jsp"><button type="button" class="btn">쿠키 정보 설정</button></a>
	<a href="TestGetCookie.jsp"><button type="button" class="btn">쿠키 정보 확인</button></a>
</div>
</body>
</html>