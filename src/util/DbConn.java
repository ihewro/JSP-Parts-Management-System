package util;

import com.alibaba.fastjson.JSON;
import com.sun.rowset.CachedRowSetImpl;
import model.Demand;
import model.DemandsJson;
import model.Part;
import model.PartJson;

import javax.sql.RowSet;
import java.io.OutputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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

	/**
	 * 查询demand表内的数据
	 * @return
	 */
	public static ResultSet selectDemandTable(){

		Connection connection = DbConn.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement("select partId,partPrice,partNum,created from buy");
			ResultSet resultSet = pStatement.executeQuery();
			CachedRowSetImpl rowSet = null;
			rowSet = new CachedRowSetImpl();
			rowSet.populate(resultSet);


			//关闭数据库连接
			resultSet.close();
			connection.close();

			return  rowSet;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return  null;
	}

	/**
	 * 查询part
	 * @return
	 */
	public static ResultSet selectPartTable(){

		//连接数据库，查询需求列表
		Connection connection = DbConn.getConnection();
		try {
			PreparedStatement pStatement = connection.prepareStatement("select id,color,name,weight,introduction from parts");
			ResultSet resultSet = pStatement.executeQuery();
			CachedRowSetImpl rowSet = null;
			rowSet = new CachedRowSetImpl();
			rowSet.populate(resultSet);

			//关闭数据库连接
			resultSet.close();
			connection.close();

			return rowSet;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}







}
