<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.test.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
   String pageNum = request.getParameter("pageNum");

   Connection conn = DBConn.getConnection();
   BoardDAO dao = new BoardDAO(conn);
   
   //result 값 분기는 작성 안해도 됨
   int result = dao.updateData(dto);
   
   DBConn.close();

   response.sendRedirect(cp + "/Article.jsp?pageNum=" + pageNum + "&num=" + dto.getNum());

%>