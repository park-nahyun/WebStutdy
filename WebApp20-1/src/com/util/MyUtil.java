/*=======================
 	MyUtil.java
 	- 게시판 페이징 처리
========================= */

// check~!!!
// 지금 같이 확인해보고자 하는 페이징 처리 기법은
// 다양한 방법들 중 한가지(그나마 쉬운 것을 고르고 고른 것)이다.
// 학습을 마친 후에... 꼭 추가적으로 개념을 정리하고
// 확장시키고, 다른 방법들도 찾아보고 공부해야 한다.


package com.util;

public class MyUtil
{
	
	// ■ 전체 페이지 수를 구하는 메소드
	// numPerPage : 한 페이지에 표시할 데이터(게시물)의 수
	// dataCount : 전체 데이터(게시물) 수
	
	public int getPageCount(int numPerPage, int dataCount)
	{
		int pageCount = 0;
		
		pageCount = dataCount/numPerPage;
		
		if(dataCount % numPerPage != 0)
			pageCount++;	// 19페이지까지 꽉채우고 남은 글들 넣어야 하니까 +1
		
		
		return pageCount;
	} // end getPageCount()
	//-- 한 페이지에 10개의 게시물을 출력할 때
	//   총 32개의 게시물을 페이지로 구성하기 위해서는
	//   『32 / 10』의 연산을 수행하여 결과 3을 얻을 수 있다.
	//   → 『pageCount = dataCount/numPerPage;』
	// 그런데 이 때, 나머지 2개의 게시물을 출력해 주기 위해서는
	// 페이지 하나가 더 필요하다.
	
	
	// ■ 페이징 처리 기능의 메소드
	// currentPage : 현재 표시할 페이지
	// totalPage : 전체 페이지 수
	// listUrl : 링크를 설정할 url
	public String pageIndexList(int currentPage, int totalPage, String listUrl)
	{
		// 실제 페이징을 저장할 StringBuffer 변수
		StringBuffer strList = new StringBuffer();
		
		int numPerBlock = 10;
		//-- 페이징 처리 시 게시물 리스트 하단의 숫자를 10개 씩 보여주겠다.
		
		int currentPageSetup;
		//-- 현재 페이지 설정값(페이지를 기준으로 보여주는 숫자가 달라져야 하기 때문)
		//   페이지번호 11~20이 보인다면.. currentPageSetup은 10..
		//				21~30이 보인다면..                    20..     
		
		int page;
		int n;
		//-- 이전 페이지 블럭과 같은 처리에서 이동하기 위한 변수
		//   (얼마만큼 이동해야 하는지...)
		
		// 아무 게시물이 없을 때...
		// 페이징 처리가 별도로 필요하지 않은 경우
		//-- 데이터가 존재하지 않거나
		//   데이터의 수가 1 페이지도 못 채우는 경우는
		//   별도로 페이징 처리를 할 필요가 없다.
		if(currentPage == 0)
			return "";
		
		// 페이지 요청을 처리하는 과정에서
		// URL 경로의 패턴에 대한 처리
		/*
		   - List.jsp → List.jsp + 『?』 → List.jsp?	[   ]
		   
		   - List.jsp?pageNum=4 → List.jsp?pageNum=4 + 『&』 → List.jsp?pageNum=4&  [   ]
		   		뒤에다 뭔갈 결합하게다는 의도..		
		   		
		  
		 */
		
		// listUrl 문자열 안에 있는 ? 의 인덱스 값 반환

		if(listUrl.indexOf("?") != -1)		// 링크를 설정할 URL 에 『?』 가 들어 있으면...
			listUrl = listUrl + "&";
		else								// 링크를 설정할 URL 에 『?』 가 없으면...
			listUrl = listUrl + "?";		
		//-- 예를 들어, 검색값이 존재하면 이미 request 값에
		//   searchKey 값과 searchValue 값이 들어있는 상황이므로
		//   『&』를 붙여서 추가해 주어야 한다.
		
		// currentPageSetup = 표시할 첫 페이지 - 1
		
		currentPageSetup = (currentPage / numPerBlock) * numPerBlock;
		//-- 만약 현재 페이지가 5 페이지이고 (currentPage=5)
		//   리스트 하단에 보여줄 페이지 개수가 10이면(numPerBlock=10)
		//   『5 / 10 = 0』 이며... 여기에 『*1 0』 (10을 곱해도) 0이다.
		//   하지만, 현재 페이지가 11 페이지라면 (currentPage=11)
		//   『11 / 10 = 1』 이며... 여기에 『*1 0』 (10을 곱하면) 10이다.
		//    그러면 currentPageSetup은 10이 되는 것이다.
		
		if(currentPage % numPerBlock == 0)
			currentPageSetup = currentPageSetup - numPerBlock;
		//-- 만약 위 처리에서 (라인 85)
		//   현재 페이지가 20 페이지였다면 (currentPage=20)
		//   『20 / 10 = 2』 이며... 여기에 『* 10』 (10을 곱해서)
		//   20이 되는데
		//   이런 상황이라면 다시 10을 빼서 10으로 만들어주어야 한다.
		
		
		// 1 페이지 (→ 맨 처음으로)
		if ( (totalPage>numPerBlock) && (currentPageSetup>0) )
			strList.append(" <a href-'" + listUrl + "pageNum=1'>1</a>");
		//-- listUrl 은 전처리가 이미 끝난 상황이기 때문에
		//   『...?』 상태이거나 또는 『...?...&』 인 상태이다.
		//   이로 인해 결과는 『...?pageNum=1』 이거나
		//   『...&pageNum=1』가 되는 상황이다.
		
		// Prev (→ 이전으로)
		n = currentPage - numPerBlock;
		if( (totalPage>numPerBlock) && (currentPageSetup>0) )
			strList.append(" <a href='" + listUrl + "pageNum=" + n + "'>Prev</a>");
		//-- currentPageSetup 이 0 보다 큰 경우는
		//   이미 페이지가 10 이상이라는 의미이며
		//   이 때, 현재 페이지(currentPage)가 11 페이지 이상일 경우
		//   『Prev』를 붙이기 위한 내용.
		//-- 『Prev』를 클릭할 경우
		//    n 변수 페이지로 이동하는데 12에서  『Prev』할 경우
		//    2 페이지가 되고, 22에서 『Prev』할 경우 12페이지가 될 수 있도록 처리하는 방식이다.
		
		// 바로가기
		page = currentPageSetup + 1;
		//-- 『+1』을 하는 이유는
		//   앞에서 구성한 바와 같이 currentPageSetup에서 10을 가져왔다면
		//   10부터 시작하는 것이 아니라
		//   바로가기 페이지는 11부터 시작해야 하기 때문이다.
		
		while ( (page<=totalPage) && (page<=currentPageSetup + numPerBlock) )
		{		// page는 totalPage를 넘어갈 순 없지..
				// 반복문 돌릴 때 최대 페이지보다 적고 현재페이지 설정값+넘퍼블럭 더한값보다 적은동안만 돌리는거
				// 예를들어서 최대 32페이지 까지 있는데 현재페이지 설정값이 0이고 넘퍼블락이 10이면
				// page는 1인 상태잖아 / 그럼 1부터 10까지 도는거야 / 1 2 3 4 5 6 7 8 9 10 이렇게 찍어주는거지
			if (page == currentPage)
				strList.append(" <span style='color:orange; font-weight:bold;'>" + page + "</span>");
				// 현재 내가 머무는 페이지는 스타일만 구성
			else
				strList.append(" <a href='" + listUrl + "pageNum=" + page + "'>" + page + "</a>");
				// 넘어가야 할 페이지는 url 연결되게 끔..
			
			page++;
		}
		
		// Next (→ 다음으로)
		n = currentPage + numPerBlock;
		if ( (totalPage - currentPageSetup) > numPerBlock )
			strList.append(" <a href='" + listUrl + "pageNum=" + n + "'>Next</a>");
		
		// 마지막 페이지 (→ 끝으로)
		if ( (totalPage > numPerBlock) && ( (currentPageSetup + numPerBlock)<totalPage ) )
			strList.append(" <a href='" + listUrl + "pageNum=" + totalPage + "'>" + totalPage + "</a>");
		
		return strList.toString();
		
	
	} // end pageIndexList()
	
	
	
	
}	

