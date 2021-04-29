<%@ page contentType="text/html; charset=UTF-8"%>
<% 
   // 이전 페이지(Gugudan.jsp)로부터 데이터 수신 (→ 스크립트 릿 영역)
   // request 객체의 getParameter() 메소드 활용 → 이름(name) 식별자
   
    String danStr = request.getParameter("dan");
	int n = 0;
	
	try
	{
	   n = Integer.parseInt(danStr);
	}
	catch (Exception e)
	{
	   System.out.println(e.toString());
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p> Gugudan.jsp → Gugudan_ok.jsp ●</p>
</div>

<!-- html 주석문 
얘는 서블릿 컨테이너 문에 보임.
즉 이것마저도 도큐먼트 그릴 때 그려짐
이 문서 그대로 전달되는게 아니라 이거보고 그린게 전달된다!!--> 
<%-- JSP 주석문 
서블릿 눈에 보이지 않음--%>

<%-- <%
	for(int i=1; i<=9; i++)
	{%>
		<%=n %> * <%=i %> = <%= n*i %><br>
	<%}
%> --%>

<%
	for(int i=1; i<=9; i++)
	{
		out.print(n + " + " + i + " = " + (n*i) + "<br>");
	}
%>
</body>
</html>