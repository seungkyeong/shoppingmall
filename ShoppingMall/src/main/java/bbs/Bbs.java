package bbs;

public class Bbs {
	//한명의 회원정보를 담는 userBbs 클래스.
	private int bbsID; //게시글 id
	private String bbsTitle; //제목
	private String userID; //아이디
	private String bbsDate; //작성 날짜
	private String bbsContent; //내용
	private String bbsImageFile;
	private int bbsAvailable;
	
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
	public String getBbsImageFile() {
		return bbsImageFile;
	}
	public void setBbsImageFile(String bbsImageFile) {
		this.bbsImageFile = bbsImageFile;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	} 

}
