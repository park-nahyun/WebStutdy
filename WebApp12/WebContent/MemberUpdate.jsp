<%@page import="com.test.svt.MemberDTO"%>
<%@page import="com.test.svt.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// MemberUpdate.jsp
	
	request.setCharacterEncoding("UTF-8");
	
	String sid = request.getParameter("sid");
	String name = request.getParameter("uName");
	String tel = request.getParameter("uTel");
	
	MemberDAO dao = new MemberDAO();
	
	try
	{
		dao.connection();
		
		// MemberDTO 객체 생성 및 속성 구성(→ add() 메소드 호출 위해 필요)
		MemberDTO member = new MemberDTO();
		member.setSid(sid);
		member.setName(name);
		member.setTel(tel);
		
		// insert 쿼리문을 수행하는 dao 의 update() 메소드 호출
		dao.modify(member);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	finally
	{
		try
		{ 
			// 데이터베이스 연결 종료
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// check~!!!
	// 클라이언트가 MemberSelect.jsp 를 다시 요청할 수 있도록 안내 처리
	response.sendRedirect("MemberSelect.jsp");
%>
