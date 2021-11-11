package product;

//import product.Product;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

//import javax.naming.Context;
//import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.DriverManager;

public class ProductDAO {
	private Connection conn; //connection은 db에 접근하게 해주는 객체
	private ResultSet rs; //ResultSet는 쿼리문을 실행한 정보를 가져오는 클래스
	private PreparedStatement pstmt;
	private DataSource ds;
	
	//mysql 처리부분
	public ProductDAO() {		
		//생성자 만들기
		try {
			String dbURL = "jdbc:mysql://localhost:3306/product?serverTimezone=UTC";
			
			String dbID="root";
			String dbPassword = "dmd950112";
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
		
		String sql = "update product set productID=?, productName=?, stock=?, price=?, imageSrc=?, productInfo=?";
		
		try {
			conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getProductID());
			pstmt.setString(2, p.getProductName());
			pstmt.setInt(3, p.getProductStock());
			pstmt.setInt(4, p.getProductPrice());
			pstmt.setString(5, p.getProductImage());
			pstmt.setString(6, p.getProductInfo());
			
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
		
		String sql = "delete product where productID=?";
		
		try {
			conn = ds.getConnection();
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
	public int getProductId() {
		String SQL = "SELECT productId FROM PRODUCT ORDER BY productId DESC";
		try {
			conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫 번째 게시물인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	//상품 상세보기, 상품번호를 이용하여 상품을 가져오는 함수 
		public Product getProductID(String productID){
			Product product = null;
			String sql = "select * from product where productID = ?"; //해당 상품 찾기 
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, productID);
				rs = pstmt.executeQuery();
				if(rs.next()){
					product = new Product();
					product.setProductID(rs.getString("productID"));
					product.setProductName(rs.getString("productName"));
					product.setProductPrice(rs.getInt("productPrice"));
					product.setProductInfo(rs.getString("productInfo"));
					product.setProductStock(rs.getInt("productStock"));
					product.setProductImage(rs.getString("productImage"));
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
	
	
//	public ProductManager() {
//		try {
//			Context context = new InitialContext(); //JNDI를 사용하기 위해 
//			ds = (DataSource)context.lookup("java:comp/env/jdbc/orcl"); //??
//		} catch (Exception e) {
//			System.out.println("connect err : " + e);
//		}
//	}
	
	//전체 상품 목록 출력
	public ArrayList<Product> getProductAll(){
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			String sql = "select * from product";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Product product = new Product();
				product.setProductID(rs.getString("productID"));
				product.setProductName(rs.getString("productName"));
				product.setProductInfo(rs.getString("productInfo"));
				product.setProductPrice(rs.getInt("productPrice"));
				product.setProductImage(rs.getString("productImage"));
				product.setProductStock(rs.getInt("productStock"));
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
	
	public int insertProduct(Product p) {
		int re = -1;
		try {
			String sql = "insert into product(productID, productName, stock, price, imageSrc, productInfo) values(?, ?, ?, ?, ?, ?)";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, p.getProductID());
			pstmt.setString(2, p.getProductName());
			pstmt.setInt(3, p.getProductStock());
			pstmt.setInt(4, p.getProductPrice());
			pstmt.setString(5, p.getProductImage());
			pstmt.setString(6, p.getProductInfo());
			rs = pstmt.executeQuery();
			close(conn, pstmt, null);
		}catch (Exception e) {
			System.out.println("err : " + e.getMessage());
		}
		return re;
	}
}
