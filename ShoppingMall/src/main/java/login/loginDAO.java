package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DatabaseUtil;

public class loginDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
//	private static LoginDAO instance;
//	private LoginDAO() {}
//	public static LoginDAO getInstance() {
//		if(instance == null) 
//			instance = new LoginDAO();
//		return instance;
//	}
	
	public int join(String userID,String userPassword) { //테스트해본거 회원가입
		 String SQL="INSERT INTO USER VALUES(?,?)"; 
		 try { 
			Connection conn =DatabaseUtil.getConnection(); 
			PreparedStatement pstmt=conn.prepareStatement(SQL); 
			
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword); 
			return pstmt.executeUpdate(); 
		 }catch (Exception e) { 
			 e.printStackTrace(); 
		 } return -1; 
	 }
	 
	//회원로그인 아이디,비밀번호 확인 메소드
	 public int login(String id,String password) {
		 String SQL="select password from membertbl where id=?"; 
		  try {
			  pstmt=conn.prepareStatement(SQL); 
			  pstmt.setString(1, id);
			  rs=pstmt.executeQuery(); 
			  if(rs.next()) { 
				  if(rs.getString(1).equals(password))
					  return 1; 
				  else return 0; 
			  }return -1; 
		  }catch(Exception e) {
			  e.printStackTrace(); 
		}return -2;
		 
//		 boolean flag = false; 
//		 
//		 String sql = "selct * from membertbl where id=? and password=?";
//		 
//		 conn=DatabaseUtil.getConnection();
//		 try {
//			 pstmt=conn.prepareStatement(sql);
//			 pstmt.setString(1, id);
//			 pstmt.setString(2, password);
//			 rs=pstmt.executeQuery();
//			 
//			 if(rs.next()) 
//				 flag=true;
//		 }catch(SQLException e) {
//			 e.printStackTrace();
//		 }finally {
//			 try {
//				 rs.close();
//				 pstmt.close();
//				 conn.close();
//			 }catch(SQLException e) {
//				 e.printStackTrace();
//			 }
//		 }
//		 return flag;
	
	 }
	
	//다른 로그인
	 public int logincheck(String id,String passwd) {
		 String dbPW="";
		 int x=-1;
		 
		 try {
			//쿼리 - 먼저 입력된 아이디로 DB 에서 비밀번호를 조회한다
			 StringBuffer query = new StringBuffer();
			 query.append("SELECT password from membertbl where id = ?");
			 
			 conn = DatabaseUtil.getConnection();
			 pstmt=conn.prepareStatement(query.toString());
			 pstmt.setString(1, id);
			 rs=pstmt.executeQuery();
			 
			 if(rs.next()) {
				 dbPW=rs.getString("password");
				 if(dbPW.equals(passwd))
					 x=1; //로그인성공
				 else x=0; //비밀번호틀림
			 }else {
				 x=-1; //아이디틀림
			 }return x; //오류
		 }catch(Exception sqle) {
			 throw new RuntimeException(sqle.getMessage());
		 }finally {
			 try {
				 if(pstmt != null) {pstmt.close(); pstmt=null;}
				 if(conn != null) {conn.close();conn=null;}
			 }catch(Exception e) {
				 throw new RuntimeException(e.getMessage());
			 }
		 }
	 }
	//로그인했을때 회원이름구하기
	public String getName(String id) {
		String name="";
		
//		String SQL="select * from user where id=?";
//		conn=DatabaseUtil.getConnection();
		
		try {
			 StringBuffer query = new StringBuffer();
			 query.append("select name from membertbl where id=?");
			 
			 conn = DatabaseUtil.getConnection();
			 pstmt=conn.prepareStatement(query.toString());
			 pstmt.setString(1, id);
			 rs=pstmt.executeQuery();
			 
			 name=rs.getString("name");
			 return name;
//			pstmt=conn.prepareStatement(SQL);
//			pstmt.setString(1,id);
//			rs=pstmt.executeQuery();
		}catch(Exception sqle) {
			 throw new RuntimeException(sqle.getMessage());
		 }finally {
			 try {
				 if(pstmt != null) {pstmt.close(); pstmt=null;}
				 if(conn != null) {conn.close();conn=null;}
			 }catch(Exception e) {
				 throw new RuntimeException(e.getMessage());
			 }
		 }
	}
	
	public String idSearch(String name, String email) {
		String id = "";
		try {
			 StringBuffer query = new StringBuffer();
			 query.append("select id from membertbl where name=? and email=?");
			 
			 conn = DatabaseUtil.getConnection();
			 pstmt=conn.prepareStatement(query.toString());
			 pstmt.setString(1, name);
			 pstmt.setString(2, email);
			 rs=pstmt.executeQuery();
			 if(rs.next()) {
				 id=rs.getString("id");
			 }
			 
			 return id;
		}catch(Exception sqle) {
			 throw new RuntimeException(sqle.getMessage());
		 }finally {
			 try {
				 if(pstmt != null) {pstmt.close(); pstmt=null;}
				 if(conn != null) {conn.close();conn=null;}
			 }catch(Exception e) {
				 throw new RuntimeException(e.getMessage());
			 }
		 }
	}
}