<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hap.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습</h1>
	<hr>
	<p>Hap.jsp ● → Hap_ok.jsp</p>
</div>

<div>
	<!-- action 속성 지정 시 『Hap_ok.jsp』로 지정해도 되고
		『/WepApp05/Hap_ok.jsp』형태로 지정해도 된다. -->
	<!-- action 속성 생략 시 데이터 전송 및 요청 페이지는 자기 자신-->
	<!-- method 속성 생략 시 전송 및 요청 방식은 get -->
	<form action = "Hap_ok.jsp" method="post">
		정수 1 : <input type="text" name="su1" class="txt"><br>
		정수 2 : <input type="text" name="su2" class="txt"><br>
		<br>
		
		<input type="submit" value="결과 확인" class="btn">
	</form>
</div>
</body>
</html>