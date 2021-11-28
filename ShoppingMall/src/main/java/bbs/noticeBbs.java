package bbs;

public class noticeBbs {
	private int noticeBbsID; //게시글 id
	private String noticeBbsTitle; //제목
	private String noticeBbsDate; //작성 날짜
	private String noticeBbsContent; //내용
	private int noticeBbsAvailable;
	private String noticeBbsFileName;
	private String noticeBbsFileRealName; //실제로 서버에 저장되는 이름
	
	public int getNoticeBbsID() {
		return noticeBbsID;
	}
	public void setNoticeBbsID(int noticeBbsID) {
		this.noticeBbsID = noticeBbsID;
	}
	public String getNoticeBbsTitle() {
		return noticeBbsTitle;
	}
	public void setNoticeBbsTitle(String noticeBbsTitle) {
		this.noticeBbsTitle = noticeBbsTitle;
	}
	public String getNoticeBbsDate() {
		return noticeBbsDate;
	}
	public void setNoticeBbsDate(String noticeBbsDate) {
		this.noticeBbsDate = noticeBbsDate;
	}
	public String getNoticeBbsContent() {
		return noticeBbsContent;
	}
	public void setNoticeBbsContent(String noticeBbsContent) {
		this.noticeBbsContent = noticeBbsContent;
	}
	public int getNoticeBbsAvailable() {
		return noticeBbsAvailable;
	}
	public void setNoticeBbsAvailable(int noticeBbsAvailable) {
		this.noticeBbsAvailable = noticeBbsAvailable;
	}
	public String getNoticeBbsFileName() {
		return noticeBbsFileName;
	}
	public void setNoticeBbsFileName(String noticeBbsFileName) {
		this.noticeBbsFileName = noticeBbsFileName;
	}
	public String getNoticeBbsFileRealName() {
		return noticeBbsFileRealName;
	}
	public void setNoticeBbsFileRealName(String noticeBbsFileRealName) {
		this.noticeBbsFileRealName = noticeBbsFileRealName;
	}
	
	
}
