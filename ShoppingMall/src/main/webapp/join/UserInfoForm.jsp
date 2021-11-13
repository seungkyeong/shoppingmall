<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jsp.member.model.MemberDAO" %>
<%@page import="jsp.member.model.MemberBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 내 정보 출력 화면</title>
</head>
<body>
<style>
 div{padding-left: 800px;}
 body{background-color : LemonChiffon}
</style>
<script type="text/javascript">
 
 function changeForm(val){
 if(val == "-1"){
 location.href="MainForm.jsp";
 }else if(val == "0"){
 
location.href="MainForm.jsp?contentPage=member/view/ModifyFrom.jsp";
 }else if(val == "1"){
 
location.href="MainForm.jsp?contentPage=member/view/DeleteForm.jsp";
 }
 } 
</script>
</body>
<%
 String id = session.getAttribute("sessionID").toString();
 
 // 세션에 저장된 아이디를 가져와서
 // 그 아이디 해당하는 회원정보를 가져온다.
 MemberDAO dao = MemberDAO.getInstance();
 MemberBean memberBean = dao.getUserInfo(id);
 %>
 <br>
 <b><font size="6" color="black">내 정보</font></b>
 <br><br>
 
 <table>
 <tr>
 <td id="title">아이디</td>
 </tr>
 <tr>
 <td><%=memberBean.getId() %></td>
 </tr>
 
 <tr>
 <td id="title">비밀번호</td>
 </tr>
 <tr>
 <td><%=memberBean.getPassword() %></td>
 </tr>
 
 <tr>
 <td id="title">이름</td>
 </tr>
 <tr>
 <td><%=memberBean.getName() %></td>
 </tr>
 
 <tr>
 <td id="title">성별</td>
 </tr>
 <tr>
 <td><%=memberBean.getGender() %></td>
 </tr> 
 
 <tr>
 <td id="title">생일</td>
 <td>
 <%=memberBean.getBirthyy() %>년
 <%=memberBean.getBirthmm() %>월
 <%=memberBean.getBirthdd() %>일
 </td>
 </tr> 
 
 <tr>
 <td id="title">이메일</td>
 </tr>
 <tr>
 <td>
<%=memberBean.getMail1() %>@<%=memberBean.getMail2() %>
 </td>
 </tr>
 
 <tr>
 <td id="title">전화번호</td>
 </tr>
 <tr>
 <td><%=memberBean.getPhone() %></td>
 </tr>
 <tr>
 <td id="title">주소</td>
 </tr>
 <tr>
 <td> <%=memberBean.getAddress() %></td>
 </tr>
 </table> 
 <br>
 <input type="button" value="회원 정보 수정"
onclick="changeForm(0)">
 <input type="button" value="탈퇴" onclick="changeForm(1)">
 <input type="button" value="확인" onclick="changeForm(-1)">
</html>