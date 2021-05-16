
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// 결과값 변수
	String str = "";

	// DB 연결
	Connection conn = DBConn.getConnection();
	
	// sql 가져오기
	String sql = "SELECT SID, NAME, KOR, ENG, MAT"
			+ ", KOR+MAT+ENG AS TOT, TRUNC((KOR+MAT+ENG)/3, 2) AS AVG FROM TBL_SCORE ORDER BY SID";
	
	// 작업 객체 생성 및 준비된 쿼리문 수행
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	// 출력 테이블 생성
	str += "<table><tr><td>번호</td><td>이름</td><td>국어</td><td>영어</td>"
			+ "<td>수학</td><td>총점</td><td>평균</td></tr>"; 
			
	// 결과 ResultSet 에 대한 처리 → 반복문 구성
	while(rs.next())
	{ 
		str += "<tr>"; 
		
		str += "<td>" + rs.getString("SID") + "</td>";
		str += "<td>" + rs.getString("NAME") + "</td>";
		str += "<td>" + rs.getString("KOR") + "</td>";
		str += "<td>" + rs.getString("ENG") + "</td>";
		str += "<td>" + rs.getString("MAT") + "</td>";
		str += "<td>" + rs.getString("TOT") + "</td>";
		str += "<td>" + rs.getString("AVG") + "</td>";
		
		str += "</tr>";
	}
	
	str += "</table>";
	rs.close();
	stmt.close();
	DBConn.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1></h1>
	<hr>
</div>

<div>
	<h2>성적처리</h2>
	<div>
		<form action="ScoreInsert.jsp" method="post">
		
			<table>
				<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor">
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat">
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng">
				</td>
			</tr>
			<tr>
				<td>
					<button type="submit" id="btn" class="btn">성적 추가</button>
					<button type="reset">취소</button>
				</td>
			</tr>
			</table>
			
		<%=str %>
		</form>
	</div>
</div>
</body>
</html>