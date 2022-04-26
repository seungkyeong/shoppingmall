<%@page import="product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.list a, a:hover{
color: #000000;
text-decoration: none;
}
.list {
text-align: center;
display: inline-block;
padding: 30px;
}
td{
width:150px;
}
.list-line{
padding-left:40px;
}
#wrap{
padding-left: 20px;
}
.list-line:nth-child(1){
margin: 5px;
}
.list-line:nth-child(n+1){
padding-left: 600px;
}
</style>
<body id="wrap">
<%@ include file="../main/top.jsp" %>
<div>
	<%
		int categoryID = 0; //임의 설정, 원래는 0 
		if(request.getParameter("categoryID") != null){
			categoryID = Integer.parseInt(request.getParameter("categoryID"));
		}
	
		ProductDAO DAO = new ProductDAO();
		ArrayList<Product> list=DAO.getCategory(categoryID);
		
		int i=0;
		for(Product p:list){
	%>
	<% if(i==0){%>
	<div class="list-line">
	<%}%>
	<table class="list">
	<tr><td><a href="productDetailForm.jsp?productID=<%=p.getProductID() %>"><img src="../productUpload/<%=p.getFileRealName() %>" style="border:solid 2px;" width="120px" height="160px"></a></td></tr>
	<tr><td align="center"><%=p.getProductName() %></td></tr>
	<tr><td align="center"><%=p.getProductPrice() %>원</td></tr>
	</table>
	<% 
	   if(i==3){%>
			</div><br>
			<% i = 0;
	   }
	   else{
		   i++;
	   }
	} %>
</div>
</body>
</html>