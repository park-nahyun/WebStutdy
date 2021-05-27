<%@page import="com.test.core.MyData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	// Test04.jsp
	//-- 사용자 정의 데이터타입을 취하는 자료구조 생성
	
	List<MyData> lists = new ArrayList<MyData>();

	MyData ob = new MyData("박정준", 25);
	lists.add(ob);
	
	ob = new MyData("이희주", 14);
	lists.add(ob);
	
	ob = new MyData("박민지", 8);
	lists.add(ob);
	
	ob = new MyData("이유림", 17);
	lists.add(ob);
	
	ob = new MyData("한혜림", 13);
	lists.add(ob);
	
	request.setAttribute("lists", lists);
	
%>

<jsp:forward page="Test04_result.jsp"></jsp:forward>
