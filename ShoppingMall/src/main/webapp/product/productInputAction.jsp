<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.Product" %>
<%@ page import="product.ProductDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File" %>
<%@ page import ="java.util.Enumeration" %>
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import ="com.oreilly.servlet.MultipartRequest" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="product" class="product.Product"/>
<jsp:setProperty name="product" property="*" />

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String directory = getServletContext().getRealPath("/productUpload/");
	String encoding = "utf-8"; //변환 형식
	int maxSize = 5*1024*1024; //사진의 size
	
	//파일 업로드를 직접적으로 담당
	MultipartRequest multi = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
	String fileName =  multi.getOriginalFileName("productImage"); //사용자가 저장한 파일 이름
	String fileRealName = multi.getFilesystemName("productImage"); //실제 서버에 저장되는 파일 이름
	
	String productID = multi.getParameter("productID"); //enctype 때문.
	String productName = multi.getParameter("productName");
	int productStock = Integer.parseInt(multi.getParameter("productStock"));
	int productPrice = Integer.parseInt(multi.getParameter("productPrice"));
	String productInfo = multi.getParameter("productInfo"); 
	
	product.setProductID(productID);
	product.setProductName(productName);
	product.setProductStock(productStock);
	product.setProductPrice(productPrice);
	product.setProductInfo(productInfo);
	product.setFileName(fileName);
	product.setFileRealName(fileRealName);
	
	ProductDAO ProductDAO = new ProductDAO();
	//상품등록
	int result = ProductDAO.insertProduct(product);
	
	if(result == -1){ //데이터베이스 오류가 발생한 경우 : -1
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('상품등록에 실패했습니다')");
		script.println("history.back()"); //이전 페이지로 돌아가기 
		script.println("</script>");
		script.close();
		return;
	} else { //정상적으로 등록된 경우 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('상품 등록에 성공했습니다')");
		script.println("location.href='productInput.jsp'"); //게시판 눌렀을 때(목록있는 곳)의 위치로 이동 
		script.println("</script>");
		script.close();
		}
%>

<jsp:useBean id="bbs" class="bbs.Bbs"/>
<jsp:setProperty name="bbs" property="*" />
</body>
</html>