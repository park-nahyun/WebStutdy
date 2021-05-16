<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   String str = "";

   // 데이터베이스 연결
   Connection conn = DBConn.getConnection();
   
   // 쿼리문 준비 → 리스트를 조회하기 위한 SELECT 쿼리문
   String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ROUND(((KOR+ENG+MAT)/3.0),1) AS AVG FROM TBL_SCORE ORDER BY SID ASC";
   
   // 작업객체 구성 및 쿼리문 실행
   Statement stmt = conn.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   
   // 타이틀 구성
   str += "<table class='table'>";
   str += "<tr>";
   str += "<th>번호</th><th>이름</th>";
   str += "<th>국어점수</th><th>영어점수</th><th>수학점수</th>";
   str += "<th>총점</th><th>평균</th>";
   str += "</tr>";
   
   // ResultSet 에 대한 처리 → 반복문 구성
   while(rs.next())
   {
      str += "<tr>";
      str += "<td>" + rs.getString("SID") + "</td>";
      str += "<td>" + rs.getString("NAME") + "</td>";
      str += "<td class='txtNum'>" + rs.getString("KOR") + "</td>";
      str += "<td class='txtNum'>" + rs.getString("ENG") + "</td>";
      str += "<td class='txtNum'>" + rs.getString("MAT") + "</td>";
      str += "<td class='txtNum'>" + rs.getString("TOT") + "</td>";
      str += "<td class='txtNum'>" + String.format("%.1f", rs.getDouble("AVG")) + "</td>";
      
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
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
   .errMsg { color: red; font-size: small; display: none; }
   .txtNum { text-align: center; }
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
   <h1>데이터베이스 연결 및 데이터 처리</h1>
   <hr>
</div>

<div>
   <p>성적 정보 리스트</p>
   <form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
      <table class="table">
         <tr>
            <th style="width: 80px;">이름(*)</th>
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
   
   <div class="div01">
      <!-- 리스트 구성 -->
      <%=str %>
   </div>
</div>

</body>
</html>