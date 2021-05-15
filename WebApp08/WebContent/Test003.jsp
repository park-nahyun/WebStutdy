<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Test002.jsp 에서 이름, 전번 쓴 다음에 submit()을 수행.
	// 이 때 Test003.jsp가 있을 것. 이 submit() 액션에 의해
	// 이름-전번 을 받아서 이름이 뭐다, 전번이 뭐다.. 이 내용을 들고
	// DB한테 가서 Insert 요청할 것.
	// 사용자가 요청한 페이지는 003.. 원래는 003가 클라이언트를 만나야함
	// 그런데 그럴 필요 없이 DB에 데이터를 입력했으니까 
	// Test002 만나봐~ 그럼 니가 요청한 내용 들어가있을거야~ 해주는 것..
	
	// Test003.jsp
	
	// 한글 인코딩 처리
	
	request.setCharacterEncoding("UTF-8");
	
	// 데이터 수신 → Test002.jsp로부터... (name, tel)
	String uName = request.getParameter("userName");
	String uTel = request.getParameter("userTel");

		
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비(Insert)
	
	String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
							+ "VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", uName, uTel);
	
	// 작업 객체 생성
	
	Statement stmt = conn.createStatement();
	
	// 쿼리문 실행 → 적용된 행의 개수 반환(int)
	
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();	// 우리가 정의한 메소드 호출
	// 만약에 conn.close() 하면... 커넥션 객체 자체를 닫아버린 것! 주의!!!
	
	// 반환된 행의 개수가 1보다 작은 상황이면...
	// → 따라오세요 ~ 에러 페이지~!!!
	
	// 반환된 행의 개수가 1보다 크다면
	// 그 이외의 상황이면...
	// → 따라오세요~ Test002.jsp 로 안내
	if (result < 1)
	{
		// 에러 페이지를 다시 요청해라...
		response.sendRedirect("Error02.jsp");
	}
	else
	{
		// Test002.jsp 페이지를 다시 요청해라...
		response.sendRedirect("Test002.jsp");
	}
	
%>
