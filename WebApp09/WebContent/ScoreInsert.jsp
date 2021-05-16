<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   //리다이렉트 servlet으로 업무 넘겨줌
   
   // ScoreInsert.jsp
   
   // 한글 인코딩 처리
   request.setCharacterEncoding("UTF-8");
   
   // 이전 페이지(ScoreList.jsp)로 부터 데이터 수신(이름, 국어점수, 영어점수, 수학점수)
   String uName = request.getParameter("userName");
   String uKor = request.getParameter("scoreKor");
   String uEng = request.getParameter("scoreEng");
   String uMat = request.getParameter("scoreMat");
   
   try
   {
      // 데이터베이스 연결
      Connection conn = DBConn.getConnection();
      
      // 쿼리문 준비 → insert 쿼리문
      // statement 사용할거라서 오라클에서는 숫자 형태로 저장되고 여기 불러져 올 때는 string으로
      String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '%s', %s, %s, %s)", uName, uKor, uEng, uMat);
      
      // 작업객체 구성 및 쿼리문 실행 → executeUpdate → 적용된 행의 개수 반환
      //                                         --------------------- 요청 페이지 분기
      Statement stmt = conn.createStatement();
      stmt.executeUpdate(sql);
      
      // 작업객체 리소스 반납
      stmt.close();
      
      
      // 요청 페이지 분기 가능

   }
   catch(Exception e)
   {
      // 서버측 콘솔에서 확인
      System.out.println(e.toString());
   }
   finally
   {
      // 데이터베이스 연결 종료
      DBConn.close();
   }
   
   // 클라이언트가 다시 요청해야 할 URL 전달 → sendRedirect() 메소드 활용
   // → ScoreList.jsp
   response.sendRedirect("ScoreList.jsp");   
   

%>