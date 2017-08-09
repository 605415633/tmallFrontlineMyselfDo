package tmalls.util;

/**
 * DateUtil这个日期工具类主要是用于java.util.Date类与java.sql.Timestamp类相互转换。
 * 因为在实体类中日期类型的属性，使用的都是java.util.Date类。
 * 而为了在MySQL中的日期格式里保存时间信息， 必须使用datetime类型的字段，
 * 而jdbc要获取datetime类型字段的信息，需要采用java.sql.Timestamp来获取，
 * 否则只会保留日期信息。而丢失时间信息。
 *
 * @author home-pc
 * @create2017 -08 -03 -6:36
 */
public class DateUtil {

    public static java.sql.Timestamp d2t(java.util.Date d){
        if(d==null)
            return null;
        return new java.sql.Timestamp(d.getTime());
    }
    public static java.util.Date t2d(java.sql.Timestamp t){
        if(t==null)
            return null;
        return new java.util.Date(t.getTime());
    }


}
