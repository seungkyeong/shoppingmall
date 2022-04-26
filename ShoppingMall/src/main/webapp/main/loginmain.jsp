<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>#화음</title>
<style>
 body { margin:0; padding:0; }
 a { color:#05f; text-decoration:none; }
 a:hover { text-decoration:underline; }
 
 h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
 ul, lo, li { margin:0; padding:0; list-style:none; }

 section#content { float:right; width:500px;
 				   margin-right:400px; margin-top: 300px; 
 				   margin-bottom: 210px; }
 section#container::after { content:""; display:block; clear:both; } 

</style>
</head>
<body>
<div>
	<%@ include file="top.jsp" %>		
	
	<section id="container">
		<div id="container_box">		
			<section id="content">
				<h2> 본문 영역 </h2>
			</section>
		</div>
	</section>

	<%@ include file="footer.jsp" %>
		
</div>
</body>
</html>