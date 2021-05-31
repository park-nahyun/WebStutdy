package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberInsertFormModel
{
	public String process(HttpServletRequest request, HttpServletResponse response)
	{
		String result = "";
		
		result = "WEB-INF/view/MemberInsertForm.jsp";
		
		return result;
	}
}
