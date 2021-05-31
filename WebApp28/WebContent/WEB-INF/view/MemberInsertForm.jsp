<%@page import="com.test.mvc.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int idCheck =0;
	
	if(request.getAttribute("idCheck") != null || request.getAttribute("idCheck") == "")
	{
		idCheck = (Integer)request.getAttribute("idCheck");
	}
	
	int emailCheck =0;
	
	if(request.getAttribute("emailCheck") != null || request.getAttribute("emailCheck") == "")
	{
		emailCheck = (Integer)request.getAttribute("emailCheck");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main">

<style>
   .errMsg
   {
      font-size: small;
      color: red;
      display: none;
   }
</style>

<script type="text/javascript">
	<%if (idCheck>0){%>
	
	alert("중복된 아이디입니다. 다시 입력해주세요.^^");
	
	<%}%>
	
	<%if (emailCheck>0){%>
	
	alert("중복된 이메일입니다. 다시 입력해주세요.^^");
	
	<%}%>
	function memberSubmit()
	{
		// 테스트
		// alert("정상 호출 !!");
		
		var memberForm = document.getElementById("memberForm");
		
		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		var name = document.getElementById("name");
		var tel = document.getElementById("tel");
		var email = document.getElementById("email");
		
		var idMsg = document.getElementById("idMsg");
		var pwMsg = document.getElementById("pwMsg");
		var nameMsg = document.getElementById("nameMsg");
		var telMsg = document.getElementById("telMsg");
		var emailMsg = document.getElementById("emailMsg");
		idMsg.style.display = "none";
		pwMsg.style.display = "none";
		nameMsg.style.display = "none";
		telMsg.style.display = "none";
		emailMsg.style.display = "none";
		if (id.value == "")
		{
			idMsg.style.display = "inline";
			id.focus();
			return;
		}
		
		if (pw.value == "")
		{
			pwMsg.style.display = "inline";
			pw.focus();
			return;
		}
		
		if (name.value == "")
		{
			nameMsg.style.display = "inline";
			name.focus();
			return;
		}
		if (tel.value == "")
		{
			telMsg.style.display = "inline";
			tel.focus();
			return;
		}
		
		if (email.value == "")
		{
			emailMsg.style.display = "inline";
			email.focus();
			return;
		}
		
		/* if (${idCheck} > 0)
		{
			alert("아이디가 중복되었습니다. 다시 입력해주세요.");
			id.focus();
			return;
		} */
		
		// form 을 직접 지정하여 submit 액션 수행
		memberForm.submit();
	}
	
	function memberReset()
	{
		var memberForm = document.getElementById("memberForm");
		var id = document.getElementById("id");
		var idMsg = document.getElementById("idMsg");
		
		idMsg.style.display = "none";
		
		// form 을 직접 지정하여 reset 액션 수행
		memberForm.reset();
		
		id.focus();
	}
</script>
</head>
<body>

<div>
	<h1>회원 입력 페이지</h1>
	<h2>MemberInsertForm.jsp</h2>
	<hr>
</div>

<div>
	<form action="memberinsert" method="post" id="memberForm"> 
		<table class="table">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" id="id">
				</td>
				<td>
					<span class="errMsg" id="idMsg">아이디를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pw" id="pw"></td>
				<td>
					<span class="errMsg" id="pwMsg">비밀번호를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" id="name"></td>
				<td>
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="tel" id="tel"></td>
				<td>
					<span class="errMsg" id="telMsg">전화번호를 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="email" name="email" id="email"></td>
				<td>
					<span class="errMsg" id="emailMsg">이메일을 입력해야 합니다.</span>
				</td>
			</tr>
		</table>
		<br>
		<a href="javascript:memberSubmit()"><button type="button">입력하기</button></a>
		<a href="javascript:memberReset()"><button type="button">취소하기</button></a>
		<a href="memberlist"><button type="button">목록으로</button></a>
	</form>
</div>

</body>
</html>