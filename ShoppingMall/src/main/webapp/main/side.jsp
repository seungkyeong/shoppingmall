<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#dndn {
	width:200px;
	background-color:white;
	border-right:2px solid #ddd;
	position:fixed;
	height:100%;
}
#h1 {
	font-size:23px;
	padding:0 40px;
	
}
.catemenu li {
	list-style:none;
}
.catemenu li a{
	height:40px;
	line-height:30px;
	display:block;
	padding:20 20px;
	font-size:16px;
	color:#555;
}
.catemenu li a:hover {
	background-color:grey;
	color:white;
}
</style>
<body>
<nav id="dndn">
<h1 id="h1">게시판</h1>
<ul class="catemenu">
	<li><a href="../board/NoticeboardList.jsp">공지사항</a></li>
	<li><a href="../board/QnAboardList.jsp">문의(Q&A)</a></li>
	<li><a href="../board/ReviewboardList.jsp">리뷰게시판</a></li>
</ul>
</nav>
</body>
</html>