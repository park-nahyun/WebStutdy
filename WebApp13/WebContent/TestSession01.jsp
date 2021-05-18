<%@ page contentType="text/html; charset=UTF-8"%>
<%
   // TestSession01_ok.jsp 페이지에서 되돌려 보내면서
   // session의 userId에 superman을 담아서 보낸 상황
   String userId = (String)session.getAttribute("userId");
   //-- 『session.getAttribute("userId");』는
   //    Object 타입을 반환하므로
   //    String 타입으로 변환하는 과정 필요
   
   //세션 시간 변경 추가------------------------------------------
   
   // ※ 세션 기본 시간은 1800초
   
   session.setMaxInactiveInterval(30);
   //-- 세션이 유지되는 시간을 30초 변경하여 설정한 상태
   //   이로 인해 로그인 후 30초 뒤에 새로고침 하면 로그아웃 처리
   
   //-------------------------------------------------------------
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession01</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<script type="text/javascript">

   function sendIt()
   {
      //var f = document.getElemetById("myForm")
      var f = document.myForm;
      
      //var userId = document.getElementById("userId").value;
      
      if (!f.userId.value)
      {
         alert("아이디 입력");
         f.userId.focus();
         return;
      }
      
         
       if(!f.userPwd.value)
       {
          alert("패스워드 입력");
          f.userPwd.focus();
          return;
       }
      
      f.submit();
   }

</script>
</head>
<body>

<div>
   <h1>세션 처리-로그인</h1>
   <hr>
</div>

<div>
    <table>
       <tr>
          <td>
             | <a href="">
             <button type="button" class="btn01" 
             style="width:80px; font-size: 5pt;">게시판</button></a> |
          </td>
          <td>
             <%
             if (userId==null)
             {
             %>
             <a href="TestSession02.jsp">
             <button type="button" class="btn02" 
             style="width:80px; font-size: 5pt;">일정관리</button></a> |
             <%
             }
             else
             {
             %>
             <a href="TestSession02.jsp">
                <button type="button" class="btn01" 
                style="width:80px; font-size: 5pt;">일정관리</button></a> |      
            <%
            }
            %>
         </td>
         <td>
            <%
            if(userId==null)
            {
            %>
            <a href="">
            <button type="button" class="btn02" 
            style="width:80px; font-size: 5pt;">친구관리</button></a> |
            <%
            }
            else
            {
            %>
            <a href="TestSession03.jsp">
            <button type="button" class="btn01" 
            style="width:80px; font-size: 5pt;">친구관리</button></a> |
            <%
            }
            %>
          </td>
       </tr>
    </table>
    <br>
   <table>
      <tr>
         <td>
            <%
            if (userId==null)
            {
            %>
            <form action="TestSession01_ok.jsp" method="post" name="myForm">
               <table class="table">
                  <tr>
                     <th>아이디</th>
                     <td>
                        <input type="text" name="userId" style="width: 200px;">
                     </td>
                  </tr>
                  <tr>
                     <th>패스워드</th>
                     <td>
                        <input type="text" name="userPwd" style="width: 200px;">
                     </td>
                  </tr>
                  <tr>
                     <th colspan="2">
                        <button type="button" style="width: 100%;" onclick="sendIt()">로그인</button>
                     </th>
                  </tr>
               </table>
            </form>
            <%
            }
            else
            {
            %>
            <h2><%=userId %>님, 환영합니다.</h2>
            <h2>이제 일정관리와 친구관리 서비스를 이용하실 수 있습니다.</h2>
            <br>
            <p><a href="Logout.jsp">로그아웃</a></p>
            <%
            }
            %>
      </tr>
   </table>
</div>

</body>
</html>