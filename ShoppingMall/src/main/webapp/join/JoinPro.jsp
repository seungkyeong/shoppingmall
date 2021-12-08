<%@page import="Member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Member.MemberBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리내용</title>
<style>
#wrap{
	padding-top:50px;
	padding-left: 800px;
}
</style>
</head>
<body>
<%@include file="../main/top.jsp" %>
<%
 // 한글 깨짐을 방지하기 위한 인코딩 처리
 request.setCharacterEncoding("UTF-8"); 
%>
<jsp:useBean id="memberBean" class="Member.MemberBean" />
<jsp:setProperty property="*" name="memberBean"/>
<%
MemberDAO dao = MemberDAO.getInstance();
dao.insertMember(memberBean);
%>
<!-- 화면출력 -->
<div id="wrap">
<br><b><font size="5" color="gray">회원가입 정보를 확인하세요.</font></b>
<br><br>
<font color="blue"><%=memberBean.getName() %></font>님 가입을 축하드립니다.
<br><br>
<br><br>
 
<table>
 <tr><td id="title"><b>아이디</b></td>
 </tr>
 <tr><td><%=memberBean.getId() %></td>
 </tr>
 
 <tr><td id="title"><b>비밀번호</b></td>
 </tr>
 <tr><td><%=memberBean.getPassword() %></td>
 </tr>
 
 <tr><td id="title"><b>이름</b></td>
 </tr>
 <tr><td><%=memberBean.getName() %></td>
 </tr>
 
 <tr><td id="title"><b>성별</b></td>
 </tr>
 <tr><td><%=memberBean.getGender() %></td>
 </tr> 
 
 <tr><td id="title"><b>생일</b></td>
 </tr>
 <tr><td>
 <%=memberBean.getBirthyy() %>년
 <%=memberBean.getBirthmm() %>월
 <%=memberBean.getBirthdd() %>일
 </td></tr>
 
 
 <tr><td id="title"><b>이메일</b></td>
 </tr>
 <tr><td>
 <%=memberBean.getMail1() %>@<%=memberBean.getMail2() %>
 </td></tr>
 
 <tr><td id="title"><b>전화번호</b></td>
 </tr>
 <tr><td><%=memberBean.getPhone() %></td>
 </tr>
 <tr><td id="title"><b>주소</b></td>
 </tr>
 <tr><td> 
 <%=memberBean.getAddress() %></td>
 </tr>
</table> 
<br>
<input type="button" value="확인" onclick="javascript:window.location='../main/main.jsp'"> 

</div>
</body>
</html>