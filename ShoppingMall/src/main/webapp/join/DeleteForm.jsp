<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 화면</title>
</head>
<style>
table {
	border:1px solid;
	margin-left: auto; 
	margin-right: auto;
}
</style>
<%@ include file="../main/top.jsp" %>
<body>
<script type="text/javascript">
 	// 비밀번호 미입력시 경고창
 	function checkValue(){
 		if(!document.deleteform.password.value){
 			alert("비밀번호를 입력하지 않았습니다.");
 			return false;
 		}
 	}
</script>
</body>
<center>
<div>
<br>
<b><font size="6" color="black">내 정보</font></b>
<br><br>
 
<form name="deleteform" method="post"
action="DeletePro.jsp?contentPage=member/pro/DeletePro.jsp"
onsubmit="return checkValue()">
<table>
 <tr><td>비밀번호</td>
 <td><input type="password" name="password" maxlength="50"></td>
 </tr>
 </table>
 
<br>
<input type="button" value="취소" onclick="javascript:window.location='../main/main.jsp'">
<input type="submit" value="탈퇴" />
</form>
</div> 
</center>
</html>