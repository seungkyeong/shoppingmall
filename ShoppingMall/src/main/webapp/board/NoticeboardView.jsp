<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.noticeBbs" %>    <!--DTO -->
<%@ page import="bbs.noticeBbsDAO" %>
<jsp:useBean id="bbsDao" class="bbs.noticeBbsDAO"/>

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
	String userID = null;
	if(session.getAttribute("sessionID") != null){
		userID = (String)session.getAttribute("sessionID");
	}
	
	int bbsID = 5; 
	if(request.getParameter("bbsID") != null){
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	
	if(bbsID == 0){ 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='QnAboardList.jsp'"); //목록화면으로 이동
		script.println("</script>");
	}
	
	noticeBbs bbs = bbsDao.getBbs(bbsID);
%>

<div class="out">
	<input type="hidden" name="userID" value="${sessionScope.sessionID }">
	<table id="out">
		<tr><td colspan="2" style="background-color: #f0f0f0; width:800px; height:80px; line-height: 100px; text-align: center; border-bottom: solid 3px #808080;"><h3 >공지사항</h3></td></tr>
		<tr><td class="title"><label>제목</label></td><td><label style="width: 575px;"><%= bbs.getNoticeBbsTitle() %></label></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr><td class="title"><label>작성일자</label></td><td><label style="width: 575px;"><%= bbs.getNoticeBbsDate() %></label></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr><td class="title"><label>내용</label></td><td><label><%= bbs.getNoticeBbsContent() %></label></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<%if (bbs.getNoticeBbsFileRealName()==null) {%>
      <tr><td class="title"><label>이미지</label></td><td><p>사진없음</p></td></tr>
      <%}else { %>
      <tr><td class="title"><label>이미지</label></td><td><img src="../NoticeUpload/<%= bbs.getNoticeBbsFileRealName() %>" alt="이미지" style="width:200px; height:200px;"></td></tr>
      <%} %>
		<tr><td colspan="2"><hr></td></tr>
		<tr><td colspan="2" class="title"><button type="button" onClick="location.href='NoticeboardList.jsp'">목록</button></td></tr>		
	</table>
</div>

<!-- 하단바 include -->
<%@ include file = "../main/footer.jsp" %>
</body>
</html>