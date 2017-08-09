package tmalls.dao;

import tmalls.bean.Product;
import tmalls.bean.Review;
import tmalls.bean.User;
import tmalls.util.DBUtil;
import tmalls.util.DateUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author home-pc
 * @create2017 -08 -04 -10:10
 */
public class ReviewDAO {


    public int getTotal(){
       int total=0;
       try(Connection connection= DBUtil.getConnection(); Statement statement=connection.createStatement()){
           String sql="select count(*) from review";
           ResultSet resultSet=statement.executeQuery(sql);
           while (resultSet.next()){
               total=resultSet.getInt(1);
           }
       }catch (SQLException e){
           e.printStackTrace();
       }
       return total;
    }

    public int getTotal(int pid){
        int total=0;
        try(Connection connection=DBUtil.getConnection();Statement statement=connection.createStatement()){
            String sql=" select count(*) from review where pid="+pid;
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                total=resultSet.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return total;
    }

    public void add(Review bean){
        String sql="insert into review values(null,?,?,?,?)";
        try(Connection connection=DBUtil.getConnection(); PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setString(1,bean.getContent());
            preparedStatement.setInt(2,bean.getUser().getId());
            preparedStatement.setInt(3,bean.getProduct().getId());
            preparedStatement.setTimestamp(4, DateUtil.d2t(bean.getCreateDate()));
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

    public void delete(int id){
        try(Connection connection=DBUtil.getConnection();Statement statement=connection.createStatement()){
            String sql="delete from review where id="+id;
            statement.execute(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void update(Review bean){
        String sql="update review set content=? ,uid=?,pid=?,createDate=? where id=?";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
           preparedStatement.setString(1,bean.getContent());
           preparedStatement.setInt(2,bean.getUser().getId());
           preparedStatement.setInt(3,bean.getProduct().getId());
           preparedStatement.setTimestamp(4,DateUtil.d2t(bean.getCreateDate()));
           preparedStatement.setInt(5,bean.getId());
           preparedStatement.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public Review get(int id){
        Review bean=null;
        try(Connection connection=DBUtil.getConnection();Statement statement=connection.createStatement()){
            String sql="select * from review where id="+id;
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                bean=new Review();
                String content=resultSet.getString("content");
                int uid=resultSet.getInt("uid");
                int pid=resultSet.getInt("pid");
                Date createDate=DateUtil.t2d(resultSet.getTimestamp("createDate"));
                bean.setId(id);
                bean.setContent(content);
                bean.setCreateDate(createDate);
                User user=new UserDAO().get(uid);
                bean.setUser(user);
                Product product=new ProductDAO().get(pid);
                bean.setProduct(product);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }

    public List<Review> list(int pid){
        return list(pid,0,Short.MAX_VALUE);
    }
    public List<Review> list(int pid,int start,int count){
        List<Review> beans=new ArrayList<>();
        String sql="select * from review where pid=? order by id desc limit ?,?";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,pid);
            preparedStatement.setInt(2,start);
            preparedStatement.setInt(3,count);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                Review bean=new Review();
                int id=resultSet.getInt(1);
                String content=resultSet.getString("content");
                int uid=resultSet.getInt("uid");
                Date createDate=DateUtil.t2d(resultSet.getTimestamp("createDate"));
                bean.setId(id);
                bean.setContent(content);
                bean.setCreateDate(createDate);
                User user=new UserDAO().get(uid);
                Product product=new ProductDAO().get(pid);
                bean.setUser(user);
                bean.setProduct(product);
                beans.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }

    /**
     * p判断某项内容的评论的产品是否存在
     * @param content
     * @param pid
     * @return
     */
    public boolean isExit(String content,int pid){
        String sql=" select * from review where content =? and pid= ?";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setString(1,content);
            preparedStatement.setInt(2,pid);
            ResultSet resultSet=preparedStatement.executeQuery();
            if (resultSet.next()){
                return true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return false;
    }

}
