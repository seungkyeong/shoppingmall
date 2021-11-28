<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.noticeBbs" %>
<%@ page import="bbs.noticeBbsDAO"%>
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
<!-- 공지사항을 등록, 데베에 저장해주는 페이지 -->

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String directory = application.getRealPath("/NoticeUpload/");
	String encoding = "utf-8"; //변환 형식
	int maxSize = 5*1024*1024; //사진의 size
	
	//파일 업로드를 직접적으로 담당
	MultipartRequest multi = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
	String fileName =  multi.getOriginalFileName("noticeBbsImageFile");
	String fileRealName = multi.getFilesystemName("noticeBbsImageFile");
	
	String bbsTitle = multi.getParameter("noticeBbsTitle"); //enctype 때문.
	String bbsContent = multi.getParameter("noticeBbsContent");

%>

<jsp:useBean id="noticeBbs" class="bbs.noticeBbs"/>
<jsp:setProperty name="noticeBbs" property="*" />

<%
	noticeBbs.setNoticeBbsTitle(bbsTitle);
	noticeBbs.setNoticeBbsContent(bbsContent);
	noticeBbs.setNoticeBbsFileName(fileName);
	noticeBbs.setNoticeBbsFileRealName(fileRealName);

			
	if(noticeBbs.getNoticeBbsTitle() == null || noticeBbs.getNoticeBbsContent() == null) { //게시글의 제목 or 내용 입력하지 않은 경우 
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
		noticeBbsDAO BbsDAO = new noticeBbsDAO();
		//데이터베이스에 게시글 쓰는 BbsDAO의 write 사용.
		int result = BbsDAO.write(noticeBbs.getNoticeBbsTitle(), noticeBbs.getNoticeBbsContent(), noticeBbs.getNoticeBbsFileName(), noticeBbs.getNoticeBbsFileRealName());
			
		if(result == -1){ //데이터베이스 오류가 발생한 경우 : -1
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다')");
			script.println("history.back()"); //이전 페이지(글쓰기 폼)로 돌아가기 
			script.println("</script>");
			script.close();
			return;
		} else { //정상적으로 게시글이 등록된 경우 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글쓰기에 성공했습니다')");
			script.println("location.href='Noticeboard.jsp'"); //글쓰기 폼으로 이동
			script.println("</script>");
			script.close();
			}	
	}
%>
</body>
</html>