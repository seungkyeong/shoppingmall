<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!-- 파일 기능 사용을 위해 import -->
<%@ page import="java.io.File" %>
<%@ page import ="java.util.Enumeration" %>
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import ="com.oreilly.servlet.MultipartRequest" %>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용, scope:페이지 현재의 페이지에서만 사용-->

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 글을 작성해주는 액션 페이지 -->

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String directory = application.getRealPath("/QnAUpload/");
	String encoding = "utf-8"; //변환 형식
	int maxSize = 5*1024*1024; //사진의 size
	
	//파일 업로드를 직접적으로 담당
	MultipartRequest multi = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
	String fileName =  multi.getOriginalFileName("bbsImageFile");
	String fileRealName = multi.getFilesystemName("bbsImageFile");
	
	String bbsTitle = multi.getParameter("bbsTitle"); //enctype 때문.
	String bbsContent = multi.getParameter("bbsContent");

%>

<jsp:useBean id="bbs" class="bbs.Bbs"/>
<jsp:setProperty name="bbs" property="*" />

<%
	bbs.setBbsTitle(bbsTitle);
	bbs.setBbsContent(bbsContent);
	bbs.setFileName(fileName);
	bbs.setFileRealName(fileRealName);

	//BbsDAO dao = //BbsDAO.getInstance();
	
	String userID = null;

	if(session.getAttribute("userID") != null) { //유저아이디이름으로 세션이 존재하는 회원들은 
		userID = (String)session.getAttribute("userID"); //유저아이디에 해당 세션값을 넣어준다.
	}
	
	//if(userID == null) { //로그인이 안된 경우
		//PrintWriter script = response.getWriter();
		//script.println("<script>");
		//script.println("alert('로그인을 하세요.')"); //'로그인 하세요.' 경고창 띄우기
		//script.println("location.href='../login/LoginForm.jsp'"); //로그인 화면으로 이동, 로그인jsp
		//script.println("</script>");
		//script.close();
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
			BbsDAO BbsDAO = new BbsDAO();
			//데이터베이스에 게시글 쓰는 BbsDAO의 write 사용.
			int result = BbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent(), bbs.getFileName(), bbs.getFileRealName());
			
			if(result == -1){ //데이터베이스 오류가 발생한 경우 : -1
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다')");
				//script.println("history.back()"); //이전 페이지(글쓰기 폼)로 돌아가기 
				script.println("</script>");
				script.close();
				return;
			} else { //정상적으로 게시글이 등록된 경우 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 성공했습니다')");
				//script.println("location.href='QnAboard.jsp'"); //게시판 눌렀을 때(목록있는 곳)의 위치로 이동 
				script.println("history.back()"); //이전 페이지(글쓰기 폼)로 돌아가기-> 이전의 기록이 남아있음(게시글 등록하던 것.) 
				script.println("</script>");
				script.close();
				}	
		}
	//}
%>
</body>
</html>