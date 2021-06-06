/*==================
	Test04.java
===================*/

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test04 extends HttpServlet
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
		// 한글 깨짐 방지 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		// 동 이름 넘어온 데이터 수신
		String addr = request.getParameter("addr");
		
		// ※ 여기서도 역시 우편번호 데이터베이스가 있다고 가정하고...
		//    직접 ArrayList 구성하여 자료구조로 대체
		
		ArrayList<ZipCodeDTO> lists = new ArrayList<ZipCodeDTO>();
		
		if(addr.indexOf("서교") > -1)
		{
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 서교동 394-13"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 서교동 395-37 (용성빌딩)"));
			lists.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 20 (서교동)"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 서교동 395-36"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 서교동 395-35"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 서교동 395-32"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 서교동 395-31"));
			lists.add(new ZipCodeDTO("04044", "서울특별시 마포구 서교동 395-33"));
			lists.add(new ZipCodeDTO("04047", "서울특별시 마포구 서교동 396-29"));
			lists.add(new ZipCodeDTO("04047", "서울특별시 마포구 서교동 396-28"));

		}
		else if(addr.indexOf("역삼") > -1)
		{
			lists.add(new ZipCodeDTO("06252", "서울특별시 강남구 강남대로 324 (역삼동, 역삼디오슈페리움)"));
			lists.add(new ZipCodeDTO("06242", "서울특별시 강남구 강남대로 342 (역삼동, 역삼빌딩)"));
			lists.add(new ZipCodeDTO("06129", "서울특별시 강남구 강남대로 420 (역삼동, 역삼빌딩)"));
			lists.add(new ZipCodeDTO("06254", "서울특별시 강남구 강남대로62길 34 (역삼동, 역삼동839-5공동주택)"));
			lists.add(new ZipCodeDTO("06251", "서울특별시 강남구 강남대로66길 21 (역삼동, 역삼초등학교)"));
			lists.add(new ZipCodeDTO("06240", "서울특별시 강남구 강남대로78길 33-3 (역삼동, 역삼동827-72공동주택)"));
			lists.add(new ZipCodeDTO("06240", "서울특별시 강남구 강남대로84길 24-10 (역삼동, 역삼동빌딩)"));
			lists.add(new ZipCodeDTO("06129", "서울특별시 강남구 강남대로94길 19 (역삼동, 역삼동빌딩)"));
		}
		
		request.setAttribute("lists", lists);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test04OK.jsp");
		dispatcher.forward(request, response);
	}
}
