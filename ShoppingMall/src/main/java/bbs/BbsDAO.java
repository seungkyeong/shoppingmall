//���� �Խ��� DAO
package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

import jsp.member.model.MemberDAO;
import util.DatabaseUtil;

public class BbsDAO {
	//dao: database access object
	private PreparedStatement pstmt;
	private Connection conn; //connection�� db�� �����ϰ� ���ִ� ��ü
	private ResultSet rs; //ResultSet�� �������� ������ ������ �������� Ŭ����
	
	//mysql ó���κ�
	//private static BbsDAO instance;
	    
	// �̱��� ����
	//public BbsDAO(){}
//	public static BbsDAO getInstance(){
//	    if(instance==null) {
//	    	instance=new BbsDAO();
//	    }
//	    return instance;
//	}
	
	//���� �ð��� �������� �Լ� - �ۼ� ����
//	public String getDatetime() throws SQLException{
//		//String SQL = "select NOW()";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(SQL); //sql���� �غ�ܰ�
//			rs = pstmt.executeQuery(); //sql ���� ��� 
//			if(rs.next()) {
//				//String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date(request.getParameter("date")));
//				//Timestamp ts = localDateTimeToTimeStamp(LocalDateTime.now());
//				//LocalDateTime ldt = timeStampToLocalDateTime(ts);
//				//return ts;
//				
//				Date date = new Date();
//		        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
//		        String time = sdf.format(date);
//				
//				//return rs.getString(1);
//				return time;
//			}
//		}catch (Exception sqle) {
//            throw new RuntimeException(sqle.getMessage());
//		}
//		return ""; //�����ͺ��̽� ����
//	}
	
	public String getDatetime() throws SQLException{
		//String SQL = "select NOW()";
		try {
			Date date = new Date();
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	        String time = sdf.format(date); 
	        //java.sql.Date sqlDate = new java.sql.Date(time.getTime());
			return time;
			}catch (Exception sqle) {
            throw new RuntimeException(sqle.getMessage());
		}
		 //�����ͺ��̽� ����
	}
	
	public Timestamp localDateTimeToTimeStamp(LocalDateTime ldt) {
		return Timestamp.valueOf(ldt);
	}
	
	public LocalDateTime timeStampToLocalDateTime(Timestamp ts) {
		return ts.toLocalDateTime();
	}
	
	
	//bbsID �Խñ� ��ȣ �������� �Լ� - ���ο� �Խñ� ��ȣ �ο� -->�̰� -1�� ���� �ƿ� null�� ������ �����ͺ��̽����� �ڵ����� ��ȣ �ο���Ű���� ��..
//	public int getNext() throws SQLException{
//		String sql = "SELECT bbsID FROM bbs ORDER BY bbsID DESC";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				return rs.getInt(1) + 1;
//			}
//			return 1; //ù ��° �Խù��� ���
//		}catch (SQLException sqle) {
//			throw new RuntimeException(sqle.getMessage());
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -1; //�����ͺ��̽� ����
//	}
	
	//������ ���� �ۼ��ϴ� �Լ�
	public int write(String bbsTitle, String userID, String bbsContent, String imageFile) throws SQLException {
		Connection conn = null;
        PreparedStatement pstmt = null;
		
		String SQL = "insert into bbs(bbsID, bbsTitle, userID, bbsDate, bbsContent, bbsAvailable, bbsImage) VALUES(?, ?, ?, ?, ?, ?, ?)";
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
			pstmt.setInt(6, 1); //���� ��ȿ��ȣ: 1�� ���, �������� ���� �Խù��� �ǹ�.
			pstmt.setString(7, imageFile);
			
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

