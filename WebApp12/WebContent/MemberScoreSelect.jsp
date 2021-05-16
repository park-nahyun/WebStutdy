<%@page import="com.test.svt.MemberScoreDTO"%>
<%@page import="com.test.svt.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		str.append("<table class='table'>");
		str.append("<tr>");
		str.append("<th class='numTh'>번호</th>");
		str.append("<th class='nameTh'>이름</th>");
		str.append("<th class='txtScore'>국어점수</th><th class='txtScore'>영어점수</th><th class='txtScore'>수학점수 </th>");
		str.append("<th class='txtScore'>총점</th><th class='txtScore'>평균</th><th class='txtScore'>석차</th>");
		str.append("<th>성적관리</th>");
		str.append("</tr>");	
		
		for (MemberScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" + score.getSid() + "</td>");
			str.append("<td>" + score.getName() + "</td>");
			str.append("<td>" + score.getKor() + "</td>");
			str.append("<td>" + score.getEng() + "</td>");
			str.append("<td>" + score.getMat() + "</td>");
			str.append("<td>" + score.getTot() + "</td>");
			str.append("<td>" + String.format("%.2f", score.getAvg()) + "</td>");
			str.append("<td>" + score.getRank() + "</td>");
			
			// 성적 처리 항목(입력, 수정, 삭제)
			/* str.append("<td>");
			str.append("<button type='button' class='btn02'>");
			str.append("입력");
			str.append("</button>");
			str.append("<button type='button' class='btn01'>");
			str.append("수정");
			str.append("</button>");
			str.append("<button type='button' class='btn01'>");
			str.append("삭제");
			str.append("</button>");
			str.append("</td>"); */
			
			if (score.getKor()==-1 && score.getEng()==-1 && score.getMat()==-1)
			{
				str.append("<td>");
				str.append("<a href='MemberScoreInsertForm.jsp?sid=" + score.getSid() + "'>");
				str.append("<button type='button' class='btn01'>");
				str.append("입력");
				str.append("</button>");
				str.append("</a>");
				
				// 기능하지 않음
				str.append("<button type='button' class='btn02'>");
				str.append("수정");
				str.append("</button>");
				str.append("<button type='button' class='btn02'>");
				str.append("삭제");
				str.append("</button>");
				str.append("</td>"); 
			}
			else
			{
				// 기능하지 않음
				str.append("<td>");
				str.append("<button type='button' class='btn02'>");
				str.append("입력");
				str.append("</button>");
				
				str.append("<a href='MemberScoreUpdateForm.jsp?sid=" + score.getSid() + "'>");
				str.append("<button type='button' class='btn01'>");
				str.append("수정");
				str.append("</button>");
				str.append("</a>");
				
				str.append("<a href='javaScript:memberScoreDelete(" + score.getSid() + ", \"" + score.getName() + "\")'>");
				str.append("<button type='button' class='btn01'>");
				str.append("삭제");
				str.append("</button>");
				str.append("</td>");
				str.append("</a>");
			}
			
			str.append("</tr>");
		}
		str.append("</table>");
		
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
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css\MemberScore.css">
<script type="text/javascript">
	function memberScoreDelete(sid, name)
	{
		
		// ※ name 문자열을 넘기는 과정에서 따옴표 구성 주의~!!!	
		// 테스트
		// alert(sid);
		// alert(name);
		
		var res = confirm("번호 : " + sid + ", 이름 : " + name + "\n이 회원의 정보를 삭제하시겠습니까?");
	
		
		//-- confirm 창은 ture(확인) 또는 false(취소)를 반환
		
		if (res)
		{
			window.location.href="MemberScoreDelete.jsp?sid=" + sid;
		}
	}
</script>
</head>
<body>

<!-- http://localhost:8090/WebApp12/MemberSelect.jsp -->
<div>
   <h1>회원 명단 관리 및 출력 페이지</h1>
   <hr>
</div>
<div>
   <a href="MemberSelect.jsp"><button type="button">회원 명단 관리</button></a>
</div>
<br><br>

<div>
	<!-- 리스트 출력 -->
	<%=str %>
</div>

</body>
</html>