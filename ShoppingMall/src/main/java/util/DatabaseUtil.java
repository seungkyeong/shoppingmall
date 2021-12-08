package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {

	public static Connection getConnection() {
		try {
			String dbURL ="jdbc:mysql://3.38.96.95:3306/shopping?serverTimezone=UTC";
			String dbID="userid";
			String dbPassword="ghkdma2020";
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}return null;
	}
}