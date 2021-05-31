package com.test.mvc;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberListModel
{

	public String select(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException, SQLException
	{
		String result = "";
		
		request.setCharacterEncoding("UTF-8");
		
		MemberDAO dao = new MemberDAO();
				
		try
		{
			dao.connection();
			
			request.setAttribute("lists", dao.lists());
			
			result = "WEB-INF/view/MemberList.jsp";
			 
		} 
		catch (Exception e)
		{
			System.out.println(e.toString());
		} 
		
		finally
		{
			try
			{
				dao.close();
			}
			catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		return result;
	}

}