package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    private static SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );


    /**
     *
     * @param dateString 如：2008-07-10 19:20:00
     * @return
     */
    public static Date stringToDate(String dateString){
        Date date = null;
        try {
            date = sdf.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }


    public static String SQLDatetimeToString(java.sql.Date SQLDatetime){
        return "2003";
    }

}
