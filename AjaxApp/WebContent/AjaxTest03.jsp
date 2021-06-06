<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AjaxTest03.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/main.css">
<style type="text/css">
   #result
   {
      display: inline-block;
      width: 250px;
      color: #F33;
   }
</style>

<script type="text/javascript" src="<%=cp %>/js/ajax.js"></script>
<script type="text/javascript">

   function check()
   {
      
      // 전통적인 방식, 데이터 받아서 내가 직접 이동하여 server쪽에 확인해보고 와서 다시 페이지 로드
      // 사용자한테는 잠시 대기하도록 하고 나는 이 자리에 있고 꼬맹이(XMLHttpRequest)한테 확인해보도록 시킴
      
      // 데이터 수집
      var id = document.getElementById("id").value;
      
      // URL 준비
      var url = "test03.do?id=" + id;
      
      // XMLHttpRequest 객체 생성
      ajax = createAjax();
      
      // 환경 설정(『open("페이지요청방식", "URL", 동기/비동기)』)
      ajax.open("GET", url, true);
      
      ajax.onreadystatechange = function()
      {
         if (ajax.readyState==4)
         {
            if (ajax.status==200)
            {
               // 업무 처리
               //-- 외부로 추출
               callBack();
            }
         }
      }
      
      // id=batman 을 보내면 1이 오도록, lhr을 넣으면 0이 나오도록..
      // 근데 보여지는데서 오고가는게 아니라 숨겨서 주고받을 수 있게..
      ajax.send("");
      
   }
   
   // 외부로 추출된 업무 처리 코드 
   //-- 아이디 중복 검사의 결과를 통보받아 사용자에게 메시지 출력
   //   →  span → id:result
   function callBack()
   {
      var data = ajax.responseText;   // Test03OK.jsp 의 result 가 여기에 담김
      
      data = parseInt(data);
      
      if (data==0)
         document.getElementById("result").innerText = "사용 가능한 아이디입니다.";
      else
         document.getElementById("result").innerText = "이미 사용중인 아이디입니다.";
      
   }
   
</script>

</head>
<body>

<div>
   <h1>회원가입</h1>
   <p>- AjaxTest03.jsp</p>
   <p>- ajax.js</p>
   <p>- main.css</p>
   <p>- Test03.java</p>      <!-- test03.do -->
   <p>- Test03OK.jsp</p>
   <p>- web.xml</p>
   <!-- 자료구조 활용 → superman, batman, admin -->
   <hr>
</div>

<table class="table">
   <tr>
      <th>아이디</th>
      <td>
         <input type="text" id="id" class="control" />
         <input type="button" value="중복검사" class="control" onclick="check()"/>
         <span id="result"></span>
      </td>
   </tr>
   
   <tr>
      <th>이름</th>
      <td><input type="text" id="name" class="control" /></td>
   </tr>
   
   <tr>
      <th>주소</th>
      <td><input type="text" id="iddr" class="control" /></td>
   </tr>
   
   <tr>
      <th>전화</th>
         <td><input type="text" id="tel" class="control" /></td>
   </tr>
   
   
</table>

</body>
</html>