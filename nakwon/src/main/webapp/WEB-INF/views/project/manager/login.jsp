<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.logintable {
	position:absolute;
  	padding : 90px 500px;
}
.loginbutton {
	width:100%;
}
</style>
</head>
<script type="text/javascript">
	function loginCheck() {
		if(document.loginform.userid.value =="") {
			alert("아이디를 입력해주세요.");
			document.loginform.userid.focus();
			return;
		}
		if(document.loginform.userpw.value=="") {
			alert("비밀번호를 입력해주세요.");
			document.loginform.userpw.focus();
			return;
		}
		document.loginform.submit();
	}
</script>
<body>
<form name="loginform" action="logincheck.do" method="post">
	<table class="logintable">
		<tr><td align="center"><h2>로 그 인</h2></td></tr>
		<tr><td>
		<input type="text" size="40" name="userid" placeholder="아이디"></td></tr>
		<tr><td>
		<input type="password" size="40" name="userpw" id="userpw" placeholder="비밀번호"></td></tr>	
		<tr><td>
		<input class="loginbutton" type="button" style="width:303px" value="로그인" onclick="loginCheck()"></td></tr>
		
		<c:if test = "${result==0 }">
		<script type="text/javascript">
		 alert("아이디 또는 비밀번호를 잘못 입력하셨습니다.");
		</script>
		</c:if>
	</table>
</form>
</body>
</html>