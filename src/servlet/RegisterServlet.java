package servlet;

import com.alibaba.fastjson.JSON;
import util.DateUtil;
import util.DbConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;

@WebServlet(name = "RegisterServlet",urlPatterns = {"/servlet/register"})
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type", "text/html;charset=UTF-8");


        System.out.println("处理登录post请求……");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        Date date = DateUtil.stringToDate(request.getParameter("created"));


        /*
          处理登录验证逻辑
         */

        String userJson;
        if (checkIsRepeated(username,type)){//注册成功
            //向数据库插入信息
            //连接数据库，并向数据库中插入数据

            try {
                Connection connection = DbConn.getConnection();
                //文章id已经设置为自增，所以在这里就不用管了
                PreparedStatement pStatement = connection.prepareStatement("insert into "+ type +"(name,password,created) values(?,?,?)");
                pStatement.setString(1, username);
                pStatement.setString(2, password);
                pStatement.setDate(3,date);

                pStatement.executeUpdate();

                pStatement.close();
                connection.close();

                userJson = "{\"status\":1}\n";//注册成功
            } catch (Exception e) {
                userJson = "{\"status\":0}\n";//注册失败
            }

        }else{//注册失败
            userJson = "{\"status\":0}\n";//注册失败
        }

        OutputStream out = response.getOutputStream();
        out.write(userJson.getBytes("UTF-8"));
        out.flush();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type", "text/html;charset=UTF-8");
        String userJson = "{\"status\":0}\n";//测试
        OutputStream out = response.getOutputStream();
        out.write(userJson.getBytes("UTF-8"));
        out.flush();

    }

    private boolean checkIsRepeated(String userName,String type){
        Connection connection = DbConn.getConnection();
        try {

            assert connection != null;
            String queryString = "select id from " + type+ " where name = ? ";
            PreparedStatement pStatement = connection.prepareStatement(queryString);
            pStatement.setString(1,userName);
            ResultSet resultSet = pStatement.executeQuery();

            if (resultSet.next()){//匹配成功，注册失败
                resultSet.close();
                connection.close();
                return false;
            }else{//注册成功
                resultSet.close();
                connection.close();
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
