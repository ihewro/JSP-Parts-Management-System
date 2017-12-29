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

@WebServlet(name = "ModifyDemandServlet",urlPatterns = {"/servlet/modifyDemand"})
public class ModifyDemandServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type","text/html;charset=UTF-8");

        int partId = Integer.parseInt(request.getParameter("partId"));
        //int customerId = Integer.parseInt(request.getParameter("customerId"));
        double partPrice = Double.parseDouble(request.getParameter("partPrice"));
        int partNum = Integer.parseInt(request.getParameter("partNum"));
        //String dateString = request.getParameter("created");
        int mainId = Integer.parseInt(request.getParameter("mainId"));


        //连接数据库，并向数据库中修改数据

        try {
            Connection connection = DbConn.getConnection();
            //更新数据库信息
            PreparedStatement pStatement = connection.prepareStatement("update buy set partId=? ,partPrice = ? ,partNum = ? where id=?");
            //pStatement.setInt(1, customerId);
            pStatement.setInt(1, partId);
            pStatement.setDouble(2, partPrice);
            pStatement.setInt(3, partNum);
            //pStatement.setDate(5, DateUtil.stringToDate(dateString));
            pStatement.setInt(4, mainId);

            pStatement.executeUpdate();

            pStatement.close();
            connection.close();
        } catch (Exception e) {

        }

        response.sendRedirect("../customer/list_demand.jsp");


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
