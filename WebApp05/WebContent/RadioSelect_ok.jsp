<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");			//-- 텍스트박스... 단일값 수신
	String sex = request.getParameter("sex");			//-- 라디오버튼... 단일값 수신
	
	String sub = request.getParameter("major");			//-- 선택상자... 단일값 수신
	String hob[] = request.getParameterValues("hobby");	//-- 선택상자... 복수값 수신
	//-- 다중 선택이 가능한 선택상자일 경우... 배열 형태로 수신
	
    String genderStr = "";
	if(sex != null)
	{
		if(sex.equals("M"))
			genderStr = "남자";
		else if(sex.equals("F"))
			genderStr = "여자";
		else 
			genderStr = "확인불가";
	}
	else
	{
		genderStr = "확인불가";	// url에 직접 값을 줄 수 있어서 처리해주는 것
	}
	
    String str = "";
    
    if (hob != null)
    {
    	for(String item : hob)
    	{
    		str += " [ " + item + " ] ";
    	}
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>RadioSelect.jsp → RadioSelect_ok.jsp●</p>
</div>


<div>
	<h2>radio, select 데이터 수신</h2>
	
	<div>
		<h3>수신 데이터</h3>

		<!-- <p>이름 : 박나현</p> -->
		<p>이름 : <%= name %></p>
		<!-- <p>성별 : F(여자)</p> -->
		<p>성별 : <%= sex %>(<%=genderStr%>)</p>
		<!-- <p>전공 : 국문학</p> -->
		<p>전공 : <%=sub %></p>
		<!-- <p>취미 : [음악감상] [산악등반]</p> -->
		<p>취미 : <%=str %></p>
		
	</div>
		
</div>
</body>
</html>