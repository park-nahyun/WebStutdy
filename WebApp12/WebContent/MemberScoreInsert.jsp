<%@page import="com.test.svt.MemberScoreDTO"%>
<%@page import="com.test.svt.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// MemberScoreInsert.jsp
	
	
	// 이전 페이지(MemberScoreInsertForm.jsp)부터 데이터 수신
	// → sid, kor, eng, mat
	
	request.setCharacterEncoding("UTF-8");

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
		dto.setEng(eng);
		dto.setMat(mat);
		
		// add() 메소드 호출
		score.add(dto);
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
	
	// 새로운 페이지 요청할 수 있도록 처리
	response.sendRedirect("MemberScoreSelect.jsp");
%>
