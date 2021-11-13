<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jsp.member.model.MemberDAO" %>
<%@page import="jsp.member.model.MemberBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정화면</title>
<%
 String id = session.getAttribute("sessionID").toString();
 
 MemberDAO dao = MemberDAO.getInstance();
 MemberBean memberBean = dao.getUserInfo(id);
 %>
 
 <style>
 div{padding-left: 800px;}
</style>
 
 <script>
 function init(){
	setComboValue("<%=memberBean.getMail2()%>");
 }
 function setComboValue(val) {
 	var selectMail = document.getElementById('mail2'); // select 아이디를 가져온다.
 	for (i = 0, j = selectMail.length; i < j; i++) { // select 하단 option 수만큼 반복문 돌린다.
 		if (selectMail.options[i].value == val) { // 입력된값과 option의 value가 같은지 비교
 			selectMail.options[i].selected = true; // 같은경우라면체크되도록 한다.
 			break;
 		}
 	}
 }
 
 // 비밀번호 입력여부 체크
 function checkValue() {
 	if(!document.userInfo.password.value){
 		alert("비밀번호를 입력하세요.");
 		return false;
 	}
 } 
 </script>

</head>
<body onload="init()">
<br>
 <b><font size="6" color="black" >회원정보 수정</font></b>
 <br><br>
<form method="post"
action="MainForm.jsp?contentPage=member/pro/ModifyPro.jsp"
 name="userInfo" onsubmit="return checkValue()">
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
 <td><input type="password" name="password"
maxlength="50"
 value="<%=memberBean.getPassword() %>"></td>
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
<input type="text" name="mail1" maxlength="50"
 value="<%=memberBean.getMail1() %>">
 @
<select name="mail2" id="mail2">
 <option value="naver.com">naver.com</option>
 <option value="gmail.com">gmail.com</option>
 <option value="daum.net" >daum.net</option>
 <option value="nate.com">nate.com</option> 
 </select>
 </td>
 </tr>
 
 <tr>
 <td id="title">전화번호</td>
 </tr>
 <tr>
 <td><input type="text" name="phone"
value="<%=memberBean.getPhone() %>"></td>
 </tr>
 <tr>
 <td id="title">주소</td>
 </tr>
 <tr>
 <td> <input type="text" size="50" name="address"
 value="<%=memberBean.getAddress() %>"></td>
 </tr>
 </table> 
 <br>
 <input type="button" value="취소"
onclick="javascript:window.location='MainForm.jsp'">
 <input type="submit" value="수정"/> 
 </form>

</body>
</html>