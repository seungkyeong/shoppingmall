<%@page import="java.io.PrintWriter"%>
<%@page import="login.loginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name=request.getParameter("name");
String email=request.getParameter("email"); 
loginDAO dao=new loginDAO();
String id = dao.idSearch(name,email);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(id == null) {
%>
<p>아이디는 <%=id %>
<%}else { %>
<p>아이디 ㄴㄴ
<%} %>
</body>
</html>