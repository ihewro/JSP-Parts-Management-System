package servlet;

import com.alibaba.fastjson.JSON;
import com.sun.rowset.CachedRowSetImpl;
import model.Table;
import model.Transaction;
import model.TransactionJson;
import util.DbConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ShowTableStatisticsServlet",urlPatterns = {"/servlet/showTable"})
public class ShowTableStatisticsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type","text/html;charset=UTF-8");

        //连接数据库，查询需求列表

        Connection connection = DbConn.getConnection();

        try {
            PreparedStatement pStatement = null;
            Table table = new Table();
            CachedRowSetImpl rowSet = null;
            ResultSet resultSet = null;

            pStatement = connection.prepareStatement("SELECT COUNT(id) from buy");
            resultSet = pStatement.executeQuery();
            rowSet = new CachedRowSetImpl();
            rowSet.populate(resultSet);
            rowSet.last();

            table.setBuyNum(rowSet.getInt(1));

            pStatement = connection.prepareStatement("SELECT COUNT(id) from customer");
            resultSet = pStatement.executeQuery();
            rowSet = new CachedRowSetImpl();
            rowSet.populate(resultSet);
            rowSet.last();
            table.setCustomerNum(rowSet.getInt(1));


            pStatement = connection.prepareStatement("SELECT COUNT(id) from supplier");
            resultSet = pStatement.executeQuery();
            rowSet = new CachedRowSetImpl();
            rowSet.populate(resultSet);
            rowSet.last();
            table.setSupplierNum(rowSet.getInt(1));


            pStatement = connection.prepareStatement("SELECT COUNT(id) from supply");
            resultSet = pStatement.executeQuery();
            rowSet = new CachedRowSetImpl();
            rowSet.populate(resultSet);
            rowSet.last();
            table.setSupplyNum(rowSet.getInt(1));


            pStatement = connection.prepareStatement("SELECT COUNT(id) from trader");
            resultSet = pStatement.executeQuery();
            rowSet = new CachedRowSetImpl();
            rowSet.populate(resultSet);
            rowSet.last();
            table.setTraderNum(rowSet.getInt(1));

            pStatement = connection.prepareStatement("SELECT COUNT(id) from transaction");
            resultSet = pStatement.executeQuery();
            rowSet = new CachedRowSetImpl();
            rowSet.populate(resultSet);
            rowSet.last();
            table.setTransactionNum(rowSet.getInt(1));

            //关闭数据库连接
            resultSet.close();
            connection.close();

            String jsonString = JSON.toJSONString(table);
            OutputStream out = response.getOutputStream();
            out.write(jsonString.getBytes("UTF-8"));
            out.flush();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
