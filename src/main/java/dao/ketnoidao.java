package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ketnoidao {
	public Connection cn;
	public void ketnoi() throws Exception{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url = "jdbc:sqlserver://LAPCN-I-HUYHV\\SQLEXPRESS:1433;databaseName=QLHvhShop;user=sa;password=1234";
		cn=DriverManager.getConnection(url);
	}
}
