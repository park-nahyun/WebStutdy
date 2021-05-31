/*=============================
   MemberListControlller.java 
=============================*/

package com.test.mvc;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberListController extends HttpServlet
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
	
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
	
		request.setCharacterEncoding("UTF-8");
		
		// Model  객체 연결
		MemberListModel model = new MemberListModel();
		String view = null;
		
		try
		{
			view = model.select(request, response);
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		// View 객체 연결
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}
	
}