<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>XmlTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			var params = "name=" + $.trim($("#name").val())
				+ "&content=" + $.trim($("#content").val());
			
			$.ajax(
			{
				type : "POST"
				, url : "XmlTest01_ok.jsp"
				, data : params
				, dataType : "xml"			//-- check~!!! 앞과 차이
				, success : function(args)
				{
					var out = "";
					out = ">> 게시물 개수 : " + $(args).find("total_dataCount").text() + "<br>";
					
					// arg로 받게 되는 건.. ok 페이지에서
					// 김아별1 개발자1/.. 김아별5 개발자5
					// 거기서 total_dataCount를 찾으라는 것 (find)
					
					// check~!!!
					$(args).find("comment").each(function()
					{
						var item = $(this);
						var num = item.attr("num");
						var name = item.find("name").text();
						var content = item.find("content").text();
						
						out += "<br>=============================="
						out += "<br> 번호 : " + num;
						out += "<br> 이름 : " + name;
						out += "<br> 내용 : " + content;
						out += "<br>==============================<br>";
					});
					
					// 여기는 코멘트 다섯개가 받아져옴 
					// each는 그걸 각각 처리하는 것
					
					$("#resultDiv").html(out);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
				}
				, beforeSend : showRequest	// true / false
				, error : function(e)
				{
					alert(e.responseText);	// 클라이언트 쪽에서 보기
					console.log(e);			// 서버 쪽에서 보기
				}
			});
		});
	});	
	
	function showRequest(xhr)
	{
		var flag = true;
		
		if(!$.trim($("#name").val()))	// 띄어쓰기도 입력 안한 것으로 처리하기 위해 trim 처리
		{
			alert("이름을 입력해라");
			$("#name").focus();
			flag = false;
		}
		if(!$.trim($("#content").val()))
		{
			alert("내용을 입력해라");
			$("#content").focus();
			flag = false;
		}
		
		return flag;
	}
</script>

</head>
<body>

<div>
	<h1>jQuery 의 ajax() 메소드 실습</h1>
	<hr>
</div>


<div>
	이름 : <input type="text" id="name" class="txt"><br>
	내용 : 
	<textarea rows="3" cols="50" id="content">

	</textarea>
	<br><br>
	
	<input type="button" value="등록하기" id="sendBtn" class="btn">
</div>
<br><br>

<div id="resultDiv">

</div>
<br><br>
</body>
</html>