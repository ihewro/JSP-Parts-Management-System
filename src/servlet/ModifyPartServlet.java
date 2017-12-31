package servlet;

import util.DbConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "ModifyPartServlet",urlPatterns = {"/servlet/modifyPart"})
public class ModifyPartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type","text/html;charset=UTF-8");

        int partId = Integer.parseInt(request.getParameter("partId"));
        String partName = request.getParameter("partName");
        String partColor = request.getParameter("partColor");
        Double partWeight = Double.valueOf(request.getParameter("partWeight"));
        String partIntroduction = request.getParameter("partIntroduction");


        //连接数据库，并向数据库中修改数据

        try {
            Connection connection = DbConn.getConnection();
            //更新数据库信息
            PreparedStatement pStatement = connection.prepareStatement("update parts set name = ? ,color = ?,weight =?,introduction=? where id=?");

            pStatement.setString(1,partName);
            pStatement.setString(2,partColor);
            pStatement.setDouble(3,partWeight);
            pStatement.setString(4,partIntroduction);
            pStatement.setInt(5,partId);

            pStatement.executeUpdate();

            pStatement.close();
            connection.close();
        } catch (Exception e) {

        }

        response.sendRedirect("../maintainer/list_part.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
