<%@ page contentType="text/html; charset=UTF-8"%>
<%
   /* String num1Str = request.getParameter("num1");
   String num2Str = request.getParameter("num2");
   String calResult = request.getParameter("calResult");

   int num1=0;
   int num2=0;
   String result = "";

   try
   {
         num1 = Integer.parseInt(num1Str);
         num2 = Integer.parseInt(num2Str);
   
         if(calResult.equals("1"))
            result = String.format("%d + %d = %d", num1, num2, (num1+num2));
          else if(calResult.equals("2"))
            result = String.format("%d - %d = %d", num1, num2, (num1-num2));
         else if(calResult.equals("3"))
            result = String.format("%d * %d = %d", num1, num2, (num1*num2));
         else if(calResult.equals("4"))
            result = String.format("%d / %d = %.1f", num1, num2, (num1/(double)num2));
   }
   catch(Exception e)
   {
      System.out.println(e.toString());
   }

   request.getSession().setAttribute("resultStr", result);
   
   // check!
   RequestDispatcher dispatcher = request.getRequestDispatcher("Receive12.jsp");
   dispatcher.forward(request,response); */
   
   //-------------------------------------------------------------------------------------------------
   
     // Redirect12.jsp
   
   // 데이터 수신
   
   int num1 = Integer.parseInt(request.getParameter("num1"));
   int num2 = Integer.parseInt(request.getParameter("num2"));
   
   String cal = request.getParameter("calResult");
   

      //연산 처리
   String result ="";

   if (cal.equals("1"))
   {
      result += String.format("%d", (num1+num2));
   }
   else if (cal.equals("2"))
   {
      result += String.format(" %d",(num1-num2));
   }
   else if (cal.equals("3"))
   {
      result += String.format("%d", (num1*num2));
   }
   else if (cal.equals("4"))
   {
      result += String.format("%.1f",(num1/(double)num2));
   }
      //check ~!!!
      // 결과 데이터 재전송 →sendRedirect() 메소드 사용
      // ※ response 객체의 주요 메소드 중 하나인 『sendRedirect(String location)』
      //    : 지정된 URL(location)로 요청을 재전송한다.
      // 리퀘스트가 이자리에서 소멸되기 때문에 Receive16.jsp까지 이어서 넘어가질 않는다
      response.sendRedirect("Receive12.jsp?num1="+num1+"&num2="+num2+"&cal="+cal+"&result="+result);
       
      //request.getSession().setAttribute("resultStr", result); << 내가 한 것

      //session.setAttribute("message", result);

	  // 리다렉으로 넘어갈땐 포스트방식인데 리다렉에서 리시브로 넘어갈땐 겟방식되는겨
   
%>