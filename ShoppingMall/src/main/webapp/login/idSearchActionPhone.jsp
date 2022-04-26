<%@page import="java.io.PrintWriter"%>
<%@page import="Login.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name");
String birth=request.getParameter("birth"); 
String number=request.getParameter("tel"); 
LoginDAO dao=new LoginDAO();
String id = dao.idSearchPhone(name,birth,number);
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
<%if(id!=null) {%>
<form name="idSearch">
	<table>
		<tr><td align="center"><h2>아이디 찾기</h2></td></tr>
		<tr>
		<td align="center">회원님의 아이디는 <%=id %> 입니다.		
		</td></tr>
		
		<tr><td><hr></td></tr>
		<tr>
		<td align="center">
		<span onclick="location.href='LoginForm.jsp'">로그인 하기</span> | 
		<span onclick="location.href='PasswdSearch.jsp'">비밀번호 찾기</span>
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