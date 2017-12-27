package servlet;

import com.alibaba.fastjson.JSON;
import model.Login;

import util.DbConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * 登录处理
 */
@WebServlet(name = "LoginServlet" ,urlPatterns = {"/servlet/login"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("处理登录post请求……");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String type = request.getParameter("type");


        /**
         * 处理登录验证逻辑
         */
        Login login = new Login();
        login.setName(username);
        if (checkIsLoginSuccess(username,password,type)){//登录成功
            login.setStatus(1);
        }else{//登录失败
            login.setStatus(0);
        }
        String jsonString = JSON.toJSONString(login);

        OutputStream out = response.getOutputStream();
        out.write(jsonString.getBytes("UTF-8"));
        out.flush();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        /*
          用来测试返回json格式数据
         */
        response.setContentType("application/json; charset=utf-8");
        response.setCharacterEncoding("UTF-8");

        String userJson = "{\"id\":0,\"name\":\"admin\",\"users\":[{\"id\":2,\"name\":\"guest\"},{\"id\":3,\"name\":\"root\"}]}\n";
        OutputStream out = response.getOutputStream();
        out.write(userJson.getBytes("UTF-8"));
        out.flush();
    }

    /**
     * 校验当前登录是否成功
     * @return
     */
    private boolean checkIsLoginSuccess(String userName,String password, String type){
        System.out.println("当前用户输入信息为：" + userName  + "&" + password + "&" + type);
        Connection connection = DbConn.getConnection();
        try {

            assert connection != null;
            PreparedStatement pStatement = connection.prepareStatement("select name from customer where name = ? and password = ?");
            pStatement.setString(1,userName);
            pStatement.setString(2,password);
            ResultSet resultSet = pStatement.executeQuery();

            if (resultSet.next()){//匹配成功，找到数据
                return true;
            }else{//登录失败
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
