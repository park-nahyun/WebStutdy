/*=============================
  Test1.java
 	- 서블릿 샘플
 =============================*/


package com.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test1 extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		/* ① */
		/*
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw =  response.getWriter();
		
		pw.println("<html><body>");
		pw.println("<h1>name : " + "박민지" + "</h1>");
		pw.println("<h1>age : " + "13" + "</h1>");
		pw.println("</body></html>");
		*/
		
		// String name = "선혜연";
		// String age = "11";
		
		/*
		ServletConfig config = getServletConfig();
		
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw =  response.getWriter();
		
		pw.println("<html><body>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		pw.println("</body></html>");
		*/
		
		// ③ 『web.xml』에 『<init-param>』 추가 후
		/*
		// 『ServletConfig』
		//-- 컨테이너가 서블릿을 초기화 할 때
		//   서블릿 당 하나씩 ServletConfig 을 생성하게 된다.
		//   서블릿 원본 객체에 서블릿 설정 객체(ServetConfig)가 하나씩 따라다닌다.
		
		ServletConfig config = getServletConfig();
		
		// SC로부터 name, age를 얻어온다. 
		 
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw =  response.getWriter();
		
		pw.println("<html><body>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		pw.println("</body></html>");
		*/
		
		// 『web.xml』에 『<context-param>』 추가 후

		ServletConfig config = getServletConfig();
		
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		// 서블릿이 제공하는 컨텐츠 관리 객체
		// xml 참고.. type 변수(키)에 유머러스 값(값)을 넣어둔 거라 생각하면됨..
		ServletContext context = getServletContext();
		String type = context.getInitParameter("type");	
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw =  response.getWriter();
		
		pw.println("<html><body>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		pw.println("</body></html>");
		
		pw.println("<h1>type : " + type + "</h1>");
				
		pw.println("</body></html>");
				
	}

}
