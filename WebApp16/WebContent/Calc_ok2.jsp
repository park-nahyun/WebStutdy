<%@page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	/* String strSu1 = request.getParameter("su1");
	int su1 = Integer.parseInt(strSu1); */
%>

<%
	/* // Calc.jsp 페이지로부터 데이터 수신				// 일종의 작업지시서.. 사용자한테 전달되는 것이 아니라 작업자에게 전달
   String strSu1 = request.getParameter("su1");		// 여기서 작업자는 jsp..의 가면을 쓴 서블릿
   String strSu2 = request.getParameter("su2");	    // 작업장은 jsp 컨테이너.. 지만 존재하지 않고 실은 서블릿 컨테이너
   String op = request.getParameter("op");			// 이 안에는 작업 파일이 꽂혀있는 캐비닛이 있는데 이게 서블릿 컨텍스트
   
   int su1, su2 = 0;
   String str = "";
   
   if(strSu1 == null || strSu2 == null)
   {
      response.sendRedirect("Calc.jsp");
   }
   else
   {
      su1 = Integer.parseInt(strSu1);
      su2 = Integer.parseInt(strSu2);
      
      // 자바에서 우리가 설계한 클래스를 사용하기 위해 객체 생성~!!!
      Calc ob = new Calc();						   // 객체 조립 작업을 서블릿이 하는 것(서블릿 입장에서.. '나'가 한다는 것)
      //--  이클립스 자동완성 기능을 사용하여 구문을 작성할 경우
      //     『@page import="com.test.Calc"』 이 구문도 함께 처리됨.
      //     혹은, 자동완성 기능을 사용하지 않을 경우도
      //     『@page import="com.test.Calc"』 이와 같은 구문을 직접
      //     작성해서 해당 클래스를 사용할 수 있도록 처리해 주어야 함.
      
      ob.setSu1(su1);
      ob.setSu2(su2);
      ob.setOp(op);
      
      str = ob.result();
   } */
%>


<!-- Calc 클래스의 객체를 현재 페이지에서 사용할 수 있도록 지정 -->
<jsp:useBean id="ob" class="com.test.Calc" scope="page"></jsp:useBean>
<!-- Calc 인스턴스 생성을 이걸로 대체.. 서블릿이 인스턴스를 생성함
     스크립릿이 없어서 서블릿 입장에서 Calc 객체 필요하구나~하고 설계도 찾아서 컴파일하고..
     라이프 사이클도 유지.. 이 모든게 서블릿이 하는 것 
     다시, useBean을 통해 Calc 객체 생성해달라고 요청한 것-->
<!-- 이 구문은 스크립 릿 영역에서
     『com.test.Calc ob = new com.test.Calc();』
     을 작성하여 import 구문을 자동으로 처리한 것과
     마찬가지의 효과를 적용하게 된다. -->

<!-- Line 5 ~ 6 에서와 같이 『request.getParameter()』 메소드를 통해 
     넘겨받은(전달받은) 데이터를
     『Calc』 객체 ob에 넘겨주기 위한 속성 지정 -->
     
<%-- <jsp:setProperty property="su1" name="ob" value="<%=su1%>" /> --%>
<!-- 이 구문은 Calc_ok1.jsp 의 『ob.setSu1(su1);』과 같은 구문 -->
<!-- ob 객체 안에는 여러 속성 값이 있다.. 지금은.. su1과 su2 op가 있음
      su1 받아온거를 담아서 value에 set해줘!
      이걸로 할때는 request.getParameter~ 웅엥~ 다함..-->

<!-- check~!!! -->
<!-- 속성 이름과 동일한 파라미터명인 경우 
     getParameter() 메소드 없이 바로 받을 수 있다.-->
     
<jsp:setProperty property="su1" name="ob"/>
<!-- 얘는 위와 다르가 밸류가 없음.. get웅엥 안함.. (주석처리함) 
     근데 일단 우리는 이 값을 앞 페이지에서 담아온 상태.
     이 때 서블릿 컨테이너는 ob의 속성을 구성해달라고 하네~
     Calc 인스턴스도 있네~ 이 안에 있는 속성 중에 su1을 set!해달라고 하네~ 로 알아들음.
     value가 없는데..? 그럼 서블린컨테이너는 request 상자를 열어서 su1을 찾아서 넣음..
     지가 이때 지가 알아서 setSu1 메소드(게터 세터)를 호출.. 
     getParameter 안해도 서블릿 컨테이너가 알아서 다 한다!
     여기서 String인 su1을 int인 su1으로(매개변수로 넘겨야 할..) 지가 다 형변환 알아서 함
     
     Bean은 규약, 즉 약속. 게터세터는 이미 약속되어있음. 표준화 되어있음! -->
     
<!-- ① request.getParameter() 처리 -->
<!-- ② ob.su1 → ob.setSu1() 처리 -->
<!-- ③ 매개변수를 전달하기 위한 타입(형) 변환 처리 -->
<!-- ==> 최종적으로 ob → Calc 객체의 su1 속성에
         이전 페이지로부터 넘겨받은 데이터를
         적절한 타입(형)으로 전달 -->

<jsp:setProperty property="su2" name="ob"></jsp:setProperty>
<jsp:setProperty property="op" name="ob"></jsp:setProperty>
<!-- 우리가 해야할 일은.. 세 줄.. -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok2.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
   <h1>두 번째 방법 처리 결과</h1>
   <hr>
</div>

<div>
   <h2><%= ob.result() %></h2>
</div>

</body>
</html>