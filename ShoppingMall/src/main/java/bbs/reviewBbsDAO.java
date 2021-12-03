package bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

import util.DatabaseUtil;

public class reviewBbsDAO {
		private PreparedStatement pstmt;
		private Connection conn; //connection�� db�� �����ϰ� ���ִ� ��ü
		private ResultSet rs; //ResultSet�� �������� ������ ������ �������� Ŭ����
		
		//�Խñ� ����: �Խñ� ��ȣ�� �̿��Ͽ� �Խñ��� �����´�.
		public reviewBbs getBbs(int bbsID) throws SQLException {
			Connection conn = null;
	        PreparedStatement pstmt = null;
	        reviewBbs bbs = null;
			String sql = "select * from bbs where bbsID = ?"; 
			try {
				conn =DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bbsID);
				rs = pstmt.executeQuery();
				if(rs.next()){
					bbs = new reviewBbs();
					bbs.setBbsID(rs.getInt("bbsID"));
					bbs.setBbsTitle(rs.getString("bbsTitle"));
					bbs.setUserID(rs.getString("userID"));
					bbs.setBbsDate(rs.getString("bbsDate"));
					bbs.setBbsContent(rs.getString("bbsContent"));
					bbs.setBbsAvailable(rs.getInt("bbsAvailable"));
					bbs.setFileName(rs.getString("fileName"));
					bbs.setFileRealName(rs.getString("fileRealName"));
					bbs.setFileName2(rs.getString("fileName2"));
					bbs.setFileRealName2(rs.getString("fileRealName2"));
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
		public int write(String bbsTitle, String userID, String bbsContent, String fileName, String fileRealName, String fileName2, String fileRealName2) throws SQLException {
			Connection conn = null;
	        PreparedStatement pstmt = null;
			
			String SQL = "insert into bbs(bbsID, bbsTitle, userID, bbsDate, bbsContent, fileName, fileRealName, fileName2, fileRealName2, bbsAvailable) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			try {
				conn =DatabaseUtil.getConnection();
				
				pstmt = conn.prepareStatement(SQL);
				
				//pstmt.setInt(1, getNext());
				pstmt.setString(1,  null); //null���� ���� �ڵ����� �ο�
				pstmt.setString(2, bbsTitle);
				pstmt.setString(3, userID);
				//pstmt.setString(4, getDatetime());
				pstmt.setString(4, getDatetime()); //�ۼ����ڸ� ����.
				pstmt.setString(5, bbsContent);
				pstmt.setString(6, fileName);
				pstmt.setString(7, fileRealName);
				pstmt.setString(8, fileName2);
				pstmt.setString(9, fileRealName2);
				pstmt.setInt(10, 1); //���� ��ȿ��ȣ: 1�� ���, �������� ���� �Խù��� �ǹ�.
				
				//���� ����
				return pstmt.executeUpdate(); 
			}catch (SQLException e) {
				// ������ �ѹ�
		        //conn.rollback(); 
				throw new RuntimeException(e.getMessage());
			}catch (Exception e){
				System.out.println(e.getMessage());
			}finally {
	            // Connection, PreparedStatement�� �ݴ´�.
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
