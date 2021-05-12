<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	//데이터 수신
	request.setCharacterEncoding("UTF-8");

	// 자기 자신 페이지로부터 데이터 수신 처리하는 부분
	// 페이지 최초 요청일 때는 null null 찍힘
	String yearStr = request.getParameter("year");		//-- 페이지 최초 요청 시 null
	String monthStr = request.getParameter("month");	//-- 페이지 최초 요청 시 null

	// Calendar 객체 생성
	// java.util.Calendar cal = java.util.Calendar.getInstance(); 원래는 이렇게 해야 하지만
	Calendar cal = Calendar.getInstance(); // 이렇게도 가능
	
	// 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);			//-- 2021
	int nowMonth = cal.get(Calendar.MONTH) + 1;		//-- 05
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	//-- 11
	
	// 표시할 달력의 년, 월 구성 → 페이지 최초 요청을 감안한 코드
	int selectY = nowYear;
	int selectM = nowMonth;
	
	// 페이지 최초 요청이 아닐 경우
	// → 수신한 데이터로 표시할 달력의 년, 월 구성
	if (yearStr!= null || monthStr != null)
	{
		selectY = Integer.parseInt(yearStr);
		selectM = Integer.parseInt(monthStr);
	}
	
	// 확인한 날짜로 년도 select option 구성--------------------------------
