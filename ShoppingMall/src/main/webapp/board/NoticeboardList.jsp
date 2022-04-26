<%@page import="bbs.noticeBbs"%>
<%@page import="bbs.noticeBbsDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#list {
text-align:center;
border:1px solid;
width:800px;
height:800px;
margin:130 auto;
position: relative;
}
a ,a:hover{
color: #000000;
text-decoration: none;
}
</style>
<body>
<%@ include file="../main/top.jsp" %>
<%@include file="../main/side.jsp" %>
<table id="list">
	<th style="text-align:center">NO</th>
	<th style="text-align:center">제목</th>
	<th style="text-align:center">작성자</th>
	<th style="text-align:center">작성일</th>
	<tr><td colspan="4"><hr></td></tr>

<%
		noticeBbsDAO DAO = new noticeBbsDAO();
		ArrayList<noticeBbs> list=DAO.getNoticeAll();
		for(noticeBbs p:list){		
%>
	<tr>
	<td align="center"><%=p.getNoticeBbsID() %></td>
	<td align="center"><a href="NoticeboardView.jsp?bbsID=<%=p.getNoticeBbsID() %>"><%=p.getNoticeBbsTitle() %></a></td>
	<td align="center">관리자</td>
	<td align="center"><%=p.getNoticeBbsDate() %></td>
	</tr>
	<tr><td colspan="4"><hr></td></tr>
	<%} %>
</table>

<!-- <table width="100%" cellpadding="0" cellspacgin="0" border="0">
<tr><td colspan="4" height="5"></td></tr>
<tr align="center"><td>
<button type="button" onclick="location.href='board.jsp'">글쓰기</button>
</table> -->

<%@ include file="../main/footer.jsp" %>	
</body>
</html>