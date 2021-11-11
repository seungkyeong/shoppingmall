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
	private Connection conn; //connection�� db�� �����ϰ� ���ִ� ��ü
	private ResultSet rs; //ResultSet�� �������� ������ ������ �������� Ŭ����
	private PreparedStatement pstmt;
	private DataSource ds;
	
	//mysql ó���κ�
	public ProductDAO() {		
		//������ �����
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
	
	//��ǰ ����
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
	
	//��ǰ ���� 
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
	
	//productID ��ǰ ��ȣ �������� �Լ�
	public int getProductId() {
		String SQL = "SELECT productId FROM PRODUCT ORDER BY productId DESC";
		try {
			conn = ds.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //ù ��° �Խù��� ���
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	//��ǰ �󼼺���, ��ǰ��ȣ�� �̿��Ͽ� ��ǰ�� �������� �Լ� 
		public Product getProductID(String productID){
			Product product = null;
			String sql = "select * from product where productID = ?"; //�ش� ��ǰ ã�� 
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
//			Context context = new InitialContext(); //JNDI�� ����ϱ� ���� 
//			ds = (DataSource)context.lookup("java:comp/env/jdbc/orcl"); //??
//		} catch (Exception e) {
//			System.out.println("connect err : " + e);
//		}
//	}
	
	//��ü ��ǰ ��� ���
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
		return list; //��ǰ ��� ��ȯ
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
