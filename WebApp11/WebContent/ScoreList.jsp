<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	
	StringBuffer str = new StringBuffer();
	ScoreDAO dao = null;
	
	String memberCount = "<span id='memberCount'>전체 인원 수 : ";
	
	try
	{
	   dao = new ScoreDAO();
	   
	   memberCount += dao.count() + "명</span>";
	   
	   str.append("<table class='table'>");
	   str.append("<th>번호</th><th>이름</th>"
	   	+ "<th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th></tr>");
	   
	
	   for(ScoreDTO score : dao.lists())
	   {
	      str.append("<tr>");
	      str.append("<td>" + score.getSid() + "</td>");
	      str.append("<td>" + score.getName() + "</td>");
	      str.append("<td>" + score.getKor() + "</td>");
	      str.append("<td>" + score.getEng() + "</td>");
	      str.append("<td>" + score.getMat() + "</td>");
	      str.append("<td>" + score.getTot() + "</td>");
	      str.append("<td>" + score.getAvg() + "</td>");
	      str.append("</tr>");
	   }
	   str.append("</table>");
	}
	catch(Exception e)
	{
	   System.out.println(e.toString());
	}
	finally
	{
	   try
	   {
	      dao.close();
	   }
	   catch(Exception e)
	   {
	      System.out.println(e.toString());
	   }
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
   input {width: 200px; border-radius: 6px;}
   button {width: 408px; height: 50px; font-family: 맑은 고딕; font-weight: bold;}
   .record {text-align: center;}
   .errMsg {color: red; font-size: small; display: none;}
</style>
<script type="text/javascript">

function formCheck() 
{
   // 테스트
   //alert("ok");
   
   var uName = document.getElementById("userName");
   var uKor = document.getElementById("scoreKor");
   var uEng = document.getElementById("scoreEng");
   var uMat = document.getElementById("scoreMat");
   
   var nameMsg = document.getElementById("nameMsg");
   var korMsg = document.getElementById("korMsg");
   var engMsg = document.getElementById("engMsg");
   var matMsg = document.getElementById("matMsg");
   
   nameMsg.style.display = "none";
   korMsg.style.display = "none";
   engMsg.style.display = "none";
   matMsg.style.display = "none";
   
   if(uName.value == "")
   {
      nameMsg.style.display = "inline";
      uName.focus();
      return false;
   }
   
   if(uKor.value == "" || isNaN(uKor.value) || Number(uKor.value)<0 || Number(uKor.value)>100)
   {
      korMsg.style.display = "inline";
      uKor.focus();
      return false;
   }
   
   if(uEng.value == "" || isNaN(uEng.value) || Number(uEng.value)<0 || Number(uEng.value)>100)
   {
      engMsg.style.display = "inline";
      uEng.focus();
      return false;
   }
   
   if(uMat.value == "" || isNaN(uMat.value) || Number(uMat.value)<0 || Number(uMat.value)>100)
   {
      matMsg.style.display = "inline";
      uMat.focus();
      return false;
   }
   
   return true;
      
  
}


</script>
</head>
<body>


<div>
   <h1>데이터베이스 연동 성적관리 실습</h1>
   <hr>
</div>


<div>
	<p>성적 정보 리스트</p>
	 <form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table class="table">
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
               <input type="text" id="scoreKor" name="scoreKor">
               <span class="errMsg" id="korMsg">0 ~ 100 사이의 정수를 입력해야 합니다.</span>
            </td>
         </tr>
         <tr>
            <th>영어점수</th>
            <td>
               <input type="text" id="scoreEng" name="scoreEng">
               <span class="errMsg" id="engMsg">0 ~ 100 사이의 정수를 입력해야 합니다.</span>
            </td>
         </tr>
         <tr>
            <th>수학점수</th>
            <td>
               <input type="text" id="scoreMat" name="scoreMat">
               <span class="errMsg" id="matMsg">0 ~ 100 사이의 정수를 입력해야 합니다.</span>
            </td>
         </tr>
         <tr>
            <td colspan="2" style="text-align: left;">
               <input type="submit" value="성적 추가" class="btn"
               style="width: 280px; height: 50px; font-weight: bold;">
            </td>
         </tr>
      </table>
   </form>
</div>   
   <div class="div01">
   	  <%=memberCount %>
      <!-- 리스트 구성 -->
      <%=str.toString() %>
   </div>

</body>
</html>