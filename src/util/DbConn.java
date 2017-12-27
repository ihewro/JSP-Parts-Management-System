package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConn {


	public static Connection getConnection(){
		try {
			//加载驱动
			String driver = "com.mysql.jdbc.Driver";
			Class.forName(driver);
			//连接数据库
			String url = "jdbc:mysql://localhost/management";
			String user = "hewro";
			String passwd = "ihewro19980801";
			Connection conn = DriverManager.getConnection(url, user, passwd);
            System.out.println("连接数据库成功");
            return conn;
		} catch (Exception e) {
			System.err.println("连接数据库失败");
			e.printStackTrace();
		}
		return null;
	}
}
