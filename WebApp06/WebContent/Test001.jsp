<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <%@ page buffer="8kb" autoFlush="true" %> --%> <!-- 기본 속성 구성 -->
<%-- <%@ page buffer="1kb" autoFlush="false" %> --%> <!-- 에러발생 -->
<!-- 페이지에 대한 디렉티브를 작성하겠다 
	 페이지에 대한 임시 기억 공간을 1kb로 설정.
	 autoFlush는 꽉차면 내보내는 것.. 한 번에 보내는 것
	 buffer가 있는 스트림에서는 autoFlush 명시해야 함
	 buffer가 없는 스트림에서는 autoFlush 명시할 필요 없음
	 그런데 우리는 buffer 용량 줄이고 쭉 밀어내는 걸 꺼둠
	 -->
	 
	<%--  <%@ page buffer="10kb" autoFlush="false" %> --%> <!-- 정상처리 -->
	<%@ page buffer="1kb" autoFlush="true" %>	 <!-- 정상처리 -->
	
	 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test001.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>page 디렉티브 buffer 속성 및 autoFlush 실습</h1>
	<hr>
</div>

<div>
	<h2>반복문 구성</h2>
	<%
	for(int i=1; i<=1000; i++)
	{
	%>1234<%		/* 도큐먼트 영역 안 1234 */
	}
	%>
	
	<form>
	</form>
</div>
</body>
</html>