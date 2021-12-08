package product;

//import product.Product;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//import javax.naming.Context;
//import javax.naming.InitialContext;
import javax.sql.DataSource;

import util.DatabaseUtil;

import java.sql.DriverManager;

public class ProductDAO {
	private Connection conn; 
	private ResultSet rs; 
	private PreparedStatement pstmt;
	//private DataSource ds;
	
	//mysql 처리부분
	public ProductDAO() {		
		//생성자 만들기
		try {
			String dbURL ="jdbc:mysql://3.38.96.95:3306/shopping?serverTimezone=UTC";
			String dbID="userid";
			String dbPassword="ghkdma2020";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(rs != null) {
				rs.close();
			}
			if(stmt != null) {
				stmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}catch (Exception e) {
			System.out.println("error : " + e.getMessage());
		}
	}
	
	//상품 갱신
	public int updateProduct(Product p) {
		int re = -1;
		
		String sql = "update producttbl set productID=?, productName=?, productStock=?, productPrice=?, fileName=?, fileRealName=?, productInfo=?";
		
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getProductID());
			pstmt.setString(2, p.getProductName());
			pstmt.setInt(3, p.getProductStock());
			pstmt.setInt(4, p.getProductPrice());
			pstmt.setString(5, p.getFileName());
			pstmt.setString(6, p.getFileRealName());
			pstmt.setString(7, p.getProductInfo());
			
			re = pstmt.executeUpdate();
			close(conn, pstmt, null);
		}catch (Exception e) {
			System.out.println("error : " + e.getMessage());
		}
		return re;
	}
	
	//상품 삭제
	public int deleteProduct(String productID) {
		int re = -1;
		
		String sql = "delete producttbl where productID=?";
		
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productID);
			
			re = pstmt.executeUpdate();
			close(conn, pstmt, null);
		}catch (Exception e) {
			System.out.println("error : " + e.getMessage());
		}
		return re;
	}
	
	//productID 상품 번호 가져오는 함수
	public int getProductID() {
		String SQL = "SELECT productID FROM PRODUCTTBL ORDER BY productID DESC";
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫번째 게시물인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	//상품 상세보기, 상품번호를 이용하여 상품으 가져오는 함수
	public Product getProduct(String productID){
		Product product = null;
		String sql = "select * from producttbl where productID = ?"; //해당 상품 찾기
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				product = new Product();
				product.setProductID(rs.getString("productID"));
				product.setProductName(rs.getString("productName"));
				product.setProductStock(rs.getInt("productStock"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setFileName(rs.getString("fileName"));
				product.setFileRealName(rs.getString("fileRealName"));
				product.setProductInfo(rs.getString("productInfo"));
			}
		} catch (Exception e) {
			System.out.println("getProduct err : ");
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				System.out.println("err : " + e2);
			}
		}
		return product;
	}

	
	//전체 상품 목록 출력
	public ArrayList<Product> getProductAll(){
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			String sql = "select * from producttbl";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Product product = new Product();
				product.setProductID(rs.getString("productID"));
				product.setProductName(rs.getString("productName"));
				product.setProductStock(rs.getInt("productStock"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setFileName(rs.getString("fileName"));
				product.setFileRealName(rs.getString("fileRealName"));
				product.setProductInfo(rs.getString("productInfo"));
				list.add(product);
			}
		} catch (Exception e) {
			System.out.println("getProductAll err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				System.out.println("err : " + e2);
			}
		}
		return list; //상품 목록 반환
	}
	
	//카테고리 가져오기 
	public ArrayList<Product> getCategory(int categoryID){
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			String sql = "select * from producttbl where categoryID= ?";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, categoryID);
			rs = pstmt.executeQuery();
				
			while(rs.next()){
				Product product = new Product();
				product.setProductID(rs.getString("productID"));
				product.setProductName(rs.getString("productName"));
				product.setProductStock(rs.getInt("productStock"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setFileName(rs.getString("fileName"));
				product.setFileRealName(rs.getString("fileRealName"));
				product.setProductInfo(rs.getString("productInfo"));
				list.add(product);
			}
		} catch (Exception e) {
			System.out.println("getProductAll err : " + e);
		} finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				System.out.println("err : " + e2);
			}
		}
		return list; //상품 목록 반환
	}
	
	//상품 등록
	public int insertProduct(Product p) throws SQLException {
		Connection conn = null;
        PreparedStatement pstmt = null;
		int re = -1;
		try {
			String sql = "insert into producttbl(productID, productName, productStock, productPrice, fileName, fileRealName, productInfo) values(?, ?, ?, ?, ?, ?, ?)";
			conn =DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, p.getProductID());
			pstmt.setString(2, p.getProductName());
			pstmt.setInt(3, p.getProductStock());
			pstmt.setInt(4, p.getProductPrice());
			pstmt.setString(5, p.getFileName());
			pstmt.setString(6, p.getFileRealName());
			pstmt.setString(7, p.getProductInfo());
			//rs = pstmt.executeQuery();
			
			return pstmt.executeUpdate();
		}catch (SQLException sqle) {
			throw new RuntimeException(sqle.getMessage());
		}catch (Exception e) {
			System.out.println("err : " + e.getMessage());
		}finally {
            // Connection, PreparedStatement를 닫는다
            try{
            	//close(conn, pstmt, null);
            	if ( pstmt != null ){ pstmt.close(); pstmt=null; }
                if ( conn != null ){ conn.close(); conn=null;    }
            }catch(Exception e){
                throw new RuntimeException(e.getMessage());
            }
		}
		return re;
	}
}