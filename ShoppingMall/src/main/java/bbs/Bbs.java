//���� �Խ��� �Խñ� DTO
package bbs;

public class Bbs {
	//�Ѹ��� ȸ�������� ��� userBbs Ŭ����.
	private int bbsID; //�Խñ� id
	private String bbsTitle; //����
	private String userID; //���̵�
	private String bbsDate; //�ۼ� ��¥
	private String bbsContent; //����
	private int bbsAvailable;
	String fileName;
	String fileRealName; //������ ������ ����Ǵ� �̸�
	
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
	
	//������, �ʱ�ȭ
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
