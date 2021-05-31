<%@page import="com.test.mvc.MemberDTO"%>
<%@page import="com.test.mvc.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	response.sendRedirect("memberlist");
%>