/*=============================================
    MVCSample02.java
    -Controller 역할을 수행할 서블릿 클래스
=============================================*/

package com.test.logic;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MVCSample02 extends HttpServlet
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
		// 서블릿 관련 코딩
		
		// 모델 객체 생성
		MVCSample02Model model = new MVCSample02Model();
		String view = model.actionCount(request, response); // 이만큼은 문자열로 바뀐다.. controller 요청을 받으면
											  // 자기가 할 일 하고 request에 setAttribute 한 다음
											  // "WEB-INF/~"(경로)를 반환
		
		RequestDispatcher rd = request.getRequestDispatcher(view);
		rd.forward(request, response);
	}

}
