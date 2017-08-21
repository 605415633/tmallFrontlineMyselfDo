package tmalls.dao;

import tmalls.bean.Product;
import tmalls.bean.Property;
import tmalls.bean.PropertyValue;
import tmalls.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 基本的CRUD。还提供了支持业务的方法。
 *
 * @author home-pc
 * @create2017 -08 -04 -9:02
 */
public class PropertyValueDAO {


    public int getTotal(){
        int total=0;
        try(Connection connection= DBUtil.getConnection(); Statement statement=connection.createStatement()){
            String sql="select count(*) from propertyValue";
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                total=resultSet.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return total;
    }

    public void add(PropertyValue bean){
        String sql="insert into propertyValue values(null,?,?,?)";
        try(Connection connection=DBUtil.getConnection(); PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,bean.getProduct().getId());
            preparedStatement.setInt(2,bean.getProperty().getId());
            preparedStatement.setString(3,bean.getValue());
            preparedStatement.execute();
            ResultSet resultSet=preparedStatement.getGeneratedKeys();
            if(resultSet.next()){
                int id=resultSet.getInt(1);
                bean.setId(id);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void delete(int id){
        try(Connection connection=DBUtil.getConnection();Statement statement=connection.createStatement()){
            String sql="delete from propertyValue where id="+id;
            statement.execute(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public void update(PropertyValue bean){
        String sql="update propertyValue set pid=? ,ptid=? ,value=?, where id=?";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,bean.getProduct().getId());
            preparedStatement.setInt(2,bean.getProperty().getId());
            preparedStatement.setString(3,bean.getValue());
            preparedStatement.setInt(4,bean.getId());
            preparedStatement.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public PropertyValue get(int id){
        PropertyValue bean=new PropertyValue();
        try(Connection connection=DBUtil.getConnection();Statement statement=connection.createStatement()){
            String sql="select * from propertyValue where id ="+id;
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                int pid=resultSet.getInt("pid");
                int ptid=resultSet.getInt("ptid");
                String value=resultSet.getString("value");
                bean.setId(id);
                Product product=new ProductDAO().get(pid);
                bean.setProduct(product);
                Property property=new PropertyDAO().get(ptid);
                bean.setProperty(property);
                bean.setValue(value);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }

    public PropertyValue get(int ptid,int pid){
        PropertyValue bean=null;
        try(Connection connection=DBUtil.getConnection();Statement statement=connection.createStatement()){
            String sql = "select * from PropertyValue where ptid = " + ptid + " and pid = " + pid;
            ResultSet resultSet=statement.executeQuery(sql);
            if(resultSet.next()){
                bean=new PropertyValue();
                int id=resultSet.getInt("id");
                String value=resultSet.getString("value");
                Product product=new ProductDAO().get(pid);
                Property property=new PropertyDAO().get(ptid);
                bean.setId(id);
                bean.setValue(value);

                bean.setProduct(product);

                bean.setProperty(property);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }

    public List<PropertyValue> list(int start,int count){
        List<PropertyValue> beans=null;
        String sql="select * from propertyValue order by id desc limit ?,?";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,start);
            preparedStatement.setInt(2,count);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                PropertyValue bean=new PropertyValue();
                int id=resultSet.getInt(1);
                int pid=resultSet.getInt("pid");
                int ptid=resultSet.getInt("ptid");
                String value=resultSet.getString("value");
                bean.setId(id);
                bean.setValue(value);
                Property property=new PropertyDAO().get(ptid);
                bean.setProperty(property);
                Product product=new ProductDAO().get(pid);
                bean.setProduct(product);
                beans.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }

    public List<PropertyValue> list(){
        return list(0,Short.MAX_VALUE);
    }

    /**
     * 初始化某个产品对应的属性值
     * @param p
     */
    public void init(Product p){
        List<Property> pts=new PropertyDAO().list(p.getCategory().getId());//通过产品种类id获取其所有的属性。

        for(Property pt:pts){//遍历每一种属性。
            PropertyValue propertyValue=get(pt.getId(),p.getId());//通过属性的id和产品id获取属性值。
            if(propertyValue==null){
                propertyValue=new PropertyValue();//如果属性值为空，则创建新的属性值对象。
                propertyValue.setProduct(p);//给属性值赋予其所属的产品
                propertyValue.setProperty(pt);//给属性值赋予其所属的属性。
                this.add(propertyValue);//给该属性添加该属性值。
            }
        }
    }

    /**
     * 查询某个产品下的所有属性
     * @param pid
     * @return
     */
    public List<PropertyValue> list(int pid){
        List<PropertyValue> beans=new ArrayList<>();
        String sql="select from propertyValue where pid = ? order by ptid desc";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
           preparedStatement.setInt(1,pid);
           ResultSet resultSet=preparedStatement.executeQuery();
           while (resultSet.next()){
               PropertyValue bean=new PropertyValue();
               int id=resultSet.getInt(1);
               int ptid=resultSet.getInt("ptid");
               String value=resultSet.getString("value");
               Product product=new ProductDAO().get(pid);
               Property property=new PropertyDAO().get(ptid);
               bean.setId(id);
               bean.setValue(value);
               bean.setProperty(property);
               bean.setProduct(product);
               beans.add(bean);

           }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }


}
