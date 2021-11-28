package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import util.DatabaseUtil;

public class noticeBbsDAO {
		private PreparedStatement pstmt;
		private Connection conn; 
		private ResultSet rs; 
		
		//�Խñ� ����: �Խñ� ��ȣ�� �̿��Ͽ� �Խñ��� �����´�.
		public Bbs getBbs(int bbsID) throws SQLException {
			Connection conn = null;
	        PreparedStatement pstmt = null;
	        Bbs bbs = null;
			String sql = "select * from bbs where bbsID = ?"; //�ش� ��ǰ ã�� 
			try {
				conn =DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bbsID);
				rs = pstmt.executeQuery();
				if(rs.next()){
					bbs = new Bbs();
					bbs.setBbsID(rs.getInt("bbsID"));
					bbs.setBbsTitle(rs.getString("bbsTitle"));
					bbs.setUserID(rs.getString("userID"));
					bbs.setBbsDate(rs.getString("bbsDate"));
					bbs.setBbsContent(rs.getString("bbsContent"));
					bbs.setBbsAvailable(rs.getInt("bbsAvailable"));
					bbs.setFileName(rs.getString("fileName"));
					bbs.setFileRealName(rs.getString("fileRealName"));
				}
			}catch (SQLException sqle) {
				throw new RuntimeException(sqle.getMessage());
			}catch (Exception e) {
				System.out.println("getProduct err : ");
			}finally {
				try {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch (Exception e2) {
					System.out.println("err : " + e2);
				}
			}
			return bbs;
		}
		
		//���� �ð� ����
		public String getDatetime() throws SQLException{
			try {
				Date date = new Date();
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		        String time = sdf.format(date); 
				return time;
				}catch (Exception sqle) {
	            throw new RuntimeException(sqle.getMessage());
			}
			 //�����ͺ��̽� ����
		}
		
		//������ ���� �ۼ��ϴ� �Լ�
		public int write(String bbsTitle, String bbsContent, String fileName, String fileRealName) throws SQLException {
			Connection conn = null;
	        PreparedStatement pstmt = null;
			
			String SQL = "insert into noticeBbs(noticeBbsID, noticeBbsTitle, noticeBbsDate, noticeBbsContent, noticeBbsFileName, noticeBbsFileRealName, noticeBbsAvailable) VALUES(?, ?, ?, ?, ?, ?, ?)";
			try {
				conn =DatabaseUtil.getConnection();
				
				pstmt = conn.prepareStatement(SQL);
				
				pstmt.setString(1,  null); //null���� ���� �ڵ����� �ο�
				pstmt.setString(2, bbsTitle);
				pstmt.setString(3, getDatetime()); //�ۼ����ڸ� ����.
				pstmt.setString(4, bbsContent);
				pstmt.setString(5, fileName);
				pstmt.setString(6, fileRealName);
				pstmt.setInt(7, 1); //���� ��ȿ��ȣ: 1�� ���, �������� ���� �Խù��� �ǹ�.
				
				//���� ����
				return pstmt.executeUpdate(); 
			}catch (SQLException e) {
				throw new RuntimeException(e.getMessage());
			}catch (Exception e){
				System.out.println(e.getMessage());
			}finally {
	            try{
	                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
	                if ( conn != null ){ conn.close(); conn=null;    }
	            }catch(Exception e){
	                throw new RuntimeException(e.getMessage());
	            }
			}
			return -1; //�����ͺ��̽� ����
		}    
}
