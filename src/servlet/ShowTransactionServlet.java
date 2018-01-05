package servlet;

import com.alibaba.fastjson.JSON;
import com.sun.rowset.CachedRowSetImpl;
import model.Part;
import model.PartJson;
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

@WebServlet(name = "ShowTransactionServlet", urlPatterns = {"/servlet/showTransaction"})
public class ShowTransactionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type","text/html;charset=UTF-8");

        int userId = -1;
        if (request.getParameter("userId") !=null){
            userId = Integer.parseInt(request.getParameter("userId"));
        }

        int supplierId = -1;
        if (request.getParameter("supplierId") != null){
            supplierId = Integer.parseInt(request.getParameter("supplierId"));
        }
        String userLimit = "";
        String supplierLimit = "";


        //连接数据库，查询需求列表

        Connection connection = DbConn.getConnection();

        try {
            PreparedStatement pStatement = null;
            if (userId != -1){
                userLimit = " and buy.customId="+userId;
            }
            if(supplierId != -1){
                supplierLimit = " and supplier.id=" + supplierId;
            }
            pStatement = connection.prepareStatement("SELECT suggestion,transaction.id,customerStatus,supplierStatus,buyId,customer.id,customer.name,supplier.id,supplier.name, parts.id,transaction.partNum,transaction.partPrice,parts.name from transaction,buy,supply,customer,supplier,parts WHERE supplyId = supply.id and buyId = buy.id AND customer.id = buy.customId and supplier.id = supply.supplierId and parts.id = supply.partId" + userLimit + supplierLimit);
            ResultSet resultSet = pStatement.executeQuery();
            CachedRowSetImpl rowSet = null;
            rowSet = new CachedRowSetImpl();
            rowSet.populate(resultSet);

            TransactionJson transactionJson = new TransactionJson();
            List<Transaction> transactionList = new ArrayList<>();

            //写入数据
            while (rowSet.next()){
                Transaction temp = new Transaction();
                temp.setSuggestion(rowSet.getString(1));
                temp.setTransactionId(rowSet.getInt(2));
                temp.setCustomerStatus(rowSet.getInt(3));
                temp.setSupplierStatus(rowSet.getInt(4));
                temp.setBuyId(rowSet.getInt(5));
                temp.setCustomerId(rowSet.getInt(6));
                temp.setCustomerName(rowSet.getString(7));
                temp.setSupplierId(rowSet.getInt(8));
                temp.setSupplierName(rowSet.getString(9));
                temp.setPartId(rowSet.getInt(10));
                temp.setPartNum(rowSet.getInt(11));
                temp.setPartPrice(rowSet.getDouble(12));
                temp.setPartName(rowSet.getString(13));

                transactionList.add(temp);
            }
            transactionJson.setTransactionList(transactionList);
            transactionJson.setStatus(1);
            transactionJson.setUserId(userId);

            //关闭数据库连接
            resultSet.close();
            connection.close();

            String jsonString = JSON.toJSONString(transactionJson);
            OutputStream out = response.getOutputStream();
            out.write(jsonString.getBytes("UTF-8"));
            out.flush();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
