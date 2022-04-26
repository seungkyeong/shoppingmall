<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
	position:absolute;
  	padding : 150px 800px;
}
button {
	width:100%;
}
</style>
<script type="text/javascript">
	function nullCheck() {
		if(document.idSearch.name.value =="") {
			alert("이름을 입력해주세요.");
			document.idSearch.name.focus();
			return;
		}
		if(document.idSearch.email.value =="") {
			alert("이메일을 입력해주세요.");
			document.idSearch.email.focus();
			return;
		}
		document.idSearch.method="post";
		document.idSearch.submit();
	}
</script>
<body>
<jsp:include page ="../main/top.jsp" flush="false"/>
<form name="idSearch" action="idSearchAction.jsp" method="post">
	<table>
		<!-- <caption>로그인</caption> -->
		<tr><td align="center"><h2>아이디 찾기</h2></td></tr>
		<tr><td align="center">
		<label>
			<input type="radio" name="find" value="phone" onclick="location.href='IdSearch.jsp'">휴대전화
		</label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<label>
			<input type="radio" name="find" value="email" checked>이메일
		</label></td></tr>
		<tr><td>
		<input type="text" size="40" name="name" placeholder="이름"></td></tr>
		<tr><td>
		<input type="text" size="40" name="email" placeholder="email@naver.com"></td></tr>
		
		<tr><td>	
		<input type="button" style="width:320px" class="button" value="아이디 찾기" onclick="nullCheck()"></td></tr>

	</table>
</form>
</body>
</html>