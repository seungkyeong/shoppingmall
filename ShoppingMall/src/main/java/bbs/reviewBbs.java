package bbs;

public class reviewBbs {
	private int bbsID; //게시글 id
	private String bbsTitle; //제목
	private String userID; //아이디
	private String bbsDate; //작성 날짜
	private String bbsContent; //내용
	private int bbsAvailable;
	private String fileName; //이미지 
	private String fileRealName; //이미지, 실제로 서버에 저장되는 이름
	private String fileName2; //동영상 
	private String fileRealName2; //동영상, 실제로 서버에 저장되는 이름
	
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
	public String getFileName2() {
		return fileName2;
	}
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
	public String getFileRealName2() {
		return fileRealName2;
	}
	public void setFileRealName2(String fileRealName2) {
		this.fileRealName2 = fileRealName2;
	}
}
