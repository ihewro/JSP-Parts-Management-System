package servlet;

import com.alibaba.fastjson.JSON;
import com.sun.rowset.CachedRowSetImpl;
import model.Demand;
import model.DemandsJson;
import model.Part;
import model.PartJson;
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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ShowPartsServlet", urlPatterns = {"/servlet/showParts"})
public class ShowPartsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("content-type","text/html;charset=UTF-8");


        //连接数据库，查询需求列表

        Connection connection = DbConn.getConnection();
        try {
            PreparedStatement pStatement = connection.prepareStatement("select id,color,name,weight,introduction from parts");
            ResultSet resultSet = pStatement.executeQuery();
            CachedRowSetImpl rowSet = null;
            rowSet = new CachedRowSetImpl();
            rowSet.populate(resultSet);
            //rowSet.last();

            PartJson partJson = new PartJson();
            List<Part> partList = new ArrayList<>();

            //写入数据
            while (rowSet.next()){
                Part temp = new Part();
                temp.setPartId(rowSet.getInt(1));
                temp.setColor(rowSet.getString(2));
                temp.setName(rowSet.getString(3));
                temp.setWeight(rowSet.getDouble(4));
                temp.setText(rowSet.getString(5));
                partList.add(temp);
            }
            partJson.setPartList(partList);
            partJson.setStatus(1);

            //关闭数据库连接
            resultSet.close();
            connection.close();

            String jsonString = JSON.toJSONString(partJson);
            OutputStream out = response.getOutputStream();
            out.write(jsonString.getBytes("UTF-8"));
            out.flush();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
