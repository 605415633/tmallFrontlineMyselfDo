package tmalls.dao;

import tmalls.bean.Category;
import tmalls.bean.Property;
import tmalls.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 除了基本的CRUD外，还提供了一些支持业务的方法。
 *
 * @author home-pc
 * @create2017 -08 -03 -10:59
 */
public class PropertyDAO {

    /**
     * 获取某种产品类别下的属性总数，在分页时还会用到。
     * @param cid
     * @return
     */
    public int getTotal(int cid){
        int total=0;
        try(Connection connection= DBUtil.getConnection(); Statement statement=connection.createStatement()){
            String sql="select count(*) from property where cid ="+cid;
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                total=resultSet.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return total;
    }

    public void add(Property bean){
        String sql="insert into property values(null,?,?)";
        try(Connection connection=DBUtil.getConnection(); PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,bean.getCategory().getId());//属性一定是属于某个产品种类的，
            preparedStatement.setString(2,bean.getName());
            preparedStatement.execute();
            ResultSet resultSet=preparedStatement.getGeneratedKeys();
            if (resultSet.next()){
                int id=resultSet.getInt(1);
                bean.setId(id);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void update(Property bean){
        String sql="update Property set cid= ? ,name=? where id=? ";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,bean.getCategory().getId());
            preparedStatement.setString(2,bean.getName());
            preparedStatement.setInt(3,bean.getId());
            preparedStatement.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void delete(int id){
        try(Connection connection=DBUtil.getConnection(); Statement statement=connection.createStatement()){
            String sql="delete from property where id="+id;
            statement.execute(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public Property get(String name,int cid){
        Property bean=null;
        String sql="select * from property where name=? and cid=?";
        try(Connection connection=DBUtil.getConnection(); PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setString(1,name);
            preparedStatement.setInt(2,cid);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next()){
                bean=new Property();
                int id=resultSet.getInt("id");
                bean.setId(id);
                bean.setName(name);
                Category category=new CategoryDAO().get(cid);//因为属性有3个字段。其中一个是属于
                // 某个产品种类下的属性，所以必须通过产品的cid（产品种类id）获取一个产品种类.
                bean.setCategory(category);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }
    public Property get(int id){
        Property bean=null;
        try(Connection connection=DBUtil.getConnection();Statement statement=connection.createStatement()){
            String sql="select from property where id="+id;
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                bean =new Property();
                String name=resultSet.getString("name");
                int cid=resultSet.getInt("cid");
                bean.setName(name);
                Category category=new CategoryDAO().get(cid);
                bean.setCategory(category);
                bean.setId(id);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }

    /**
     * 查询某个分类下的属性对象
     * @param cid
     * @param start
     * @param count
     * @return
     */
    public List<Property> list(int cid,int start,int count){
        List<Property> beans=new ArrayList<>();
        String sql="select * from property where cid=? order by id desc limit ?,? ";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
           preparedStatement.setInt(1,cid);
           preparedStatement.setInt(2,start);
           preparedStatement.setInt(3,count);
           ResultSet resultSet=preparedStatement.executeQuery();
           while (resultSet.next()){
               Property bean=new Property();
               int id=resultSet.getInt("id");
               String name=resultSet.getString("name");
               Category category=new CategoryDAO().get(cid);
               bean.setId(id);
               bean.setName(name);
               bean.setCategory(category);
               beans.add(bean);
           }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }
    /**
     * 查询某个分类下的属性对象
     * @param cid
     * @return
     */
    public List<Property> list(int cid){
        return list(cid,0,Short.MAX_VALUE);
    }
}
