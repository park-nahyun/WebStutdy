<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%><%
   // XmlTest02_ok.jsp
   
   String title = request.getParameter("title");
   String content = request.getParameter("content");
   
   response.setContentType("text/xml");
%><?xml version="1.0" encoding="UTF-8"?>
<%-- <lists>
   <total_dataCount>2</total_dataCount>
   <%
   for (int i=1; i<=2; i++)
   {
   %>
      <comment num="<%=i %>">
         <title><%=title + i %></title>
         <content><%=content + i %></content>
      </comment>
   <%
   }
   %>
</lists> --%>
<root>
   <status>true</status>
   <records id="1">
      <title>${param.title }1</title>
      <content>${param.content }1</content>
   </records>
   <records id="2">
      <title>${param.title }2</title>
      <content>${param.content }2</content>
   </records>
</root>