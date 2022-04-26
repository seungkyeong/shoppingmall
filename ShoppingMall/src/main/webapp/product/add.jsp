<%@page import="java.io.PrintWriter"%>
<%@page import="product.ProductDAO"%>
<%@page import="product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<%
   String id = request.getParameter("productid"); //앞에서 넘겨받은 상품게시글id
   String productcnt=request.getParameter("buyCount"); //앞에서 넘겨 받은 상품 구매할 개수
   ProductDAO dao=new ProductDAO(); 
   ArrayList<Product> prlist = dao.getProductAll(); //상품 정보를 받는 리스트 모든 상품들 담겨있음.
   Product product = new Product();
   for(int i=0;i<prlist.size();i++) {
      //상품 리스트 중에서 사용자가 장바구니에 담은 그 상품의 id가 일치하는 코드를 얻어서 Product에 대입
      product=prlist.get(i); 
      if(product.getProductID().equals(id)) {
         break;
      }
   }
   
   //장바구니에 담겨져있는 상품 목록을 가져와서 list 만들어줌
   ArrayList<Product> carlist = (ArrayList<Product>)session.getAttribute("carlist"); 
   if(carlist == null) {
      carlist=new ArrayList<>();
      session.setAttribute("carlist",carlist);
   }
   //사용자가 주문한 상품이 이미 장바구니에 담겨있으면 수량 하나 증가.
   int cnt=0;
   Product goodsCnt=new Product();
   for(int i=0;i<carlist.size();i++) {
      goodsCnt=carlist.get(i);
      if(goodsCnt.getProductID().equals(id)) {
         cnt++;
         int orderQuantity=goodsCnt.getQuantity() +1;
         goodsCnt.setQuantity(orderQuantity);
      }
   }
   
   if(cnt==0) {
   product.setQuantity(1);
   carlist.add(product);
   }
   /* response.sendRedirect("cart.jsp?id="+id); */

   PrintWriter script=response.getWriter();
   script.println("<script>");
   script.println("alert('장바구니에 추가되었습니다.')");
   script.println("location.href='cart.jsp'");
   script.println("</script>");
%>
</body>
</html>