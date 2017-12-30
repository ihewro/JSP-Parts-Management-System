package servlet;

import com.sun.rowset.CachedRowSetImpl;
import util.DbConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "ConfirmTransactionsServlet", urlPatterns = {"/servlet/confirmTransaction"})
public class ConfirmTransactionsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int flag = 0;//0代表用户修改，1代表供应商修改
        int transactionId = -1;//交易ID

        if (request.getParameter("flag") !=null){
            flag = Integer.parseInt(request.getParameter("flag"));
        }
        if (request.getParameter("transactionId") !=null){
            transactionId = Integer.parseInt(request.getParameter("transactionId"));
        }


        try {
            Connection connection = DbConn.getConnection();
            PreparedStatement pStatement = null;
            //更新数据库信息
            if (flag == 0){
                pStatement = connection.prepareStatement("update transaction set customerStatus = ? where id=?");
            }else {
                pStatement = connection.prepareStatement("update transaction set supplierStatus = ? where id=?");
            }
            pStatement.setInt(1,1);
            pStatement.setInt(2,transactionId);

            pStatement.executeUpdate();

            //检查另一方是否同意，如果两方同时同意的话，将需求标记为求购成功
            if (flag == 0){//检查供应商状态
                pStatement = connection.prepareStatement("select supplierStatus,buyId from transaction WHERE id=?");
            }else{
                pStatement = connection.prepareStatement("select customerStatus,buyId from transaction WHERE id=?");
            }
            pStatement.setInt(1,transactionId);

            ResultSet resultSet = pStatement.executeQuery();
            CachedRowSetImpl rowSet = null;
            rowSet = new CachedRowSetImpl();
            rowSet.populate(resultSet);
            rowSet.last();

            if (rowSet.getInt(1) == 1){//代表双方都已经同意了
                pStatement = connection.prepareStatement("update buy set status = ? where id=?");
                pStatement.setInt(1,1);//设置需求buy表中的状态为1，代表求购成功
                pStatement.setInt(2,rowSet.getInt(2));
                pStatement.executeUpdate();
            }

            pStatement.close();
            connection.close();
        } catch (Exception e) {

        }

        if (flag == 0){
            response.sendRedirect("../customer/list_transaction.jsp");
        }else {
            response.sendRedirect("../supplier/list_transaction.jsp");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
