//문의 게시판 게시글 DTO
package bbs;

public class Bbs {
	//한명의 회원정보를 담는 userBbs 클래스.
	private int bbsID; //게시글 id
	private String bbsTitle; //제목
	private String userID; //아이디
	private String bbsDate; //작성 날짜
	private String bbsContent; //내용
	private int bbsAvailable;
	String fileName;
	String fileRealName; //실제로 서버에 저장되는 이름
	
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	
	//생성자, 초기화
//	public Bbs(int bbsID, String bbsTitle, String userID, String bbsDate, String bbsContent, int bbsAvailable,
//			String fileName, String fileRealName) {
//		super();
//		this.bbsID = bbsID;
//		this.bbsTitle = bbsTitle;
//		this.userID = userID;
//		this.bbsDate = bbsDate;
//		this.bbsContent = bbsContent;
//		this.bbsAvailable = bbsAvailable;
//		this.fileName = fileName;
//		this.fileRealName = fileRealName;
//} 
}
