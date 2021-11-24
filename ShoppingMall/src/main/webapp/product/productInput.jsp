<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>상품 등록 페이지입니다.</h3>
<form action="productInputAction.jsp" method="post" enctype="multipart/form-data"> <!-- 파일을 보내려면 form에서 enType="multipart/form-data"를 해야함. -->
	<label for="productIDInput" style="margin: 0px 60px 0px 60px;">상품코드</label><input type="text" name="productID" id="productIDInput" style="width: 575px;">
	<hr>
	<label for="productNameInput" style="margin: 0px 60px 0px 60px;">상품이름</label><input type="text" name="productName" id="productNameInput" style="width: 575px;">
	<hr>
	<label for="productStockInput" style="margin: 0px 60px 0px 60px;">재고</label><input type="text" name="productStock" id="productStockInput" style="width: 575px; margin-left: 30px">
	<hr>
	<label for="productPriceInput" style="margin: 0px 60px 0px 60px;">가격</label><input type="text" name="productPrice" id="productPriceInput" style="width: 575px; margin-left: 30px">
	<hr>
	<label for="productInfoInput" style="margin: 0px 60px 0px 60px;">상품설명</label><textarea style="resize:none; vertical-align: top;" rows="13" cols="80"  name="productInfo"  id="productInfoInput"></textarea>
	<hr>
	<label style="margin: 0px 50px 0px 60px;">상품사진</label><input type="file" name="productImage" accept="image/*" onchange="" style="margin:0px 50px;">
	<hr>
	<input type="submit" value="상품등록">
</form>
</body>
</html>