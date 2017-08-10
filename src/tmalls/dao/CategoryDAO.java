package tmalls.dao;

import tmalls.bean.Category;
import tmalls.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 用于建立Category对象的ORM映射
 *
 * @author home-pc
 * @create2017 -08 -03 -7:17
 */
public class CategoryDAO {

    public int getTotal(){
        int total=0;
        try(Connection c=DBUtil.getConnection(); Statement s=c.createStatement()){
            String sql="select count(*) from category";
            ResultSet resultSet=s.executeQuery(sql);
            while(resultSet.next()){
                total=resultSet.getInt(1);//检索结果集对象当前行中指定列的值，
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return total;
    }
    public void add(Category bean){
        String sql="insert into category values(null,?)";
        try(Connection connection=DBUtil.getConnection(); PreparedStatement pr=connection.prepareStatement(sql)){
            pr.setString(1,bean.getName());
            pr.execute();
            ResultSet resultSet=pr.getGeneratedKeys();
            if(resultSet.next()){
                int id=resultSet.getInt(1);
                bean.setId(id);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void update(Category bean){
        String sql="update category set name=? where id = ?";
        try(Connection c=DBUtil.getConnection();PreparedStatement preparedStatement=c.prepareStatement(sql)){
            preparedStatement.setString(1,bean.getName());
            preparedStatement.setInt(2,bean.getId());
            preparedStatement.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public void delete(int id){
        try(Connection c=DBUtil.getConnection(); Statement s=c.createStatement();){
            String sql="delete from category where id = "+id;
            s.execute(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public Category get(int id){
        Category bean= null;
        try(Connection c=DBUtil.getConnection(); Statement statement=c.createStatement();){
            String sql="select * from category where id="+id;
            ResultSet resultSet=statement.executeQuery(sql);
            if(resultSet.next()){//获取当前行
                bean=new Category();
                String name=resultSet.getString(2);
                bean.setName(name);
                bean.setId(id);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }

    /**
     * 用于分页查询
     * @param start 数据的开始行数
     * @param count 获取的总行数
     * @return
     */
    public List<Category> list(int start,int count){
        List<Category> beans=new ArrayList<>();
        String sql="select * from category order by id desc limit ?,?";//选择category的id按降序排序。从第一个问号开始的第二个？个category。
        try(Connection connection=DBUtil.getConnection(); PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,start);
            preparedStatement.setInt(2,count);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                Category bean=new Category();
                int id=resultSet.getInt(1);
                String name=resultSet.getString(2);
                bean.setId(id);
                bean.setName(name);
                beans.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }
    //查询所有结果
    public List<Category> list(){
        return list(0,Short.MAX_VALUE);//Short.MAX_VALUE为332767，如果不够用，则可以使用Integer.MAX_VALUE
    }
}
