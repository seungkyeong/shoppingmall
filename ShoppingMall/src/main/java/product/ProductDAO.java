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
	
	//mysql ó���κ�
	public ProductDAO() {		
		//������ �����
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
	
	//��ǰ ����
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
	
	//��ǰ ����
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
	
	//productID ��ǰ ��ȣ �������� �Լ�
	public int getProductID() {
		String SQL = "SELECT productID FROM PRODUCTTBL ORDER BY productID DESC";
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //ù��° �Խù��� ���
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	//��ǰ �󼼺���, ��ǰ��ȣ�� �̿��Ͽ� ��ǰ�� �������� �Լ�
	public Product getProduct(String productID){
		Product product = null;
		String sql = "select * from producttbl where productID = ?"; //�ش� ��ǰ ã��
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

	
	//��ü ��ǰ ��� ���
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
		return list; //��ǰ ��� ��ȯ
	}
	
	//ī�װ� �������� 
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
		return list; //��ǰ ��� ��ȯ
	}
	
	//��ǰ ���
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
            // Connection, PreparedStatement�� �ݴ´�
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