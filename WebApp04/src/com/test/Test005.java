/*=======================
   Test005.java
   - Servlet 실습
=======================*/

package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test005 extends HttpServlet
{

   // HttpServlet 썼는데 Test005에 빨간줄이 안쳐짐 → 추상아님
   // 노란줄만 쳐져서 ↓ 추가함
   private static final long serialVersionUID = 1L;

   // get 방식의 요청에 대해 호출되어 실행되는 메소드
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
      doGetPost(request, response);
   }
   
   // post 방식의 요청에 대해 호출되어 실행되는 메소드
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
      doGetPost(request, response);
   }
   
   // get 방식의 요청이든 post 방식의 요청이든 모두 처리할 수 있는 사용자 정의 메소드
   protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {   
      // 한글 깨짐방지 처리
      request.setCharacterEncoding("UTF-8");
      
      // 이전 페이지로부터 데이터 수신(Test005.jsp에서 아이디와 비밀번호)
      String userId = request.getParameter("userId");
      String userPwd = request.getParameter("userPwd");
      
      response.setContentType("text/html; charset=UTF-8");
      
      String str = "아이디 : " + userId + ", 패스워드 : " + userPwd;
      
      
      
      try
      {
         PrintWriter out = response.getWriter();
         
         out.print("<html>");
         out.print("<head>");
         out.print("<title>");
         out.print("Test005.java");
         out.print("</title>");
         out.print("</head>");
         out.print("<body>");
         out.print("<div>");
         out.print("<h1>");
         out.print("서블릿 관련 실습");
         out.print("<hr>");
         out.print("</h1>");
         out.print("</div>");
         out.print("<div>");
         out.print("<h2>");
         out.print("HttpServlet 클래스를 활용한 서블릿 테스트");
         out.print("</h2>");
         out.print("<p>" + str + "</p>");
         out.print("<p>" + "method : " + request.getMethod() + "</p>");
         out.print("<p>");
         out.print("클라이언트 IP Address : " + request.getRemoteAddr());
         out.print("</p>");
         out.print("<p>" + "URI : " + request.getRequestURI() + "</p>");
         out.print("</div>");
         out.print("</body>");
         out.print("</html>");
         
         
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
   }

}

// 톰캣 혹은 아파치가 웹 컨테이너 역할..
// 웹 상에 자원을 적재할 창고? 컨테이너? 같은 것이 있음..
// 이 컨테이너 공간에는 웹 문서들이 적재되어 있어야 함.
// 이 공간을 톰캣을 이용해서 구성. 톰캣에 대한 설정 정보가 web.xml에 있다.(세부정보)
// (전체 정보는 server.xml에 있음.. port 번호 8090으로 바꿨던 그..)
// 재시작할때 콘솔에 빨간 글자 뜨는 건.. xml이나 class 파일들에
// 이상이 없는지 체크하는 것!!!

// 우리가 이클립스에서 열심히 자원들 만들어서 
// 톰캣이라는 컨테이너 사무실에다가 적재해두면 
// 클라이언트가 요청을하면 컨테이너에서 요청에맞는 자원들을 찾아서 
// 보여주는거...

