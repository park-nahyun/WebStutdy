<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// test002를 요청하면, DB를 연결해서 ~ 보여주는 것!
	// 결과값 변수
	String str = "";

	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비(select)
	String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
	
	// 작업 객체 생성 및 준비된 쿼리문 수행
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);

	
	// 출력 테이블 구성을 위한 준비
	str += "<table><tr><th id='numTitle'>번호</th><th id='nameTitle'>이름</th><th id='telTitle'>전화번호</th></tr>";
	
	
	// 결과 ResultSet 에 대한 처리 → 반복문 구성
	while(rs.next())
	{ 
		str += "<tr>"; 
		
		str += "<td id='numContent'>" + rs.getString("SID") + "</td>";
		str += "<td id='nameContent'>" + rs.getString("NAME") + "</td>";
		str += "<td id='telContent'>" + rs.getString("TEL") + "</td>";
		
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
<title>Test002.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	input { width: 200px; }
	button { width: 208px; height: 50px; font-weight: bold; }
	.errMsg { font-size: small; color: red; display: none; }
	th { background-color: gray; color: white; }
	#numTitle { width: 50px; }
	#nameTitle { width: 100px; }
	#telTitle { width: 160px; }
	
	#numContent { text-align: right; }
	#nameContent { text-align: center; }
	#telContent { text-align: center; }
	

	
</style>

<script type="text/javaScript">
	
	function formCheck()
	{
		var uName = document.getElementById("userName");
		var nMsg = document.getElementById("nameMsg");
		
		nMsg.style.display = "none";
		
		if(uName.value=="")
		{
			nMsg.style.display = "inline";
			return false;
		}
		return true;
	}


</script>
</head>
<body>

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<div>
	<form action="Test003.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="userTel" name="userTel">
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<button type="submit" id="btnAdd" class="btn">데이터 추가</button>
				</td>
			</tr>
		</table>
	</form>
	<br><br>
	
	<div>
		<!--  처리 결과  -->
		<%= str %>
	</div>
</div>
</body>
</html>