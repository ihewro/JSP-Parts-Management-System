package servlet;

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

@WebServlet(name = "DeleteSupplyServlet" , urlPatterns = {"/servlet/deleteSupply"})
public class DeleteSupplyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type","text/html;charset=UTF-8");

        int mainId = Integer.parseInt(request.getParameter("id"));

        //连接数据库，并向数据库中修改数据


        try {
            Connection connection = DbConn.getConnection();
            //更新数据库信息
            PreparedStatement pStatement = connection.prepareStatement("delete from supply where id=?");
            pStatement.setInt(1, mainId);

            pStatement.executeUpdate();

            pStatement.close();
            connection.close();
        } catch (Exception e) {

            String userJson = String.valueOf(e);
            OutputStream out = response.getOutputStream();
            out.write(userJson.getBytes("UTF-8"));
            out.flush();

        }

        response.sendRedirect("../supplier/list_supply.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
