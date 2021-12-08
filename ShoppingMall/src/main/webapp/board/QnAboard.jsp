<!-- 문의 게시판 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 게시판</title>
<head>
<style>
.out {
width:800px;
height:600px;
margin:0 auto;
position: relative;
}
#out {
width:800px;
height:600px;
margin:0 auto;
position: relative;
}
.title{
width: 120px; 
text-align:center;
}
</style>
<body>
<%
	//로그인한 사람이면 userID라는 변수에 해당 아이디가 저장되고 그렇지 않으면 null값.
	String userID = null;
	if(session.getAttribute("sessionID") != null) {
		userID = (String)session.getAttribute("sessionID");
	}
%>

<jsp:include page ="../main/top.jsp" flush="false"/>
<div class="out">
	<form action="QnAboardAction.jsp" method="post" enctype="multipart/form-data"> <!-- 파일을 보내려면 form에서 enType="multipart/form-data"를 해야함. -->
	<input type="hidden" name="userID" value="${sessionScope.sessionID }">
	<table id="out">
		<tr><td colspan="2" style="background-color: #f0f0f0; width:800px; height:80px; line-height: 100px; text-align: center; border-bottom: solid 3px #808080;"><h3 >문의(Q/A)</h3></td></tr>
		<tr><td class="title" style="height: 50px; line-height: 50px;"><label for="titleInput">제목</label></td><td><input type="text" name="bbsTitle" id="titleInput" style="width: 575px;"></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr><td class="title" style="height: 200px; line-height: 100px; display:table-cell;"><label for="contentInput">내용</label></td><td><textarea style="resize:none; vertical-align: top;" rows="13" cols="80"  name="bbsContent"  id="contentInput"></textarea></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr><td class="title" style="height: 80px;"><label>이미지</label></td><td><input type="file" name="bbsImageFile" accept="image/*" onchange="" style="margin:0px 50px;"></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr><td colspan="2" class="title">
				<input type="submit" value="등록" style="display:inline;">&nbsp;&nbsp;<button type="button" onClick="history.back()">취소</button></td></tr>		
	</table>
	</form>
</div>

<div>
<%
	//로그인 안한 사람일 경우 
	//if(userID == null) {
		//창 나오는걸로 하면 될듯.
%>
<script>
//alert('로그인하세요');
//location.href='login.jsp'
</script>
<%
	//} 
%>
</div>

<%@ include file = "../main/footer.jsp" %>
</body>
</html>