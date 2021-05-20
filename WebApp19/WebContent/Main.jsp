<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Top.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
   <table style="width: 400px;" border="1">
      <tr>
         <td colspan="2">
            <!-- Top -->
            <jsp:include page="Top.jsp" flush="false"></jsp:include>
         </td>
      </tr>
      <tr style="height: 300px;">
         <td style="width: 120px;">
            <!-- Left -->
            <jsp:include page="Left.jsp" flush="false"></jsp:include>
         </td>
         <td>
            메인 화면
         </td>
      </tr>
      <tr>
         <td colspan="2">
            <!-- Bottom -->
            <jsp:include page="Bottom2.jsp" flush="false"></jsp:include>
         </td>
      </tr>
   </table>
</div>

</body>
</html>