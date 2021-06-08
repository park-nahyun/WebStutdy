<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>XmlTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

   $(function()
   {
      $("#sendBtn").click(function()
      {
         var params = "title=" + $.trim($("#title").val())
             + "&content=" + $.trim($("#content").val());
      
         $.ajax(
         {
            type : "POST"
            , url : "XmlTest02_ok.jsp"
            , data : params
            , dataType : "xml"   // check
            , success : function(xml)
            {
               $(xml).find("status").each(function()
               {
                  var status = $(this).text();
                  alert(status)   //--확인
               });
               
               var str = "";
               
               $(xml).find("records").each(function()
               {
                  var records = $(this);
                  var id = records.attr("id");
                  var title = $(this).find("title").text();
                  var content = $(this).find("content").text();
                  
                  str += ">> id=" + id + "<br> - title=" + title + "<br>"
                     + " - content=" + content + "<br><br>";
               });
               
               $("#resultDiv").html(str);
            }
            , beforeSend : showRequest   // true / false
            , error : function(e)
            {
               alert(e.responseText);   // 클라이언트
               console.log(e);         // 서버
            }
         }); 
      });
   });

   
   function showRequest(xhr)
   {
      var flag = true;
      
      if (!$.trim($("#title").val()))  
      {
          alert("제목을 입력해야 합니다.");
          $("#title").focus();
           flag = false;
       }
      
      if (!$.trim($("#content").val()))
      {
          alert("내용을 입력해야 합니다.");
          $("#content").focus();
          flag = false;
      }
      
      return flag; 
   }
   
</script>
</head>
<body>

<div>
   <h1>jQuery AJAX XML 관련 실습</h1>
   <hr>
</div>

<div>
   제목: <input type="text" id="title" class="txt"><br>
   내용: <input type="text" id="content" class="txt"><br>
   <br>
   <input type="button" value="전송확인" id="sendBtn" class="btn">
</div>

<br><br>

<div id="resultDiv">

</div>
</body>
</html>