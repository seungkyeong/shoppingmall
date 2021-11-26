<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>    <!--DTO -->
<%@ page import="bbs.BbsDAO" %>
<jsp:useBean id="bbsDao" class="bbs.BbsDAO"/>

<% request.setCharacterEncoding("utf-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.out {
width:800px;
height:600px;
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
</head>
<body>
<!-- 문의 게시판 목록 화면 -->

<!-- 상단바 include -->
<%@ include file = "../main/top.jsp" %>

<%
	//세션 체크 -> 수정, 삭제를 위헤
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	
	//bbsID를 초기화시킨 후 bbsID라는 데이터가 넘어온 것이 있다면 캐스팅하여 변수에 담는다.
	//int bbsID = 0;
	int bbsID = 10; //임의로 설정 
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	
	//만약 넘어온 데이터가 없다면 -> 삭제된 것임.
	if(bbsID == 0){ //null로 해도 되지 않나?
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='QnAboardList.jsp'"); //목록화면으로 이동
		script.println("</script>");
	}
	
	//유효한 글이라면 구체적인 정보를 'bbs'라는 인스턴스에 담는다.
	Bbs bbs = bbsDao.getBbs(bbsID);
%>

<div class="out">
	<div class="in">
		<div style="background-color: #f0f0f0; height: 100px; width: 800px; line-height: 100px; text-align: center; border-bottom: solid 3px #808080;">
			<h3 >문의(Q/A) 게시글</h3>
		</div>
		<form action="QnAboardAction.jsp" method="post" enctype="multipart/form-data"> <!-- 파일을 보내려면 form에서 enType="multipart/form-data"를 해야함. -->
		<input type="hidden" name="userID" value="${sessionScope.sessionID }">
			<div style="height: 50px; line-height: 50px;">
				<label style="margin: 0px 60px 0px 60px;">제목</label><label style="width: 575px;"><%= bbs.getBbsTitle() %></label>
			</div>
			<hr>
			<div style="height: 50px; line-height: 50px;">
				<label style="margin: 0px 60px 0px 60px;">작성자</label><label style="width: 575px;"><%= bbs.getUserID() %></label>
			</div>
			<hr>
			<div style="height: 50px; line-height: 50px;">
				<label style="margin: 0px 60px 0px 60px;">작성일자</label><label style="width: 575px;"><%= bbs.getBbsDate() %></label>
			</div>
			<hr>
			<div style="display:table-cell;">
				<label style="margin: 0px 60px 0px 60px;">내용</label><label><%= bbs.getBbsContent() %></label>
			</div>
			<hr>
			<div style="height: 200px;">
				<label style="margin: 0px 50px 0px 60px;">이미지</label><img src="../QnAUpload/<%= bbs.getFileRealName() %>" alt="이미지">
			</div>
			<hr>
			<div id="twobutton" style="width:800px; text-align:center;">
				<button type="button" onClick="location.href='QnAboardList.jsp'">목록</button>&nbsp;&nbsp;
				<input type="submit" value="수정" style="display:inline;">&nbsp;&nbsp;<button type="button" onClick="location.href='boardBack.jsp'">삭제</button>
			</div>
		</form>
	</div>
</div>

<!-- 하단바 include -->
<%@ include file = "../main/footer.jsp" %>
</body>
</html>