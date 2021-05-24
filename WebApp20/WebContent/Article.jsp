<%@page import="com.test.BoardDTO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.test.BoardDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<%
	// 테스트 
	/* 
	String pageNum = request.getParameter("pageNum");
	String num = request.getParameter("num"); */
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 이전 페이지 (List.jsp = 목록 페이지)로부터 데이터 수신(pageNum, num)
	String pageNum = request.getParameter("pageNum");			// 페이지 번호
	int num = Integer.parseInt(request.getParameter("num"));	// 게시물 번호
	
	// 조회수 증가
	dao.updateHitCount(num);
	
	// 게시물 상세 내용 가져오기
	BoardDTO dto = dao.getReadData(num);
	
	// 이전, 다음 게시물 번호 확인
	int beforeNum = dao.getBeforeNum(num);
	int nextNum = dao.getNextNum(num);
	
	BoardDTO dtoBefore = null;
	BoardDTO dtoNext = null;
	
	if(beforeNum != -1)
		dtoBefore = dao.getReadData(beforeNum);
	if(nextNum != -1)
		dtoNext = dao.getReadData(nextNum);
	
	if(dto==null)	// 게시물 삭제한 상황
		response.sendRedirect("List.jsp");
	
	// 게시물 본문의 라인 수 확인 및 게시물 내용 재구성
	int lineSu = dto.getContent().split("\n").length;
	dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
	
		
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">
</head>
<body>

<%-- 
테스트
<h1>pageNum : <%=pageNum %></h1>
<h1>num : <%=num %></h1> --%>

<div id="bbs">

	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div><!-- bbs_title -->
	
	<div id="bbsArticle">
		
		<div id="bbsArticle_header">
			<!-- 게시물 제목 -->
			<%=dto.getSubject() %>
		</div><!-- bbsArticle_header -->
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd><%=dto.getName() %></dd>
				<dt>라인수</dt>
				<dd><%=lineSu %></dd>
			</dl>
		</div><!-- bbsArticle_bottomLine -->
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<dd><%=dto.getCreated() %></dd>
				<dt>조회수</dt>
				<dd><%=dto.getHitCount() %></dd>
			</dl>
		</div><!-- bbsArticle_bottomLine -->
		
		<div id="bbsArticle_content">
			<table style="width: 600;">
				<tr>
					<td style="padding: 10px 40px 10px 10px; vertical-align: top; height: 150;" >
						<%=dto.getContent() %>
					</td>
				</tr>
			</table>
		</div><!-- bbsArticle_content -->
		
		<div class="bbsArticle_bottomLine">
			<!-- 이전글 -->
			<%
			if(beforeNum != -1)
			{
			%>
			<a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum%>&num=<%=beforeNum%>">이전글 : (<%=beforeNum%>) <%=dtoBefore.getSubject() %></a>
			<%
			}
			else
			{
			%>
			이전글 : 없음
			<%
			}
			%>
		</div><!-- bbsArticle_bottomLine -->
		
		<div class="bbsArticle_noLine">
			<!-- 다음글 -->
			<%
			if(nextNum != -1)
			{
			%>
			<a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum%>&num=<%=nextNum%>">다음글 : (<%=nextNum %>) <%=dtoNext.getSubject() %></a>
			<%
			}
			else
			{
			%>
			다음글 : 없음
			<%
			}
			%>
		</div><!-- bbsArticle_noLine -->
		
	</div><!-- bbsArticle -->
	
	<div class="bbsArticle_noLine" style="text-align: right;" >
		<!-- From : 211.238.142.154 -->
		From : <%=dto.getIpAddr() %>
	</div><!-- bbsArticle_noLine -->

	<div id="bbsArticle_footer">
	
		<div id="leftFooter">
			<input type="button" value="수정" class="btn2"
			onclick="javascript:location.href='<%=cp%>/Updated.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="삭제" class="btn2"
			onclick="javascript:location.href='<%=cp%>/Delete.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
		</div><!-- leftFooter -->
		
		<!-- 검색 기능 적용 시 변경 예정  -->
		<div id="rightFooter">
			<input type="button" value="리스트" class="btn2"
			onclick="javascript:location.href='<%=cp %>/List.jsp?pageNum=<%=pageNum%>'">
		</div><!— rightFooter —>
		
	</div><!— bbsArticle_footer —>

</div> <!— #bbs —>


</body>
</html>