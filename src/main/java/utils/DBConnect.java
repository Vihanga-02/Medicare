package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	

	private static String url = "jdbc:mysql://localhost:3306/medicare";
	private static String user = "root";
	private static String password = "1234@";
	
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);
			
		}
		catch(Exception e){
			System.out.println("Database Not Connect !");
			e.printStackTrace(); // helps debug the issue
			
		}
		return con;
	}

}
