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
<title>JsonTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

   $(function()
   {
      $("#sendBtn").click(function()
      {
         var params = "name=" + $("#name").val()
            + "&content=" + $("#content").val();
         
         $.ajax(
         {
            type : "POST"
            , url : "JsonTest02_ok.jsp"		// check~!!!
            , data : params	
            , dataType : "json"       		// check~!!!
            , success : function(jsonObj)   // jsonObj로 받음
            {
               var out = "";
               
               /*
               var num = jsonObj.num;
               var name = jsonObj.name;
               var content = jsonObj.content;
               // 환경구축되면 자바에서 호출해서 사용하는 것처럼 jsonObj.num 이렇게 사용할 수 있음
               // json은 객체기반
               
               out += "<br>==================================";
               out += "<br>번호 : " + num;
               out += "<br>이름 : " + name;
               out += "<br>내용 : " + content;
               out += "<br>==================================<br>";
               
               $("#result").html(out);
               
               $("#name").val("");
               $("#content").val("");
               $("#name").focus();
               */
               
               for(var idx=0; idx<jsonObj.length; idx++)
               {
            	   var num = jsonObj[idx].num;
            	   var name = jsonObj[idx].name;
            	   var content = jsonObj[idx].content;
            	   
                   out += "<br>==================================";
                   out += "<br>번호 : " + num;
                   out += "<br>이름 : " + name;
                   out += "<br>내용 : " + content;
                   out += "<br>==================================<br>";
                   
                   $("#result").html(out);
                   
                   $("#name").val("");
                   $("#content").val("");
                   $("#name").focus();
               }
            }
            , beforeSend : showRequest
            , error : function(e)
            {
               alert(e.responseText);
            }
         });
      });       
   });
   
   function showRequest()
   {
      if(!$("#name").val())
      {
         alert("이름을 입력해야 합니다.");
         $("#name").focus();
         return false;
      }
      
      if(!$("#content").val())
      {
         alert("내용을 입력해야 합니다.");
         $("#content").focus();
         return false;
      }
      
      return true;
   }

</script>

</head>
<body>

<div>
   <h1>jQuery 의 ajax() 메소드 실습</h1>
   <p>json control</p>
   <hr>
</div>

<div>
   이름 : <input type="text" id="name" class="txt"><br>
   내용<br>
   <textarea rows="3" cols="50" id="content"></textarea>
   <br><br>
   
   <input type="button" value="등록하기" id="sendBtn" class="btn">
   <br><br>
</div>

<div id="result">
</div>

</body>
</html>