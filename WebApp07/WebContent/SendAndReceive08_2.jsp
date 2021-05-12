<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신
	request.setCharacterEncoding("UTF-8");

	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	
	// Calendar 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH) + 1; // 인덱스로 저장되어있으니까 +1
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	// 페이지 최초 요청시 표시할 달력의 년, 월
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	/* 선생님 풀이
	int preYear = year;
	int preMonth = month-1;
	
	if (preMonth<1)
	{
		preYear = year-1;
		preMonth = 12;
	}
	
	int nextYear = year;
	int nextMonth = month+1;
	if (nextMonth>12)
	{
		nextYear = year+1;
		nextMonth = 1;
	}
	
	// 표시할 달력 세팅
	cal.set(year, month-1, 1);
	int stardDay = 1;
	
	// 년 월의 마지막 날짜 구하기
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	// 요일 확인
	int week = cal.get(Calendar.DAY_OF_WEEK);
	*/
	
	
	
	// 페이지 최초 요청 아닐 경우
	// 수신한 데이터로 표시할 달력의 년, 월 구성
	if (yearStr!=null || monthStr!=null)
	{
		selectYear = Integer.parseInt(yearStr);
		selectMonth = Integer.parseInt(monthStr);
	}
	
	
	
	if (selectMonth==0)
	{
		selectYear = selectYear-1;
		selectMonth=12;
	}
	else if (selectMonth==13)
	{
		selectYear=selectYear+1;
		selectMonth=1;
	}
	
	//-------------------------------------------------
	
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 작업
	
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	// 윤년일 경우 2월에 +1
	if (selectYear%4==0 && selectYear%100!=0 && selectYear%100==0)
		months[1] = 29;
	
	
	// 총 날 수
	int nalsu=0;
	
	// 요일 배열
	String[] weekName = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	// 입력 받은 년도 이전까지의 날 수
	nalsu = (selectYear-1)*365 + (selectYear/4) - (selectYear/100) + (selectYear/400);
	
	// 입력 받은 월 이전 까지의 날 수 
	for (int i=0 ; i<selectMonth-1 ; i++)
	{
		nalsu += months[i];
	}
	nalsu++; // 하루 더 더해야 함.. 이 부분 이해 안돼ㅠㅠ
	
	
	// 첫 날 요일 구하기
	// 0이면 일요일.. 
	int week = nalsu%7;
	
	// 마지막 날짜
	int lastDay = months[selectMonth-1];
	
	//------------------------------------------------------
	
	// 달력 그리기
	String calStr="";
	// calStr이라는 문자열 안에 html 구문을 하나하나 넣어준다고 생각
	calStr += "<table border='1'>";
	calStr += "<tr>";
	
	// 요일 이름 출력--------------------------------------------
	for (int i=0 ; i<weekName.length ; i++)
	{
		if(i==0) // 일요일
			calStr += "<th style='color:red;'>" + weekName[i] + "</th>";
		else if(i==6) // 토요일
			calStr += "<th style='color:blue;'>" + weekName[i] + "</th>";
		else // 평일
			calStr += "<th>" + weekName[i] + "</th>";
	}
	
	calStr += "</tr>";
	//------------------------------------------------------------
	
	calStr += "<tr>";
	
	// 달력 시작 전 빈칸 공백 <td>
	for (int i=0 ; i<=week-1 ; i++) 
		calStr += "<td></td>";
	
	// 날짜 td
	for (int i=1 ; i<=lastDay ; i++)
	{
		week++;
		

		if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)
			// 토요일... 선택된 년도가 지금년도, 선택된 월이 지금 월
			// 그릴 때 찍게 되는 i가 지금 날짜(오늘)이고, 오늘이 토요일이라면
			calStr += "<td class='nowSat'>" + i + "</td>";
			
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if(selectYear==nowYear && selectMonth==nowMonth && i==nowDay)
			calStr += "<td class='now'>" + i + "</td>";
		else if(week%7==0)
			calStr += "<td class='sat'>" + i + "</td>";
		else if(week%7==1)
			calStr += "<td class='sun'>" + i + "</td>";
		else
			calStr += "<td>" + i + "</td>";
		
		if(week%7==0)
			calStr += "</tr><tr>";
	}
	
	// 빈 칸 공백 td 발생
	for (int i=0 ; i<=week; i++, week++)
	{
		if (week%7==0)
			break;
		calStr += "<td></td>";
	}
	
	if(week%7!=0)
		calStr += "</tr>";
	// 31일이 토요일일때 개행 안되도록
	
	calStr += "</table>";
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>
<script type="text/javascript">

function formCalendar(obj)
{
		obj.submit();
} 


</script>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: right;}
	td.sat {color: blue;}
	td.sun {color: red;}
	td.now {background-color: aqua; font-weight: bold;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
</style>
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 08
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit  없이 이벤트 처리를 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	     
	     ◀ 2021 년 5 월 ▶
	     
	     ---------------------------
	     ---------------------------
	   - 『◀』 이나 『▶』
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
	<form action="" method="post">
		<%-- <a href="SendAndReceive08.jsp?year=<%=preYear%>&month=<%=preMonth%>">◀</a> --%>
		<a href="SendAndReceive08.jsp?year=<%=selectYear%>&month=<%=selectMonth-1%>">◀</a>
		<input type="text" id="year" name="year" 
		value="<%=selectYear%>"> 년
		<input type="text" id="month" name="month" 
		onchange="formCalendar(this.form)"
		value="<%=selectMonth%>"> 월 
		<a href="SendAndReceive08.jsp?year=<%=selectYear%>&month=<%=selectMonth+1%>">▶</a>
		<%-- <a href="SendAndReceive08.jsp?year=<%=nextYear%>&month=<%=nextMonth%>">▶</a> --%>
	</form>
</div>
<br><br>	
<div>
	<!-- 달력을 그리게 될 지점 -->
	<%=yearStr%>년 <%=monthStr%>월
	<%=calStr%>
</div>
</body>
</html>