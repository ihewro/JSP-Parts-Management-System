package servlet;

import util.DateUtil;
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

@WebServlet(name = "AddDemandServlet", urlPatterns = {"/servlet/addDemand"})
public class AddDemandServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type", "text/html;charset=UTF-8");

        int partId = Integer.parseInt(request.getParameter("partId"));
        int customerId = Integer.parseInt(request.getParameter("customerId"));
        double partPrice = Double.parseDouble(request.getParameter("partPrice"));
        int partNum = Integer.parseInt(request.getParameter("partNum"));
        String dateString = request.getParameter("created");


        //连接数据库，并向数据库中插入数据

        try {
            Connection connection = DbConn.getConnection();
            //文章id已经设置为自增，所以在这里就不用管了
            PreparedStatement pStatement = connection.prepareStatement("insert into buy(customId,partId,partPrice,partNum,created) values(?,?,?,?,?)");
            pStatement.setInt(1, customerId);
            pStatement.setInt(2, partId);
            pStatement.setDouble(3, partPrice);
            pStatement.setInt(4, partNum);
            pStatement.setDate(5, DateUtil.stringToDate(dateString));

            pStatement.executeUpdate();

            pStatement.close();
            connection.close();
        } catch (Exception e) {

        }
        response.sendRedirect("../customer/list_demand.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          /*
          用来测试返回json格式数据
         */
        response.setContentType("application/json; charset=utf-8");
        response.setCharacterEncoding("UTF-8");

        String userJson = "{\"id\":0,\"name\":\"admin\",\"users\":[{\"id\":2,\"name\":\"guest\"},{\"id2\":3,\"name\":\"root\"}]}\n";
        OutputStream out = response.getOutputStream();
        out.write(userJson.getBytes("UTF-8"));
        out.flush();
    }
}
