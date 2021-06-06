<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
   
   // check~!!!
   response.setContentType("text/xml");
   // 비록 jsp를 넘겨주지만 서블릿 컨테이너가 이걸 그릴 때는 xml로 그리라는 뜻
   //-- AJAX 객체에 데이터를 돌려줄 때
   //   클라이언트의 브라우저가 이 데이터를 XML로 인식할 수 있도록
   //   처리해야 하기 때문에
   //   MIME 타입을 XML로 선언한다. (Content Type을 MIME 타입이라고 함)
   
   // ※ (수신해서 처리해야 하는) 데이터가 한 개 이상일 경우...
   //    XML 이나 JSON 과 같이 구조화 시킬 수 있는 데이터로 전달하는 것이
   //    처리 과정에서 데이터를 다루기 용이하다.
   //    우편 번호에 대한 검색 결과는
   //    당연히 다량의 데이터를 전송해야 하기 때문에
   //    텍스트가 아닌 XML 형태로 반환하려고 하는 것이다.
   
   // 우리는 온전한 XML이 아니라, 서블릿한테 XML로 그려달라고 부탁하는 것
   // 지금 이 페이지 그려진 디자인 잘 볼 것!!
   // >< 는 붙여야 함
   

%><?xml version="1.0" encoding="UTF-8"?>
<list>
	<c:forEach var="item" items="${lists }">
	<item>
		<zipcode>${item.zipCode }</zipcode>
		<address>${item.address }</address>
	</item>
	</c:forEach>
</list>
