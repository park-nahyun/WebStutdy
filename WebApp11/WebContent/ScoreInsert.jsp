<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//-- 데이터 입력 액션 처리 페이지
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String scoreKor = request.getParameter("scoreKor");
	String scoreEng = request.getParameter("scoreEng");
	String scoreMat = request.getParameter("scoreMat");
	
	
	ScoreDAO dao = null;
	
	try
	{
		dao = new ScoreDAO();
		
		int kor = Integer.parseInt(scoreKor);
		int eng = Integer.parseInt(scoreEng);
		int mat = Integer.parseInt(scoreMat);
		
		ScoreDTO score = new ScoreDTO();
		score.setName(userName);
		score.setKor(kor);
		score.setEng(eng);
		score.setMat(mat);
		
		//dao 의 add() 메소드 호출 → insert 쿼리문 수행
		dao.add(score);
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
	
	// 클라이언트가 요청해야 할 URL 주소 전달
	response.sendRedirect("ScoreList.jsp");
%>
