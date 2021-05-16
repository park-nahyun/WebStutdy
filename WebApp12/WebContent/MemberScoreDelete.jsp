<%@page import="com.test.svt.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreDelete.jsp
	
	// 이전 페이지(MemberScoreSelect)로부터 데이터 수신
	// → sid
	String sid = request.getParameter("sid");
	MemberScoreDAO dao = new MemberScoreDAO();

	try
	{
		dao.connection();
		
		dao.remove(sid);
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect("MemberScoreSelect.jsp");
%>