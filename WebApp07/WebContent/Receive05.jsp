<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 이전 페이지(Send05.html)로부터 데이터 수신
	request.setCharacterEncoding("UTF-8");
	
	String dan = request.getParameter("dan");
	int num = 0;
    String gugudan = "";
    
    try
    {
    	num = Integer.parseInt(dan);
    	
    	for (int i=1 ; i<=9 ; i++)
    	{
    		gugudan += String.format("%d * %d = %d<br>", num, i, num * i); 
    	}
    }
    catch(Exception e)
    {
    	System.out.println(e.toString());
    }	
    // ※ 추후에는 수신된 데이터를... 쿼리문을 통해 DB에 입력하는
    //    과정 등이 포함될 것임을 염두하여 작업을 진행할 수 있도록 하자
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type = "text/css">
	span {color: blue; font-weight: : bold; font-size: 15pt;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>
<div>
	<h2>구구단 출력</h2>
	<hr>
</div>
<div>
	<span><%= gugudan %></span>
	<br><br>
</div>
</body>
</html>