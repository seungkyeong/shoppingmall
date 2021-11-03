<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	String productName; //상품 이름
	int productCost; //상품 가격 
	int deliveryfee; //배송료
	String imgFile = "test.jpg"; //테스트용 이미지
%>
<!-- 상단바 include -->

<form action="cart.jsp">
<div style="float: left; width: 45%; padding:10px;">
	<img src="C:\Users\myrud\eclipse-workspace\ShoppingMall\src\main\webapp\test.jpg" alt=""/>
</div>
<div style="float: left; width: 45%; padding:10px;">
<h2>상품이름<%=productName %> </h2> <!-- 출력보려고 상품이름 넣어놨어용 -->
<h2 style="color: #f75c74;">상품가격<%=productCost %></h2> 
배송료: &nbsp; <%=deliveryfee %> <br><br>
<div style="background-color: #f2f2f2; height: 50px; line-height:50px;">
구매수량 &nbsp;
<button type ="button" onclick="fnCalCount('p',this);">+</button>
        <input type="text" name="pop_out" value="0" readonly="readonly" style="text-align:center;"/>
        <button type="button" onclick="fnCalCount('m', this);">-</button>
</div>
<br>
<h3 style="color: #f75c74; display: inline; text-align:left;">상품금액합계</h3>
<h3 style="color: #f75c74; display: inline; text-align: right;">총가격</h3><br>
<hr style="border-color: #ff8184;">
</form>
<input type="submit" value="장바구니" formation="cart.jsp" 
style="border-radius:0 0 0 0; background-color:white; border-color:#ffadaf; color: #f75c74; outline: 0; width:100px; height: 40px;">
<input type="submit" value="바로구매" formation="rightawaybuy.jsp" 
style="border-radius:0 0 0 0; background-color::#ffadaf; border-color: #ffadaf; color: white; box-shadow: 0; width:100px; height: 40px;">
</div> 





<!-- 하단바 include -->
</body>
</html>