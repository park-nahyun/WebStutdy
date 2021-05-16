<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
/*    String str = "";

   //스트링버퍼 ~ 문자열이 계속 변할 때는 String class를 쓰는 것 보다 StringBuffer를 쓰는 것이 낫다.
   str += ""; */
   
   StringBuffer str = new StringBuffer();
   MemberDAO dao = null;
   
   String memberCount = "<span id='memberCount'>전체 인원 수 : ";
   
   try
   {
      dao = new MemberDAO();
      
      memberCount += dao.count() + "명</span>";
      
      str.append("<table class='table'>");
      str.append("<tr><th>번호</th><th>이름</th><th>전화번호</th></tr>");
      
      // MemberDAO 객체의 lists() 메소드 호출
      //-- 반복문을 통해 <table> 하위 엘리먼트 생성
      for(MemberDTO member : dao.lists())
      {
         str.append("<tr>");
         str.append("<td>" + member.getSid() + "</td>");
         str.append("<td>" + member.getName() + "</td>");
         str.append("<td>" + member.getTel() + "</td>");
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
<title>MemberList.jsp</title>
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
      
      var userName = document.getElementById("userName");
      var nameMsg = document.getElementById("nameMsg");
      
      nameMsg.style.display = "none";
      
      if(userName.value=="")
      {
         nameMsg.style.display = "inline";
         userName.focus();
         return false;
      }
      
      return true;   
   }

</script>

</head>
<body>

<div>
   <h1>데이터베이스 연동 회원관리 실습</h1>
   <hr>
</div>

<div>
   <p>DAO, DTO 개념 적용</p>
   <form action="MemberInsert.jsp" method="post" onsubmit="return formCheck()">
      <table class="table">
         <tr>
            <th>이름(*)</th>
            <td>
               <input type="text" id="userName" name="userName">
               <span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
            </td>
         </tr>
         <tr>
            <th>전화번호</th>
            <td>
               <input type="text" id="userTel" name="userTel">
            </td>
         </tr>
         <tr>
            <td colspan="2">
               <button type="submit" class="btn" id="btnAdd">회원 추가</button>
            </td>
         </tr>
      </table>
   </form>
   <br><br>
   
   <div>
      <!-- 인원 수 -->
      <%=memberCount %>
      <!-- 번호  이름  전화번호 -->
      <%=str.toString() %>
   </div>
</div>

</body>
</html>