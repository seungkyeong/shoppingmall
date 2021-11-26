<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.Product" %>    <!-- DAO 없는건 DTO임. -->
<%@ page import="product.ProductDAO" %>
<jsp:useBean id="productdao" class="product.ProductDAO"/>
<% request.setCharacterEncoding("utf-8"); %>

<% 
	//String productID = request.getParameter("productID"); //상품 이미지 클릭시 productID가 전달됨.
	//Product product = productdao.getProductID(productID);
	Product product = productdao.getProductID("22"); //임시적으로 처리했어요.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> <!-- 제이쿼리 사용 -->
<style>
strong{
	font-size: 24px;
}
#out{
	padding-top: 10px;
	margin: auto;
	width:70%;
}
#in td{
	padding:8px;
}
.a{
	font-size:18px;
	width:600px;
}
a{
	text-decoration: none;
	color: black;
	font-size: 20px;
	margin: 20px;
	padding: 10px 20px 10px 20px;
	border-radius: 5px;
	display: inline-block;
}
.blue{
	background-color: white;
	border: 2px solid #efefef;
}
.red{
	background-color: #efefef ;
	border-bottom: 5px solid #efefef ;
}

</style>
</head>
<body>
<!-- 상단바 include -->
<%@ include file = "../main/top.jsp" %>

<%!
	//String productName; //상품 이름
	//int productCost; //상품 가격 
	//int deliveryfee; //배송료
	//String imgFile = "test.jpg"; //테스트용 이미지
%>
<form action="productDetailRecieve.jsp" method="post"> <!-- 전달 장바구니 or 즉시구매 -->
<table id="out">
	<tr>
	<td style="width: 300px; height: 380px;"><img src="../productUpload/<%= product.getFileRealName() %>" width="340" height="380" alt="상품 사진입니다."></td>
	<td>
		<table id="in" style="margin-left: 20px;">
			<tr>
				<td colspan="2"><b><%= product.getProductName() %></b></td>
			</tr>
			<tr>
				<td><strong>판매가</strong></td><td class="a"><%= product.getProductPrice() %>원</td>
			</tr>
			<tr><td><strong>상품설명</strong></td><td class="a"><%= product.getProductInfo() %></td>
			<tr>
				<td><strong>수량</strong></td>
				<td><button type ="button" onclick="Count('p',this);">+</button>
        			<input type="text" id='count' onchange='getCount()' name="buyCount" value="0" readonly="readonly" style="text-align:center;"/>
        			<button type="button" onclick="Count('m', this);">-</button>
        		</td>
        	<tr>
        		<td><strong>합계</strong></td><td class="a"><label id="result">0</label>원</td><!-- 총가격-->
        	</tr>
        	<tr>
        		<td colspan="2"><hr></td>
        	</tr>
        	<tr>
        		<td colspan="2" style="text-align:center;"><a class="blue" href="cart.jsp.submit()">장바구니</a><a class="red" href="buynow.jsp.submit()">바로구매</a></td>
			</table>
</table>
</form>
<%
	int productPrice = product.getProductPrice();	
%>
<script>
//버튼 숫자 증감 함수
function Count(type, ths){
	//$는 제이쿼리임을 나타내는 것, 객체 그 자체를 저장 가능. 
	var $input = $(ths).parents("td").find("input[name='buyCount']"); //ths의 td가 부모인 input[name='buyCount']: input객체는 name을 기준으로 찾아 저장. 
    var Count = Number($input.val()); //카운트 값, $input변수의 value를 number로 변환해 저장.
    var maxCount = <%= product.getProductStock() %>; //최대 카운트 수를 재고 수로 설정.
    if(type=='p'){ //+ 누른 경우 
        if(Count < maxCount){ //재고보다 count가 작은 경우만 증가
        	Count += 1;	
        	$input.val(Count); //input값 조정
        	
        	var showResult = Count * <%= productPrice%>; //총수량
        	$("#result").html(showResult); //총가격 위치시키기
        }
        else{ //재고보다 count가 큰 경우 
        	alert('죄송합니다. 재고가 부족합니다.');
        }
    }
    else{ //- 누른 경우 
        if(Count > 0) { //count가 0보다 큰 경우만 감소
        	Count -= 1;
        	$input.val(Count);   
        
        	var showResult = Count * <%= productPrice%>; //총수량
        	$("#result").html(showResult); //총가격 위치시키기
        }
    }
}

//총가격 연산을 위해 input의 값 가져오기 
//function getCount(){
	//const getcount = document.getElementById('count').value;
	//const getAmount = getcount * < %= //product.getProductPrice() % >;
	//document.getElementById('totalPrice') = getAmount;
	
//}
</script>

<!-- 하단바 include -->
<%@ include file = "../main/footer.jsp" %>
</body>
</html>