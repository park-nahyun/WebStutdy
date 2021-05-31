/*=============================
  MemberInsertController.java
 	- 서블릿 샘플
 =============================*/


package com.test.mvc;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberInsertController extends HttpServlet
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
		request.setCharacterEncoding("UTF-8");
		
		MemberInsertModel model = new MemberInsertModel();
		
		String view="";
		try
		{
			view = model.process(request, response);
		} 
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// View
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

}
