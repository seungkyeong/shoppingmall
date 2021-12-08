//문의 게시판 DAO
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

import Member.MemberDAO;
import product.Product;
import util.DatabaseUtil;

public class BbsDAO {
	//dao: database access object
	private PreparedStatement pstmt;
	private Connection conn; //connection은 db에 접근하게 해주는 객체
	private ResultSet rs; //ResultSet는 쿼리문을 실행한 정보를 가져오는 클래스
	
	//mysql 처리부분
	//private static BbsDAO instance;
	    
	// 싱글톤 패턴
	//public BbsDAO(){}
//	public static BbsDAO getInstance(){
//	    if(instance==null) {
//	    	instance=new BbsDAO();
//	    }
//	    return instance;
//	}
	
	//현재 시간을 가져오는 함수 - 작성 일자
//	public String getDatetime() throws SQLException{
//		//String SQL = "select NOW()";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(SQL); //sql실행 준비단계
//			rs = pstmt.executeQuery(); //sql 실행 결과 
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
//		return ""; //데이터베이스 오류
//	}
	
	//게시글 보기: 게시글 번호를 이용하여 게시글을 가져온다.
	public Bbs getBbs(int bbsID) throws SQLException {
		Connection conn = null;
        PreparedStatement pstmt = null;
        Bbs bbs = null;
		String sql = "select * from bbs where bbsID = ?"; //해당 상품 찾기 
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
		 //데이터베이스 오류
	}
	
	public Timestamp localDateTimeToTimeStamp(LocalDateTime ldt) {
		return Timestamp.valueOf(ldt);
	}
	
	public LocalDateTime timeStampToLocalDateTime(Timestamp ts) {
		return ts.toLocalDateTime();
	}
	
	
	//bbsID 게시글 번호 가져오는 함수 - 새로운 게시글 번호 부여 -->이거 -1만 들어가서 아예 null값 보내고 데이터베이스에서 자동으로 번호 부여시키도록 함..
//	public int getNext() throws SQLException{
//		String sql = "SELECT bbsID FROM bbs ORDER BY bbsID DESC";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				return rs.getInt(1) + 1;
//			}
//			return 1; //첫 번째 게시물인 경우
//		}catch (SQLException sqle) {
//			throw new RuntimeException(sqle.getMessage());
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -1; //데이터베이스 오류
//	}
	
	//실제로 글을 작성하는 함수
	public int write(String bbsTitle, String userID, String bbsContent, String fileName, String fileRealName) throws SQLException {
		Connection conn = null;
        PreparedStatement pstmt = null;
		
		String SQL = "insert into bbs(bbsID, bbsTitle, userID, bbsDate, bbsContent, fileName, fileRealName, bbsAvailable) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			conn =DatabaseUtil.getConnection();
			
			pstmt = conn.prepareStatement(SQL);
			
			//pstmt.setInt(1, getNext());
			pstmt.setString(1,  null); //null값을 보내 자동으로 부여
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			//pstmt.setString(4, getDatetime());
			pstmt.setString(4, getDatetime()); //작성일자를 넣음.
			pstmt.setString(5, bbsContent);
			pstmt.setString(6, fileName);
			pstmt.setString(7, fileRealName);
			pstmt.setInt(8, 1); //글의 유효번호: 1인 경우, 삭제되지 않은 게시물을 의미.
			
			//쿼리 실행
			return pstmt.executeUpdate(); 
		}catch (SQLException e) {
			// 오류시 롤백
	        //conn.rollback(); 
			throw new RuntimeException(e.getMessage());
		}catch (Exception e){
			System.out.println(e.getMessage());
		}finally {
            // Connection, PreparedStatement를 닫는다.
            try{
                if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
		}
		return -1; //데이터베이스 오류
	}    
} 

