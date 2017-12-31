package servlet;

import util.DbConn;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet(name = "ModifyUserInfoServlet",urlPatterns = {"/servlet/modifyUser"})
public class ModifyUserInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type","text/html;charset=UTF-8");

        String modifyText = request.getParameter("modifyText");
        int flag = Integer.parseInt(request.getParameter("flag"));
        String type = request.getParameter("type");
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Connection connection = DbConn.getConnection();
            PreparedStatement pStatement;
            //更新数据库信息
            if (flag == 0){
                //修改用户名
                pStatement = connection.prepareStatement("update "+ type +" set name = ? where id=?");
            }else {
                //修改密码
                pStatement = connection.prepareStatement("update " + type +" set password = ? where id=?");
            }
            pStatement.setString(1,modifyText);
            pStatement.setInt(2,id);



            pStatement.executeUpdate();

            pStatement.close();
            connection.close();
        } catch (Exception e) {

        }

        HttpSession session = request.getSession(true);
        session.removeAttribute("login");


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