/* 	<option value="2011">2011</option>
	<option value="2012">2012</option>
	<option value="2013">2013</option>
					:
	<option value="2020">2020</option>
	<option value="2022">2022</option>
	<option value="2021" selected="selected">2021</option> 	check~!!!
	<option value="2022">2022</option>
					:
	<option value="2030">2030</option>
	<option value="2031">2031</option>*/
	
	
	String yOptions = "";
	for (int year=(selectY-10) ; year<=(selectY+10) ; year++)
	{
		// 상황1. 페이지 최초 요청일 때 → yearStr 이 null 이면서 현재 년도와 옵션값이 같을 때
		if (yearStr==null && year==nowYear)
		{
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		}
		// 상황2. 페이지 최초 요청이 아닐 때 
		else if (yearStr!=null && year==Integer.parseInt(yearStr))
		{		// year가 그려지면서 선택된 year랑 같아졌을 때 selected 한다.
			yOptions += "<option value='" + year + "' selected='selected'>" + year + "</option>";
		}
		else
		{
			yOptions += "<option value='" + year + "'>" + year + "</option>";
		}
	}
	
	// ------------------------------------------------------------------------
	
	// 확인한 날짜로 월 select option 구성--------------------------------
	String mOptions = "";
	for (int month=1 ; month<=12 ; month++)
	{
		// 상황 1. 페이지 최초 요청일 때 → monthStr 이 null 이면서 현재 년도와 옵션값이 같을 때
		if (monthStr==null && month==nowMonth)
			mOptions += "<option value='"+ month + "' selected='selected'>" + month + "</option>";
		// 상황 2. 페이지 최초 요청이 아닐 때
		else if (monthStr!=null && month==Integer.parseInt(monthStr))
			mOptions += "<option value='"+ month + "' selected='selected'>" + month + "</option>";
		// 나머지
		else
			mOptions += "<option value='"+ month + "'>" + month + "</option>";			
	}
	// ------------------------------------------------------------------------
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인하기 위한 연산 -------------------------------
	// (만년달력)
	int[] month = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	if (selectY%4==0 && selectY%100!=0 || selectY%400==0)
	{
		month[1] = 29;
	}
	
	// 총 날 수 누적 변수
	int nalsu;
	
	// 요일 항목 배열 구성
	String[] weekName = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};

	// 현재년도 → 입력받은 년도의 이전 년도까지의 날 수 계산
	nalsu = (selectY-1)*365 + ((selectY-1)/4) - ((selectY-1)/100) + ((selectY-1)/400);
	

	// 현재월 → 입력받은 월의 이전 월 까지의 총 날 수 + 하루 추가
	for (int i=0; i<selectM-1 ; i++)
	{
		nalsu += month[i];
	}
	nalsu++;
	
	
	int week = nalsu%7;					//-- 1일의 요일 변수
	int lastDay = month[selectM-1];		//-- 마지막 날짜 변수

	//---------------------------------------------------------------------------------------

	// 달력 그리기 ---------------------------------------------------------------------------
	
	String calStr="";
	calStr += "<table border='1'>";
	calStr += "<tr>";
	
	for (int i=0 ; i<weekName.length ; i++)
	{
		if(i==0)
			calStr += "<th style='color:red;'>" + weekName[i] + "</th>";
		else if(i==6)
			calStr += "<th style='color:red;'>" + weekName[i] + "</th>";
		else
			calStr += "<th>" + weekName[i] + "</th>";
	}
	calStr += "</tr>";
	
	calStr += "<tr>";
	
	// 빈 칸 공백 td 발생
	for(int i=1 ; i<=week ; i++)
		calStr += "<td></td>";
	
	// 날짜 td 발생
	for(int i=1 ; i<=lastDay ; i++)
	{
		// calStr += "<td>" + i +"</td>";
		week++;
		
		if(selectY==nowYear && selectM==nowMonth && i==nowDay && week%7==0)
			// 토요일... 선택된 년도가 지금년도, 선택된 월이 지금 월
			// 그릴 때 찍게 되는 i가 지금 날짜(오늘)이고, 오늘이 토요일이라면
			calStr += "<td class='nowSat'>" + i + "</td>";
			
		else if(selectY==nowYear && selectM==nowMonth && i==nowDay && week%7==0)
			calStr += "<td class='nowSun'>" + i + "</td>";
		else if(selectY==nowYear && selectM==nowMonth && i==nowDay)
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
	if(week%7 != 0)
		calStr += "</tr>";
	// 31일이 토요일일때 개행 안되도록
	
	calStr += "</table>";
	

	
	// 로그 기록 엉키면 제대로 안불러 올 수 있음. 그럴 땐 쿠키, 캐시 삭제..
	//----------------------------------------------------------------------------------------
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	td {text-align: right;}
	td.sat {color: blue;}
	td.sun {color: red;}
	td.now {background-color: aqua; font-weight: bold;}
	td.nowSat {background-color: aqua; font-weight: bold; color: blue;}
	td.nowSun {background-color: aqua; font-weight: bold; color: red;}
</style>
<script type="text/javascript">


function formCalendar(obj)		// obj 는 form 객체
{
	obj.submit();
	
}




</script>
</head>
<body>
<!--  
	  ○ 데이터 송수신 실습 07
	  	- 달력을 출력하는 JSP 페이지를 구성한다.
	  	- 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	  	- 단 submit 버튼 없이 이벤트 처리를 한다.
	  	- 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다. (단독 페이지)
	  	- 연도 구성은 현재 년도 기준 이전 10년, 이후 10년으로 구성한다.
	  	- 월은 1부터 12월까지로 구성한다.
	  	
	  	[ 2021년 ▼ ] 년 [ 5 ▼ ] 월
	  	----------------------------
	  	----------------------------
	  	
	  	- 연도 select box 나 월 select box 내용 변화 시
	  	  해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	  	  
	  	- 현재 날짜를 확인하는 과정에서 Calendar 클래스를 활용한다.
	  	
	  	- 사용자 최초 요청 주소는
	  	  http://localhost:8090/WebApp07/SendAndReceive07.jsp
	  	  로 한다.
	  	  
	  ○ SendAndReceive07.jsp
   -->
<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>

<div>
	<!-- form 의 action 속성 값 생략 → 데이터의 수신처는 자기 자신(요청하는 페이지도 자기 자신) -->
	<form action= "" method="post">
		<select id="year" name="year" onchange="formCalendar(this.form)">
					<!-- 
					<option value="2021">2021</option>
					<option value="2022">2022</option>
					 -->
					 <%=yOptions %>
		</select>
		년
		<select id="month" name="month" onChange="formCalendar(this.form)">
			<!-- <option value="05">05</option>
			<option value="06">06</option> -->
			<%=mOptions%>
		</select> 월
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