<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");


	//데이터 수신 → ScoreList.jsp로부터... (name, tel)
	String uName = request.getParameter("userName");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	int kor, mat, eng=0;
	kor=mat=eng=0;
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		// 데이터베이스 연결
		Connection conn = DBConn.getConnection();
		
		// 쿼리문 준비(Insert)
		
		String sql = String.format("INSERT INTO TBL_SCORE VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)"
									, uName, kor, eng, mat);
		
		// 작업 객체 생성
		
		Statement stmt = conn.createStatement();
		
		// 쿼리문 실행 → 적용된 행의 개수 반환(int)
		
		int result = 0;
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		DBConn.close();
		
		if (result < 1)
		{
			response.sendRedirect("Error02.jsp");
		}
		else
		{
			response.sendRedirect("ScoreList.jsp");
		}
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}


	
%>
