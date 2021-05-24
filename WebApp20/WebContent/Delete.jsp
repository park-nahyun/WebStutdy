<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>

<%	
   // Delete.jsp
   
   int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("pageNum");

   Connection conn = DBConn.getConnection();
   BoardDAO dao = new BoardDAO(conn);
   
   
   int result = dao.deleteData(num);
   
   // result의 결과 값에 따라 분기 처리 가능
   
   DBConn.close();

   response.sendRedirect(cp + "/List.jsp?pageNum=" + pageNum);
%>


</head>
<body>

<div>
	<h1>큰주제</h1>
	<hr>
</div>

<div>
	<h2>작은주제</h2>
	<form>
	</form>
</div>

</body>
</html>