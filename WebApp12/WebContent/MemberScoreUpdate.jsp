<%@page import="com.test.svt.MemberScoreDTO"%>
<%@page import="com.test.svt.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// MemberScoreUpdate.jsp
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지(MemberScoreUpdateForm.jsp)부터 데이터 수신
	// → sid, kor, eng, mat
	String sid = request.getParameter("sid");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	

	// MemberScoreDAO 인스턴스 생성
	MemberScoreDAO score = new MemberScoreDAO();
	
	
	
	
	try
	{
		score.connection();
		
		int kor = Integer.parseInt(korStr);
		int eng = Integer.parseInt(engStr);
		int mat = Integer.parseInt(matStr);
		
		// MemberScoreDTO 구성(SID, KOR, ENG, MAT) → 수신된 데이터로 구성
		MemberScoreDTO dto = new MemberScoreDTO();
		dto.setSid(sid);
		dto.setKor(kor);
		dto.setMat(mat);
		dto.setEng(eng);
		
		// update 쿼리문 수행 
		// → MemberScoreDAO 의 modify()메소드 호출 
		// → MemberScoreDTO 매개변수로 전달
		score.modify(dto);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	finally
	{
		try
		{ 
			score.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// 새로운 페이지 요청할 수 있도록 dksso
	response.sendRedirect("MemberScoreSelect.jsp");
%>
