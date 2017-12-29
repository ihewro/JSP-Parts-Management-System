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

@WebServlet(name = "AddSupplyServlet",urlPatterns = {"/servlet/addSupply"})
public class AddSupplyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type", "text/html;charset=UTF-8");

        int partId = Integer.parseInt(request.getParameter("partId"));
        int supplierId = Integer.parseInt(request.getParameter("supplierId"));
        double partPrice = Double.parseDouble(request.getParameter("partPrice"));
        int partNum = Integer.parseInt(request.getParameter("partNum"));
        String dateString = request.getParameter("created");


        //连接数据库，并向数据库中插入数据

        try {
            Connection connection = DbConn.getConnection();
            //文章id已经设置为自增，所以在这里就不用管了
            PreparedStatement pStatement = connection.prepareStatement("insert into supply(supplierId,partId,partPrice,partNum,created) values(?,?,?,?,?)");
            pStatement.setInt(1, supplierId);
            pStatement.setInt(2, partId);
            pStatement.setDouble(3, partPrice);
            pStatement.setInt(4, partNum);
            pStatement.setDate(5, DateUtil.stringToDate(dateString));

            pStatement.executeUpdate();

            pStatement.close();
            connection.close();
        } catch (Exception e) {

        }
        response.sendRedirect("../supplier/list_supply.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
