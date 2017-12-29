package util;

import com.sun.tools.javac.util.Convert;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    private static SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );


    /**
     *
     * @param strDate 如：2008-07-10 19:20:00
     * @return
     */
    public static java.sql.Date stringToDate(String strDate){
        String str = strDate;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.util.Date d = null;
        try {
            d = format.parse(str);
        } catch (Exception e) {
            e.printStackTrace();
        }
        java.sql.Date date = new java.sql.Date(d.getTime());
        return date;

    }


    public static String SQLDatetimeToString(java.sql.Date SQLDatetime){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(SQLDatetime);
        return dateString;
    }

}
