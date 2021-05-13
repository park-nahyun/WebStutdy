<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 
	
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	String calResult = request.getParameter("calResult");

	int n1 = 0;
	int n2 = 0;
	String result = "";
	
	try
	{
		n1 = Integer.parseInt(num1);
		n2 = Integer.parseInt(num2);
		
		if (calResult.equals("1"))
			result = String.format("%d + %d = %d", n1, n2, (n1+n2));
		else if (calResult.equals("2"))
			result = String.format("%d - %d = %d", n1, n2, (n1-n2));
		else if (calResult.equals("3"))
			result = String.format("%d * %d = %d", n1, n2, (n1*n2));
		else if (calResult.equals("4"))
			result = String.format("%d / %d = %d", n1, n2, (n1/(double)n2));
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	// 실제로 만든 건 옆집 사장이지만 클라이언트는 우리집 사장인 줄 아는..
	// 우리는 send_for을 요청했지만 실제 내용물 제공은 Receive10이 제공하는..
	
	request.setAttribute("resultStr", result); // 객체 형식으로 넘어감

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send10_re.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<div>
	<h1>데이터 송수신 실습 11</h1>
	<hr>
</div>

<div>

	<jsp:forward page="Receive11.jsp"></jsp:forward>

</div>
</body>
</html>