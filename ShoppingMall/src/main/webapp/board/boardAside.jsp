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

<h3>게시판</h3>

<ul>
	<li><a href="">공지사항</a></li>
		
	<li><a href="">문의(Q&A)</a><li>
	
	<li><a href="">리뷰게시판</a></li>
	
</ul>
</div>
</body>
</html>