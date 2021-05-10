<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// 데이터 수신
	request.setCharacterEncoding("UTF-8");

	int kor, eng, mat, tot;
	kor=eng=mat=tot=0;
	double avg = 0;
	
	String userName = request.getParameter("userName");
	String korStr=request.getParameter("kor");
	String matStr=request.getParameter("mat");
	String engStr=request.getParameter("eng");
	
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		tot = kor + eng + mat;
		// avg = Math.round((tot/3.0)*10)/10.0;
		avg = tot/3.0;
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SampleTest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type = "text/css">
	span {color: blue; font-weight: : bold; font-size: 15pt;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 02</h1>
	<hr>
</div>

<div>
	<h2>성적 확인</h2>
	<span style="color: blue;"><%=userName%></span>님,
	성적처리가 완료되었습니다.<br>
	회원님의 점수는 
	국어:<span><%=kor%></span>점, 
	영어:<span><%=eng%></span>점, 
	수학:<span><%=mat%></span>점 입니다.<br>
	총점은 <span><%=tot%></span>점, 
	평균은 <span><%=String.format("%.1f", avg)%></span>점 입니다.<br>
</div>
</body>
</html>