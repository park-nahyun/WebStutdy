/*==================
   Test05.java 
===================*/

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test05 extends HttpServlet
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
		// 한글 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		// 사용자가 타이핑 중인 단어 수신
		String search = request.getParameter("search");
		
		// db 연결 및 액션 처리
		// 『------------- where column like 'search%';』 와 같은 쿼리문 구성
		// 그에 따른 결과 수신
		
		// 위와 같이 조회한 결과를 가지고 ArrayList 활용
		ArrayList<WordDTO> list = new ArrayList<WordDTO>();
		
		if(search.equals("가"))
		{
			list.add(new WordDTO("가사"));
			list.add(new WordDTO("가위"));
			list.add(new WordDTO("가지"));
			list.add(new WordDTO("가방"));
			list.add(new WordDTO("가방끈"));
			list.add(new WordDTO("가방끈 매듭"));
			list.add(new WordDTO("가방끈 매듭 풀기"));
			list.add(new WordDTO("가방끈 매듭 묶는 법"));
			list.add(new WordDTO("가장자리 다듬기"));
		}
		else if(search.equals("가위"))
		{
			list.add(new WordDTO("가위"));
			list.add(new WordDTO("가위 구매"));
			list.add(new WordDTO("가위 손질하기"));
			list.add(new WordDTO("가위 추천"));
		}
		else if(search.equals("가방"))
		{
			list.add(new WordDTO("가방"));
			list.add(new WordDTO("가방끈"));
			list.add(new WordDTO("가방끈 매듭"));
			list.add(new WordDTO("가방끈 매듭 풀기"));
			list.add(new WordDTO("가방끈 매듭 묶는 법"));
		}
		else if(search.equals("가방끈"))
		{
			list.add(new WordDTO("가방끈"));
			list.add(new WordDTO("가방끈 매듭"));
			list.add(new WordDTO("가방끈 매듭 풀기"));
			list.add(new WordDTO("가방끈 매듭 묶는 법"));
			list.add(new WordDTO("가방끈 재료"));
		}
		
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test05OK.jsp");
		dispatcher.forward(request, response);
			
		
	}
}
