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
	<form action="QnAboardAction.jsp" method="post" enctype="multipart/form-data"> <!-- 파일을 보내려면 form에서 enType="multipart/form-data"를 해야함. -->
	<input type="hidden" name="userID" value="${sessionScope.sessionID }">
	<table id="out">
		<tr><td colspan="2" style="background-color: #f0f0f0; width:800px; height:80px; line-height: 100px; text-align: center; border-bottom: solid 3px #808080;"><h3 >문의(Q/A) 게시글</h3></td></tr>
		<tr><td class="title"><label>제목</label></td><td><label style="width: 575px;"><%= bbs.getBbsTitle() %></label></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr><td class="title"><label>작성자</label></td><td><label style="width: 575px;"><%= bbs.getUserID() %></label></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr><td class="title"><label>작성일자</label></td><td><label style="width: 575px;"><%= bbs.getBbsDate() %></label></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr><td class="title"><label>내용</label></td><td><label><%= bbs.getBbsContent() %></label></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr><td class="title"><label>이미지</label></td><td><img src="../QnAUpload/<%= bbs.getFileRealName() %>" alt="이미지" style="width:200px; height:200px;"></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr><td colspan="2" class="title"><button type="button" onClick="location.href='QnAboardList.jsp'">목록</button>&nbsp;&nbsp;
				<input type="submit" value="수정" style="display:inline;">&nbsp;&nbsp;<button type="button" onClick="location.href='boardBack.jsp'">삭제</button></td></tr>		
	</table>
	</form>
</div>

<!-- 하단바 include -->
<%@ include file = "../main/footer.jsp" %>
</body>
</html>