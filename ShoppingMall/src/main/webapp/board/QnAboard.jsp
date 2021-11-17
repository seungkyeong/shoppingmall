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
height:470px;
margin:0 auto;
position: relative;
}
.in {
width:800px;
height:360px;
top: 50%;
left:50%
transform:translate(-50%, -50%);
}

</style>
<body>
<%
	//로그인한 사람이면 userID라는 변수에 해당 아이디가 저장되고 그렇지 않으면 null값.
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
	}
%>

<jsp:include page ="../main/top.jsp" flush="false"/>
<div class="out">
	<div class="in">
		<div style="background-color: #f0f0f0; height: 100px; width: 800px; line-height: 100px; text-align: center; border-bottom: solid 3px #808080;">
			<h3 >문의(Q/A)</h3>
		</div>
		<form action="QnAboardAction.jsp" method="post">
		<input type="hidden" name="board_id" value="${sessionScope.sessionID }">
			<div style="height: 50px; line-height: 50px;">
				<label for="titleInput" style="margin: 0px 60px 0px 60px;">제목</label><input type="text" name="bbsTitle" id="titleInput" style="width: 575px;">
			</div>
			<hr>
			<div style="height: 200px; line-height: 100px; display:table-cell;">
				<label for="contentInput" style="margin: 0px 60px 0px 60px;">내용</label><textarea style="resize:none; vertical-align: top;" rows="13" cols="80"  name="bbsContent"  id="contentInput"></textarea>
			</div>
			<hr>
			<div style="height: 80px;">
				<label style="margin: 0px 50px 0px 60px;">이미지</label><br>
				<input type="file" name="bbsImageFile" accept="image/*" onchange="" style="margin:0px 50px;">
			</div>
			<hr>
			<div id="twobutton" style="width:800px; text-align:center;">
				<input type="submit" value="등록" style="display:inline;">&nbsp;&nbsp;<button type="button" onClick="location.href='boardBack.jsp'">취소</button>
			</div>
		</form>
	</div>
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