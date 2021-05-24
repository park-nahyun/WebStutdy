<%@page import="com.util.DBConn"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
	// Created_ok.jsp
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 게시물 현재 상태의 최대값 얻어오기
	int maxNum = dao.getMaxNum();
	
	// 게시물 번호 최대값에 1을 더해서 set 하기
	dto.setNum(maxNum+1);
	
	// ipaddress set 하기
	dto.setIpAddr(request.getRemoteAddr());
	
	// 데이터베이스 액션 처리
	dao.insertData(dto);
	
	
	// List.jsp 요청할 수 있도록 안내하기
	response.sendRedirect("List.jsp");
	
	
%>