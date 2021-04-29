<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>●RadioSelect.jsp → RadioSelect_ok.jsp</p>
</div>

<div>
	<h2>radio, select 데이터 전송</h2>
	<form action = "RadioSelect_ok.jsp" method="post">
		이름 <input type="text" name="name" class="txt">
		<br>
		
		성별
		<label><input type="radio" value="M" name="sex">남자</label>
		<label><input type="radio" value="F" name="sex">여자</label>
		<br><br>
		
		전공
		<select name="major">
			<option value="국문학" >국문학</option>
			<option value="영문학" >영문학</option>
			<option value="컴퓨터공학" >컴퓨터공학</option>
			<option value="수학" >수학</option>
			<option value="신문방송학" >신문방송학</option>
			<option value="경영학" >경영학</option>
		</select>
		<br><br>
		
		취미
		<select name="hobby" size="6" multiple="multiple">
			<option value="영화감상" >영화감상</option>
			<option value="음악감상" >음악감상</option>
			<option value="배드민턴" >배드민턴</option>
			<option value="맛집투어" >맛집투어</option>
			<option value="취침소등" >취침소등</option>
			<option value="암벽등반" >암벽등반</option>
		</select>
		<br><br>
		
		<input type="submit" value="내용 전송" class="btn">
	</form>
</div>
</body>
</html>