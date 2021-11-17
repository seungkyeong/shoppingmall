<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
.top{
	position:relative;
}
#menu {
	border-top:1px solid black;
	border-bottom:1px solid black;
}
#menu ul {
	margin:0;
	padding:0;
	width:567px;
}
#menu ul li {
	display : inline-block;
	list-style-type:none;
	padding:0px 15px;
}

/*카테고리 꾸미기*/
#nav {
	border-top:1px solid black;
	border-bottom:1px solid black;
	list-style:none;
	height:40px;
	padding:5px 1px;
	margin:0;
}
#nav ul{
	list-style:none;
	position:absolute;
	padding:0;
	margin:0;
	left:0;
	top:40px;
	width:150px;
	text-align:center;
	opacity:0;
	border-left:1px solid black;
	border-right:1px solid black;
	border-bottom:1px solid black;
}

#nav ul li{
	float:none;
	padding:0;
	margin:0;
	font-size:10px;
}

#nav li{
	float:left;
	position:relative;
	padding:0;
	margin:5px 30px;
}
#nav li a{
	display:block;
	font-weight:bold;
	font-size:18px;
	padding:7px 8px;
	margin:0;
	text-decoration: none;
	color:black;
	
}

#nav li:hover ul{
	opacity:1;
}
#nav li:hover ul li{
	height:35px;
	overflow:visible;
	padding:0;
}
#nav ul li:hover a{
	background:#eee;
	font-weight:bold;
}

/*제일윗부분*/
.wrapper{
	margin : 0 auto;
	width : 1024px;
}
.top-menu .somtimes:hover p {
	color : darkgray;
}
.top {

position:fixed;
left:0;
padding:0;
width:100%;
height:20px;
padding-top:7px;
}
.top p {
	font-size:12px;
	line-height:20px;
}
.top p:hover {
	color: #a8a8a8;
}
.top-menu {
	display:inline;
}
.top-menu li {
	display:inline-block;
	list-style:none;
}
.top-menu .test {
	float:right;
	padding-right:20px;
}
.top-menu .test a p {
	float:right;
	color:black;
}
.top-menu .test:hover p {
	color : darkgray;
}

</style>
</head>
<body>
<center>
<div class="top">
	<div class="wrapper">
	<ul class = "top-menu">
		<li class="test"><a href="../join/JoinForm.jsp"><p>회원가입</p></a></li>	
		<li class="test"><a href="../login/LoginForm.jsp"><p>로그인</p></a></li>	
	</ul>
	</div>
</div><br><br>
<div>
<!-- <div id=login style="float:right;">
	<span style="color:gray;" onclick="location.href='../login/LoginForm.jsp'">로그인 |</span>
	<span style="color:gray;" onclick="location.href='../login/IdSearch.jsp'"> 회원가입</span>
</div> -->
	<header style="padding-top:6px;">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<h2 onclick="location.href='../main/main.jsp'">#화음 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="text" size="40" value="" placeholder="serach">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span onclick="location.href='../login/IdSearch.jsp'"><i class="fas fa-shopping-cart"></i></span>
	&nbsp;&nbsp;
	<span onclick="../login/IdSearch.jsp'"><i class="fas fa-user"></i></span>
	</header>
	<br>

	<ul id="nav">
	<li><a href="#">카테고리+</a>
		<ul>
			<li><a href="#">기초 스킨케어</a></li>
			<li><a href="#">메이크업</a></li>
			<li><a href="#">바디케어</a></li>
			<li><a href="#">미용소품</a></li>
		</ul>
	</li>
	<li><a href="#">랭킹</a></li>
	<li><a href="#">신상</a></li>
	<li><a href="#">이벤트</a></li>
	<li><a href="../board/QnAboard.jsp">게시판</a></li>
	</ul>
</div>
</center>
</body>
</html>