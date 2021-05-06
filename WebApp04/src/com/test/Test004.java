/*======================
 	Test004.java
 	- Servlet 실습
 ======================*/

// 현재... 자바 기본 클래스 Test004
// 이를 Servlet 으로 구성하는 방법

// GenericServlet 을 상속받는 클래스로 설계



package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class Test004 extends GenericServlet
{

	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException
	{		//페어로 요청과 응답				//---------------클라이언트 요청있을 때 자동 호출
		response.setContentType("text/html; charset=UTF-8");	// 이런 유형의 응답을 할거야
		
		try
		{
			PrintWriter out = response.getWriter();
			
			out.print("<html>");
			out.print("<head>");
			out.print("<title>");
			out.print("Test004.java");
			out.print("</title>");
			out.print("</head>");
			out.print("<body>");
			out.print("<div>");
			out.print("<h1>");
			out.print("서블릿 관련 실습");
			out.print("</h1>");
			out.print("<hr>");
			out.print("</div>");
			out.print("<div>");
			out.print("<h2>");
			out.print("GenericService 클래스를 이용한 서블릿 테스트");
			out.print("</h2>");
			out.print("</div>");
			out.print("</body>");
			out.print("</html>");
			
		} 
		catch (Exception e)
		
		{
			System.out.println(e.toString());
		}
	}

}
