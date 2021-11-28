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
		
		//현재 시간 생성
		public String getDatetime() throws SQLException{
			try {
				Date date = new Date();
		        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		        String time = sdf.format(date); 
				return time;
				}catch (Exception sqle) {
	            throw new RuntimeException(sqle.getMessage());
			}
			 //데이터베이스 오류
		}
		
		//실제로 글을 작성하는 함수
		public int write(String bbsTitle, String bbsContent, String fileName, String fileRealName) throws SQLException {
			Connection conn = null;
	        PreparedStatement pstmt = null;
			
			String SQL = "insert into noticeBbs(noticeBbsID, noticeBbsTitle, noticeBbsDate, noticeBbsContent, noticeBbsFileName, noticeBbsFileRealName, noticeBbsAvailable) VALUES(?, ?, ?, ?, ?, ?, ?)";
			try {
				conn =DatabaseUtil.getConnection();
				
				pstmt = conn.prepareStatement(SQL);
				
				pstmt.setString(1,  null); //null값을 보내 자동으로 부여
				pstmt.setString(2, bbsTitle);
				pstmt.setString(3, getDatetime()); //작성일자를 넣음.
				pstmt.setString(4, bbsContent);
				pstmt.setString(5, fileName);
				pstmt.setString(6, fileRealName);
				pstmt.setInt(7, 1); //글의 유효번호: 1인 경우, 삭제되지 않은 게시물을 의미.
				
				//쿼리 실행
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
			return -1; //데이터베이스 오류
		}    
}
