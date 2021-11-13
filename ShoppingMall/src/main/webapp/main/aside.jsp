<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

 body { margin:0; padding:0; }
 a { color:#05f; text-decoration:none; }
 a:hover { text-decoration:underline; }
 
 h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
 ul, lo, li { margin:0; padding:0; list-style:none; }

#aside { float:left; width:180px; }
 #aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
#aside li { font-size:16px; text-align:center; }
 #aside li a { color:#000; display:block; padding:10px 0; }
 #aside li a:hover { text-decoration:none; background:#eee; }
 
#aside li { position:relative; }
#aside li:hover { background:#eee; }   
#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
#aside li:hover > ul.low { display:block; }
#aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
#aside li:hover > ul.low li a:hover { background:#fff;}
#aside li > ul.low li { width:180px; }
</style>
</head>
<body>

<div id="aside">

<h3>카테고리</h3>

<ul>
	<li><a href="">기초 스킨케어</a>
		<ul class="low">
			<li><a href="">스킨,로션</a>
			<li><a href="">에센스,크림</a>
			<li><a href="">클렌징</a>
		</ul>	
	</li>
	
	<li><a href="">메이크업</a>
		<ul class="low">
			<li><a href="">베이스</a>
			<li><a href="">아이</a>
			<li><a href="">립</a>
		</ul>	
	<li>
	
	<li><a href="">바디케어</a>
		<ul class="low">
			<li><a href="">로션/크림</a>
			<li><a href="">핸드/풋</a>
		</ul>	
	</li>
	
	<li><a href="">미용소품</a>
		<ul class="low">
			<li><a href="">네일소품</a>
			<li><a href="">페이스소품</a>
		</ul>	
	</li>
</ul>
</div>
</body>
</html>