<%@ page import="java.util.Map" %>
<%@ page import="xamp.Answer" %><%--
  Created by IntelliJ IDEA.
  User: AD
  Date: 2/3/2024
  Time: 6:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Map<String, Answer> result = (Map<String, Answer>) session.getAttribute("result");
    long countTrue = result.entrySet().stream().filter(i->i.getValue().isTrue()).count();
    long countQuestion = result.size();
%>
<p>trả lời đúng: <%=countTrue%>/<%=countQuestion%></p>
</body>
</html>
