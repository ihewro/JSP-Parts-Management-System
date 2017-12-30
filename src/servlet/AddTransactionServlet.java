package servlet;

import util.DateUtil;
import util.DbConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "AddTransactionServlet",urlPatterns = {"/servlet/addTransaction"})
public class AddTransactionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type", "text/html;charset=UTF-8");

        int supplyId = Integer.parseInt(request.getParameter("supplyId"));
        int buyId = Integer.parseInt(request.getParameter("buyId"));
        Double partPrice = Double.parseDouble(request.getParameter("partPrice"));
        int partNum = Integer.parseInt(request.getParameter("partNum"));
        String suggestion = request.getParameter("suggestion");


        //连接数据库，并向数据库中插入数据

        try {
            Connection connection = DbConn.getConnection();
            //文章id已经设置为自增，所以在这里就不用管了
            PreparedStatement pStatement = connection.prepareStatement("insert into transaction(supplyId,buyId,partPrice,partNum,suggestion,customerStatus,supplierStatus) values(?,?,?,?,?,?,?)");
            //pStatement.setInt(1, customerId);
            //pStatement.setInt(2, supplierId);
            pStatement.setInt(1, supplyId);
            pStatement.setInt(2, buyId);
            pStatement.setDouble(3, partPrice);
            pStatement.setInt(4, partNum);
            pStatement.setString(5, suggestion);

            //-1待确认，0拒绝，1，同意
            pStatement.setInt(6,-1);
            pStatement.setInt(7,-1);

            pStatement.executeUpdate();

            //把用户的需求buy表中的status改为-1

            pStatement = connection.prepareStatement("update buy set status = ? where id=?");
            pStatement.setInt(1,-1);
            pStatement.setInt(2,buyId);
            pStatement.executeUpdate();


            pStatement.close();
            connection.close();


        } catch (Exception e) {

        }
        response.sendRedirect("../trader/list_transaction.jsp");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
