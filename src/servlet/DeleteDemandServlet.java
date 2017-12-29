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

@WebServlet(name = "DeleteDemandServlet",urlPatterns = {"/servlet/deleteDemand"})
public class DeleteDemandServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type","text/html;charset=UTF-8");

        int mainId = Integer.parseInt(request.getParameter("id"));

        //连接数据库，并向数据库中修改数据


        try {
            Connection connection = DbConn.getConnection();
            //更新数据库信息
            PreparedStatement pStatement = connection.prepareStatement("delete from buy where id=?");
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

        response.sendRedirect("../customer/list_demand.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*
          用来测试返回json格式数据
         */
        response.setContentType("application/json; charset=utf-8");
        response.setCharacterEncoding("UTF-8");

        String userJson = "get请求成功";
        OutputStream out = response.getOutputStream();
        out.write(userJson.getBytes("UTF-8"));
        out.flush();
    }
}
