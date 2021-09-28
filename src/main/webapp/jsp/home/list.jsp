<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<Map<String, Object>> articleRows = (List<Map<String, Object>>) request.getAttribute("articleRows");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body>
	<h1>게시물 리스트 v1</h1>
	<ul>
		<li><%=(int) articleRows.get(0).get("id")%>번,<%=articleRows.get(0).get("regDate")%>,
			<%=(String) articleRows.get(0).get("title")%></li>
		<li><%=(int) articleRows.get(1).get("id")%>번,<%=articleRows.get(1).get("regDate")%>,
			<%=(String) articleRows.get(1).get("title")%></li>
		<li><%=(int) articleRows.get(2).get("id")%>번,<%=articleRows.get(2).get("regDate")%>,
			<%=(String) articleRows.get(2).get("title")%></li>
	</ul>
</body>
</html>