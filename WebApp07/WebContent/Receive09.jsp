<%@ page contentType="text/html; charset=UTF-8"%>
<%   
   String gugudanStr = request.getParameter("gugudan");
   
   int gugudan = Integer.parseInt(gugudanStr);
   
   String result ="";
   
   for(int i=1; i<=9; i++)
   {
      result += String.format("%d * %d = %d<br>", gugudan, i, gugudan*i);
   }
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive09</title>
</head>
<body>

<div>
   <h1>JSP 를 이용한 데이터 송수신 실습</h1>
   <hr>
</div>

<div>
   <h3>Send09.jsp ○ → Receive09.jsp ●</h3>
</div>

<div>
   <p>수신 데이터 : <%=gugudanStr %></p>
   <p><%=result %></p>
</div>

</body>


</html>