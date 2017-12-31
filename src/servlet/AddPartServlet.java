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

@WebServlet(name = "AddPartServlet",urlPatterns = {"/servlet/addPart"})
public class AddPartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type", "text/html;charset=UTF-8");

        String name = request.getParameter("name");
        String color = request.getParameter("color");
        Double weight = Double.valueOf(request.getParameter("weight"));
        String introduction = request.getParameter("introduction");


        //连接数据库，并向数据库中插入数据

        try {
            Connection connection = DbConn.getConnection();
            //文章id已经设置为自增，所以在这里就不用管了
            PreparedStatement pStatement = connection.prepareStatement("insert into parts(name,color,weight,introduction) values(?,?,?,?)");
            pStatement.setString(1, name);
            pStatement.setString(2, color);
            pStatement.setDouble(3, weight);
            pStatement.setString(4, introduction);


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
