<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.Product" %>    <!-- DAO 없는건 DTO임. -->
<%@ page import="product.ProductDAO" %>
<jsp:useBean id="productdao" class="product.ProductDAO"/>
<% request.setCharacterEncoding("utf-8"); %>

<% 
	String productID = request.getParameter("productID"); //상품 이미지 클릭시 productID가 전달됨. 
	Product product = productdao.getProductID(productID); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
</head>
<body>
<!-- 상단바 include -->
<%@ include file = "top.jsp" %>

<%!
	//String productName; //상품 이름
	//int productCost; //상품 가격 
	//int deliveryfee; //배송료
	//String imgFile = "test.jpg"; //테스트용 이미지
%>
<form action="productDetailRecieve.jsp" method="post">
<table>
	<tr>
	<td><img src="" width="340" height="300" alt="상품 사진입니다."></td>
	<td>
		<table>
			<tr>
				<td>상품명</td><td><%= product.getProductName() %></td>
			</tr>
			<tr>
				<td>상품가격</td><td><%= product.getProductPrice() %></td>
			</tr>
			<tr><td colspan="2"><%= product.getProductInfo() %></td>
			<tr>
				<td>구매수량</td>
				<td><button type ="button" onclick="Count('p',this);">+</button>
        			<input type="text" id='count' onchange='getCount()' name="buyCount" value="0" readonly="readonly" style="text-align:center;"/>
        			<button type="button" onclick="Count('m', this);">-</button>
        		</td>
        	<tr>
        		<td>합계</td><td><div id="result"></div></td><!-- 총가격-->
        	</tr>
        	<tr>
        		<td><hr></td>
        	</tr>
        	<tr>
        		<td><a href="cart.jsp.submit()">장바구니</a><a href="buynow.jsp.submit()">바로구매</a>
			</table>
</table>
</form>
<script>
//버튼 숫자 증감 함수
function Count(type, ths){
	//$는 제이쿼리임을 나타내는 것, 객체 그 자체를 저장 가능. 
	var $input = $(ths).parents("td").find("input[name='buyCount']"); //ths의 td가 부모인 input[name='buyCount']: input객체는 name을 기준으로 찾아 저장. 
    var Count = Number($input.val()); //카운트 값, $input변수의 value를 number로 변환해 저장.
    var maxCount = <%= product.getProductStock() %>; //최대 카운트 수를 재고 수로 설정.
    
    if(type=='p'){ //+ 누른 경우 
        if(Count < maxCount){ //재고보다 count가 작은 경우만 증가
        	$input.val(Number(Count)+1);
        }
        else{ //재고보다 count가 큰 경우 
        	alert('수량이 재고를 초과하였습니다.');
        }
    }
    else{ //- 누른 경우 
        if(Count > 0) { //count가 0보다 큰 경우만 감소
        	$input.val(Number(Count)-1);    
        }
    }
}

//총가격 연산을 위해 input의 값 가져오기 
function getCount(){
	const getcount = document.getElementById('count').value;
	const getAmount = getcount * <%= product.getProductPrice() %>;
	document.getElementById('totalPrice') = getAmount;
}
</script>

<!-- 하단바 include -->
<%@ include file = "footer.jsp" %>
</body>
</html>