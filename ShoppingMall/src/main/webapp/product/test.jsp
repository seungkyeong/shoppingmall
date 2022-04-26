<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	border:2px;
	display: inline-block;
}
</style>
</head>
<body>
<%
		int i;
		int k;
		int j=0;
		for(i=0; i<3; i++){%>
				<div>
			<%for(k=0; k<3; k++){ %>

	<table id="list">
	<tr><td><img src="#" alt="이미지" width="70"></td></tr>
	<tr><td align="center">제목</td></tr>
	<tr><td align="center">가격</td></tr>
	</table>
		<% j++;
		if(j==2){%>
		</div>
		<%} %>
		<%j = 0; %>
	<%} %>
	<%} %>
</body>
</html>