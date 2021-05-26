/*=============================
  Test2.java
 	- 서블릿 샘플
 =============================*/


package com.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test2 extends HttpServlet
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
		// test2.jsp 에서 수신받은 데이터를 처리해서 result.jsp 페이지로 보낼 것
		
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		String str = "이름은 " + name + ", 나이는 " + age + "세";
		
		// 포워딩하는 페이지에 값을 넘기기 위한 준비(설정)
		request.setAttribute("result", str);
		//-- str 값을 result 라는 이름으로 Test2_result.jsp 에 넘길 준비
		
		// 포워딩
		RequestDispatcher rd = request.getRequestDispatcher("/Test2_result.jsp");
		rd.forward(request, response);
	}

}
