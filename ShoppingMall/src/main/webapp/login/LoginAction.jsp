<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>    
<%@page import="login.loginDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%-- <jsp:useBean id="user" class="Login.LoginDTO" scope="session" />
<jsp:setProperty name="user" property="id" />
<jsp:setProperty name="user" property="passwd" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String id=request.getParameter("id");
String passwd=request.getParameter("passwd"); 

loginDAO dao=new loginDAO();
//LoginDAO dao = LoginDAO.getInstance();
int check = dao.logincheck(id,passwd);
//boolean flag =dao.login(id, passwd);
//int result = dao.login(user.getId(),user.getPasswd());

//자바빈 사용
/* if(result ==1) {
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("location.href='top.jsp'");
	script.println("</script>");
}
else if(result == 0) {
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호가 틀립니다.')");
	script.println("history.back()");
	script.println("</script>");
}
else if(result ==-1) {
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('아이디가 존재하지 않습니다.')");
	script.println("history.back()");
	script.println("</script>");
}
else if(result ==-2) {
	PrintWriter script=response.getWriter();
	script.println("<script>");
	script.println("alert('오류.')");
	script.println("history.back()");
	script.println("</script>");
}  */

//버퍼사용
String msg = "";
if(check == 1) {
	session.setAttribute("sessionID",id); //로그인성공
	msg = "Logout.jsp";
}
else if(check ==0) {
	msg = "LoginForm.jsp?msg=0";
}
else {
	msg = "LoginForm.jsp?msg=-1";
}
response.sendRedirect(msg);  
//flag bool타입 사용
/* if(flag) {
	//로그인중인지 알 수 있는 세션에 저장
	session.setAttribute("loginok", "yes");
	
	//아이디와 체크값 저장
	session.setAttribute("idok", id);
	
	//체크하면 값으로 안하면 null값
	//session.setAttribute("saveok",saveid);
	
	//세션유지시간
	
	//로그인메인화면으로 이동
	response.sendRedirect("top.jsp");
}else {   */
%>
<%--  <script type="text/javascript">
alert("아이디와 비밀번호가 맞지 않습니다.");
history.back();
</script> 
<%} %>  --%>
</body>
</html>