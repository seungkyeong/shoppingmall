<%@page import="java.io.PrintWriter"%>
<%@page import="Login.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");
String name=request.getParameter("name"); 
String email=request.getParameter("email"); 
LoginDAO dao=new LoginDAO();
String pwd = dao.pwdSearch(id,name,email);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	position:absolute;
  	padding : 150px 800px;
	
}
</style>
</head>
<body>
<jsp:include page ="../main/top.jsp" flush="false"/>
<%if(pwd!=null) {%>
<form name="idSearch">
	<table>
		<tr><td align="center"><h2>비밀번호 찾기</h2></td></tr>
		<tr>
		<td align="center"><%=id %>님의 비밀번호는 <%=pwd %> 입니다.		
		</td></tr>
		
		<tr><td><hr></td></tr>
		<tr>
		<td align="center">
		<span onclick="location.href='LoginForm.jsp'">로그인 하기</span>
		</td></tr>
	</table>
</form>
<%} else { %>
<script type="text/javascript">
		alert("해당 정보가 없습니다.")
		history.back(-1)
</script>
<%} %>
</body>
</html>