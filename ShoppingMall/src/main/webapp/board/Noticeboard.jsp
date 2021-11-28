<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- 공지사항 글쓰기 게시판, 이건 관리자만 보는 폼이다. -->

<div class="out">
	<form action="NoticeboardAction.jsp" method="post" enctype="multipart/form-data"> <!-- 파일을 보내려면 form에서 enType="multipart/form-data"를 해야함. -->
	<table id="out">
		<tr><td colspan="2" style="background-color: #f0f0f0; width:800px; height:80px; line-height: 100px; text-align: center; border-bottom: solid 3px #808080;"><h3 >공지사항</h3></td></tr>
		<tr><td class="title" style="height: 50px; line-height: 50px;"><label for="titleInput">제목</label></td><td><input type="text" name="noticeBbsTitle" id="titleInput" style="width: 575px;"></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr><td class="title" style="height: 200px; line-height: 100px; display:table-cell;"><label for="contentInput">내용</label></td><td><textarea style="resize:none; vertical-align: top;" rows="13" cols="80"  name="noticeBbsContent"  id="contentInput"></textarea></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr><td class="title" style="height: 80px;"><label>이미지</label></td><td><input type="file" name="noticeBbsImageFile" accept="image/*" onchange="" style="margin:0px 50px;"></td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr><td colspan="2" class="title">
				<input type="submit" value="등록하기" style="display:inline;"></td></tr>		
	</table>
	</form>
</div>

</body>
</html>