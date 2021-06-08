<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	// PostTest02_ok.jsp
	
%>
제목 : <b>${param.title }</b>
<br>
내용 : <b>${param.content }</b>