<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 달력 객체 생성
	Calendar cal = Calendar.getInstance();

	// 오늘의 날짜 확인
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	// 클라이언트에 의해 넘어온 데이터 처리 (SendAndReceive08.jsp → 자기자신 페이지) -------
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	// ------- 클라이언트에 의해 넘어온 데이터 처리 (SendAndReceive08.jsp → 자기자신 페이지)
	
	// 표시할 달력의 년, 월
	int year = nowYear;
	int month = nowMonth;
	
	if(strYear != null)
		year = Integer.parseInt(strYear);
	if(strMonth != null)
		month = Integer.parseInt(strMonth);
	
	int preYear = year;
	int preMonth = month-1;
	
	if(preMonth<1)
	{
		preYear = year-1;
		preMonth = 12;
	}
	
	int nextYear = year;
	int nextMonth = month+1;
	
	if(nextMonth>12)
	{
		nextYear = year+1;
		nextMonth = 1;
	}
	
	// 표시할 달력 세팅
	cal.set(year, month-1, 1);
	int startDay = 1;
	
	// 년 월의 마지막 날짜 구하기
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	// 요일 확인
	int week = cal.get(Calendar.DAY_OF_WEEK);
	
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	a {text-decoration: none; color: blue;}
	table {width: 300px;}
	td {text-align: center; font-size: 10pt; height: 20px;}
	
</style>
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 08
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	     
	                       2021 6 2021 7 ... 2021 12 2022 1
	   ◀ 2021 년 5 월 ▶
	   
	   ---------------------------
	   ---------------------------
	   
	   - 『◀』 이나 『▶』 클릭 시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	     
       - 사용자 최초 요청 주소는
         http://localhost:8090/WebApp07/SendAndReceive08.jsp
         로 한다.
         
	○ SendAndReceive08.jsp
	       
	   
-->


<div>
	<h1>데이터 송수신 실습 08</h1>
	<hr>
</div>

<div>
	<br><br>
	
	<table style="text-align: center;">
		<tr>
			<td style="font-size: 15pt; text-align: center;">
				<a href="SendAndReceive08.jsp?year=<%=preYear %>&month=<%=preMonth %>">◀</a>
				<b><%=year %> 년 <%=month %> 월</b>
				<a href="SendAndReceive08.jsp?year=<%=nextYear %>&month=<%=nextMonth %>">▶</a>			
			</td>
		</tr>
	</table>
	
	<table style="text-align: center;">
		<tr>
			<th style="background-color: #e6e4e6; color: red;">일</th>
			<th style="background-color: #e6e4e6;">월</th>
			<th style="background-color: #e6e4e6;">화</th>
			<th style="background-color: #e6e4e6;">수</th>
			<th style="background-color: #e6e4e6;">목</th>
			<th style="background-color: #e6e4e6;">금</th>
			<th style="background-color: #e6e4e6; color: blue;">토</th>
		</tr>
		
		<%
		int newLine = 0;
		
		out.print("<tr>");
		for (int i=1; i<week; i++)
		{
			out.print("<td style='background-color: #555555'>&nbsp;</td>");
			newLine++;
		}
		
		for (int i=startDay; i<=endDay; i++)
		{
			String fontColor = (newLine==0) ? "red" : (newLine==6) ? "blue" : "white";
			String bgColor = (nowYear==year) && (nowMonth==month) && (nowDay==i) ? "#e6e4e6" : "#555555";
			
			out.print("<td style='background-color: " + bgColor + "'>");
			out.print("<span style='color: " + fontColor + "'>" + i + "</span>");
			out.print("</td>");
			
			newLine++;
			
			if(newLine==7 && i!=endDay)
			{
				out.print("</tr><tr>");
				newLine = 0;
			}
		}
		
		while(newLine<7)
		{
			out.print("<td style='background-color: #555555'>&nbsp;</td>");
			newLine++;
		}
		
		
		out.print("</tr>");
		
		%>
		
		
	</table>
	




</div>

</body>
</html>