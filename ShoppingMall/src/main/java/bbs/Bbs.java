package bbs;

public class Bbs {
	//�Ѹ��� ȸ�������� ��� userBbs Ŭ����.
	private int bbsID; //�Խñ� id
	private String bbsTitle; //����
	private String userID; //���̵�
	private String bbsDate; //�ۼ� ��¥
	private String bbsContent; //����
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
