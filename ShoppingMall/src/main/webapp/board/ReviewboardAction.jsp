<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="bbs.reviewBbs" %>
<%@ page import="bbs.reviewBbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.io.File" %>
<%@page import="java.util.Enumeration" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String directory = application.getRealPath("/ReviewUpload/");
	String encoding="utf-8";
	int maxSize=10*1024*1024;
	//int maxSize2=1024*1024*1024;
	
	//파일 업로드를 직접적으로 담당, 이미지 파일
	MultipartRequest multi=new MultipartRequest(request,directory,maxSize,encoding,new DefaultFileRenamePolicy());
	//MultipartRequest multi2 = new MultipartRequest(request,director//y,maxSize2,encoding2,new DefaultFileRenamePolicy());
	//Enumeration<String> names = multi.getFileNames();
	//while(names.hasMoreElements()){
	//	String name = names.nextElement();
	//}
	
	String fileName=multi.getOriginalFileName("bbsImageFile");
	String fileRealName=multi.getFilesystemName("bbsImageFile");
	
	String bbsTitle=multi.getParameter("bbsTitle");//enctype때문에
	String bbsContent=multi.getParameter("bbsContent");
	
	
	String fileName2 = multi.getOriginalFileName("bbsImageVideoFile");
	String fileRealName2 = multi.getFilesystemName("bbsImageVideoFile");
%>

<jsp:useBean id="bbs" class="bbs.reviewBbs"/>
<jsp:setProperty property="*" name="bbs"/>
<%
	bbs.setBbsTitle(bbsTitle);
	bbs.setBbsContent(bbsContent);
	bbs.setFileName(fileName);
	bbs.setFileRealName(fileRealName);
	bbs.setFileName2(fileName2);
	bbs.setFileRealName2(fileRealName2);
	
	String userID = null;
	if(session.getAttribute("sessionID") != null) { //유저아이디이름으로 세션이 존재하는 회원들은 
		userID = (String)session.getAttribute("sessionID"); //유저아이디에 해당 세션값을 넣어준다.
	}
	
	//if(userID == null) { //로그인이 안된 경우
	//	PrintWriter script = response.getWriter();
	//	script.println("<script>");
	//	script.println("alert('로그인을 하세요.')"); //'로그인 하세요.' 경고창 띄우기
	//	script.println("location.href='../login/LoginForm.jsp'"); //로그인 화면으로 이동, 로그인jsp
	//	script.println("</script>");
	//	script.close();
	//}else { //로그인한 경우 
		
		if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null) { //게시글의 제목 or 내용 입력하지 않은 경우 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다')");
			script.println("history.back()"); //이전 페이지(글쓰기 폼)로 돌아가기 
			script.println("</script>");
			script.close();
			return;
		}
		else 
		{ //게시글을 바르게 입력한 경우 
			reviewBbsDAO BbsDAO = new reviewBbsDAO();
			//데이터베이스에 게시글 쓰는 BbsDAO의 write 사용.
			int result = BbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent(), bbs.getFileName(),bbs.getFileRealName(), bbs.getFileName2(),bbs.getFileRealName2());
			if(result == -1){ //데이터베이스 오류가 발생한 경우 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				//script.println("alert('글쓰기에 실패했습니다')");
				//script.println("history.back()"); //이전 페이지(글쓰기 폼)로 돌아가기 
				script.println("</script>");
				script.close();
				return;
			} else { //정상적으로 게시글이 등록된 경우 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 성공했습니다')");
				script.println("location.href='QnAboardList.jsp'"); //게시판 눌렀을 때(목록있는 곳)의 위치로 이동 
				//script.println("history.back()"); //이전 페이지(글쓰기 폼)로 돌아가기 
				script.println("</script>");
				script.close();
			}
		}
	//}
%>
</body>
</html>