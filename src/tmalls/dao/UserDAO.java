package tmalls.dao;

import tmalls.bean.User;
import tmalls.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 基本的CRUD操作，还有非CRUD的方法，用于支持业务的方法。
 * 在业务上，注册的时候，需要判断某个用户是否已经存在，账户密码是否正确等操作
 *
 * @author home-pc
 * @create2017 -08 -03 -9:39
 */
public class UserDAO {

    public int getTotal(){
        int total=0;
        try(Connection connection= DBUtil.getConnection(); Statement statement=connection.createStatement()){
            String sql="select COUNT(*) from user";
            ResultSet resultSet=statement.executeQuery(sql);
            while(resultSet.next()){
                total=resultSet.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return total;
    }

    public void add(User bean){
        String sql="insert into user values(null,?,?)";
        try(Connection connection=DBUtil.getConnection(); PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setString(1,bean.getName());
            preparedStatement.setString(2,bean.getPassword());
            preparedStatement.execute();
            ResultSet resultSet=preparedStatement.getGeneratedKeys();
            while(resultSet.next()){//得到下一行
                int id=resultSet.getInt(1);//取出该行第一列的值。
                bean.setId(id);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

    }

    public void update(User bean){
        String sql="update user set name=? password=? where id= ? ";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setString(1,bean.getName());
            preparedStatement.setString(2,bean.getPassword());
            preparedStatement.setInt(3,bean.getId());
            preparedStatement.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void delete(int id){
        try(Connection connection=DBUtil.getConnection();Statement statement=connection.createStatement()){
            String sql="delete from User where id = "+id;
            statement.execute(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public User get(int id){
        User bean =null;
        try(Connection connection=DBUtil.getConnection();Statement statement=connection.createStatement()){
            String sql="select * from user where id="+id;
            ResultSet resultSet=statement.executeQuery(sql);
            if(resultSet.next()){
                bean=new User();
                String name=resultSet.getString("name");
                String password=resultSet.getString("password");
                bean.setName(name);
                bean.setPassword(password);
                bean.setId(id);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }

    public List<User> list(int start,int count){
        List<User> beans=new ArrayList<>();
        String sql="select * from user order by id desc limit ? , ?";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,start);
            preparedStatement.setInt(2,count);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                User bean=new User();
                int id=resultSet.getInt(1);
                String name=resultSet.getString("name");
                String password=resultSet.getString("password");
                bean.setId(id);
                bean.setName(name);
                bean.setPassword(password);
                beans.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }
    public List<User> list(){
        return list(0,Short.MAX_VALUE);
    }

    /**
     * 处理事务
     */
    public boolean isExist(String name){
        User user=get(name);
        return user!=null;//如果用户不空，返回TRUE。
    }
    public User get(String name){
        User bean=null;
        String sql="select * from user where name= ?";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setString(1,name);
            ResultSet resultSet=preparedStatement.executeQuery();
            if(resultSet.next()){
                bean=new User();
                int id=resultSet.getInt("id");
                String password=resultSet.getString("password");
                bean.setId(id);
                bean.setName(name);
                bean.setPassword(password);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }

    public User get(String name,String password){
        User bean=null;
        String sql="select * from user where name = ? and password = ?";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setString(1,name);
            preparedStatement.setString(2,password);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                bean =new User();
                int id=resultSet.getInt("id");
                bean.setName(name);
                bean.setPassword(password);
                bean.setId(id);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }


}
