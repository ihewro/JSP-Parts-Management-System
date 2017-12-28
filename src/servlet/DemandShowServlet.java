package servlet;

import com.alibaba.fastjson.JSON;
import com.sun.rowset.CachedRowSetImpl;
import model.Demand;
import model.DemandsJson;
import util.DateUtil;
import util.DbConn;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 显示需求列表
 */

@WebServlet(name = "DemandShowServlet", urlPatterns = {"/servlet/showDemand"})
public class DemandShowServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        //连接数据库，查询需求列表

        Connection connection = DbConn.getConnection();
        try {
            PreparedStatement pStatement = connection.prepareStatement("select partId,partPrice,partNum,created from buy");
            ResultSet resultSet = pStatement.executeQuery();
            CachedRowSetImpl rowSet = null;
            rowSet = new CachedRowSetImpl();
            rowSet.populate(resultSet);
            //rowSet.last();

            DemandsJson demandsJson = new DemandsJson();
            List<Demand> demandList = new ArrayList<>();

            //写入数据
            while (rowSet.next()){
                Demand temp = new Demand();
                temp.setPartId(rowSet.getInt(1));
                temp.setPartPrice(rowSet.getDouble(2));
                temp.setPartNum(rowSet.getInt(3));
                temp.setCreated(DateUtil.SQLDatetimeToString(rowSet.getDate(4)));
                demandList.add(temp);
            }
            demandsJson.setDemandList(demandList);

            //关闭数据库连接
            resultSet.close();
            connection.close();

            String jsonString = JSON.toJSONString(demandsJson);
            OutputStream out = response.getOutputStream();
            out.write(jsonString.getBytes("UTF-8"));
            out.flush();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
