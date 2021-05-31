package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberInsertModel
{
	public String process(HttpServletRequest request, HttpServletResponse response)
	{
		String result = "";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		

		try
		{
			dao.connection();
			MemberDTO dto = new MemberDTO ();
			
			dto.setMemberId(id);
			dto.setMemberPw(pw);
			dto.setName(name);
			dto.setTel(tel);
			dto.setEmail(email);
			
			dao.add(dto);
			
		}
		
		catch(Exception e)
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
		result = "WEB-INF/view/MemberInsert.jsp";
		return result;
	
	}
}
