package tmalls.dao;

import tmalls.bean.Order;
import tmalls.bean.User;
import tmalls.util.DBUtil;
import tmalls.util.DateUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author home-pc
 * @create2017 -08 -04 -11:17
 */
public class OrderDAO {
    public static final String waitPay="waitPay";
    public static final String waitDelivery="waitDelivery";//等待交付
    public static final String waitConfirm="waitConfirm";
    public static final String waitReview="waitReview";
    public static final String finish="finish";
    public static final String delete="delete";


    public int getTotal(){
        int total=0;
        try(Connection connection= DBUtil.getConnection(); Statement statement=connection.createStatement()){
            String sql="select count(*) from order_";
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                total=resultSet.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return total;
    }

    public void add(Order bean){
        String sql="insert into order_ values(null,?,?,?,?,?,?,?,?,?,?,?,?)";
        try(Connection connection=DBUtil.getConnection(); PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setString(1,bean.getOrderCode());
            preparedStatement.setString(2,bean.getAddress());
            preparedStatement.setString(3,bean.getPost());
            preparedStatement.setString(4,bean.getReceiver());
            preparedStatement.setString(5,bean.getMobile());
            preparedStatement.setString(6,bean.getUserMessage());
            preparedStatement.setTimestamp(7,DateUtil.d2t(bean.getCreateDate()));
            preparedStatement.setTimestamp(8,DateUtil.d2t(bean.getPayDate()));
            preparedStatement.setTimestamp(9,DateUtil.d2t(bean.getDeliveryDate()));
            preparedStatement.setTimestamp(10,DateUtil.d2t(bean.getConfirmDate()));
            preparedStatement.setInt(11,bean.getUser().getId());
            preparedStatement.setString(12,bean.getStatus());
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
            String sql="delete from order_ where id="+id;
            statement.execute(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void update(Order bean){
        String sql="update order_ set address= ?, post=?, receiver=?, mobile=?, userMessage=?, createDate=?, payDate=?," +
                "deliveryDate=?, confirmDate=?, orderCode=?, uid=?, status=? where id= ?";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setString(1,bean.getAddress());
            preparedStatement.setString(2,bean.getPost());
            preparedStatement.setString(3,bean.getReceiver());
            preparedStatement.setString(4,bean.getMobile());
            preparedStatement.setString(5,bean.getUserMessage());
            preparedStatement.setTimestamp(6,DateUtil.d2t(bean.getCreateDate()));
            preparedStatement.setTimestamp(7,DateUtil.d2t(bean.getPayDate()));
            preparedStatement.setTimestamp(8,DateUtil.d2t(bean.getDeliveryDate()));
            preparedStatement.setTimestamp(9,DateUtil.d2t(bean.getConfirmDate()));
            preparedStatement.setString(10,bean.getOrderCode());
            preparedStatement.setInt(11,bean.getUser().getId());
            preparedStatement.setString(12,bean.getStatus());
            preparedStatement.setInt(13,bean.getId());
            preparedStatement.execute();

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public Order get(int id){
        Order bean=null;
        try(Connection connection=DBUtil.getConnection();Statement statement=connection.createStatement()){
            String sql="select * from order_ where id="+id;
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                bean=new Order();
                bean.setId(id);
                String orderCode=resultSet.getString("orderCode");
                String address=resultSet.getString("address");
                String post=resultSet.getString("post");
                String receiver=resultSet.getString("receiver");
                String mobile=resultSet.getString("mobile");
                String userMessage=resultSet.getString("userMessage");
                java.util.Date createDate=DateUtil.t2d(resultSet.getTimestamp("createDate"));
                java.util.Date payDate=DateUtil.t2d(resultSet.getTimestamp("payDate"));
                java.util.Date deliveryDate=DateUtil.t2d(resultSet.getTimestamp("deliveryDate"));
                java.util.Date confirmDate=DateUtil.t2d(resultSet.getTimestamp("confirmDate"));
                int uid=resultSet.getInt("uid");
                String status=resultSet.getString("status");
                bean.setOrderCode(orderCode);
                bean.setAddress(address);
                bean.setPost(post);
                bean.setReceiver(receiver);
                bean.setMobile(mobile);
                bean.setUserMessage(userMessage);
                bean.setCreateDate(createDate);
                bean.setPayDate(payDate);
                bean.setDeliveryDate(deliveryDate);
                bean.setConfirmDate(confirmDate);
                User user=new UserDAO().get(uid);
                bean.setUser(user);
                bean.setStatus(status);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }

    public List<Order> list(int start,int count){
        List<Order> beans=new ArrayList<>();
        String sql="select * from order_ order by id desc limit ?,?";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,start);
            preparedStatement.setInt(2,count);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                Order bean=new Order();
                int id=resultSet.getInt(1);
                bean.setId(id);
                String orderCode=resultSet.getString("orderCode");
                String address=resultSet.getString("address");
                String post=resultSet.getString("post");
                String receiver=resultSet.getString("receiver");
                String mobile=resultSet.getString("mobile");
                String userMessage=resultSet.getString("userMessage");
                java.util.Date createDate=DateUtil.t2d(resultSet.getTimestamp("createDate"));
                java.util.Date payDate=DateUtil.t2d(resultSet.getTimestamp("payDate"));
                java.util.Date deliveryDate=DateUtil.t2d(resultSet.getTimestamp("deliveryDate"));
                java.util.Date confirmDate=DateUtil.t2d(resultSet.getTimestamp("confirmDate"));
                int uid=resultSet.getInt("uid");
                String status=resultSet.getString("status");
                bean.setOrderCode(orderCode);
                bean.setAddress(address);
                bean.setPost(post);
                bean.setReceiver(receiver);
                bean.setMobile(mobile);
                bean.setUserMessage(userMessage);
                bean.setCreateDate(createDate);
                bean.setPayDate(payDate);
                bean.setDeliveryDate(deliveryDate);
                bean.setConfirmDate(confirmDate);
                User user=new UserDAO().get(uid);
                bean.setUser(user);
                bean.setStatus(status);
                beans.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }
    public List<Order> list(){
        return list(0,Short.MAX_VALUE);
    }


    public List<Order> list(int uid,String excludedStatus,int start,int count){
        List<Order> beans=new ArrayList<>();
        String sql="select * from order_ where uid = ? and status != ? order by id desc limit ?,? ";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,uid);
            preparedStatement.setString(2,excludedStatus);
            preparedStatement.setInt(3,start);
            preparedStatement.setInt(4,count);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                Order bean=new Order();
                int id=resultSet.getInt(1);
                bean.setId(id);
                String orderCode=resultSet.getString("orderCode");
                String address=resultSet.getString("address");
                String post=resultSet.getString("post");
                String receiver=resultSet.getString("receiver");
                String mobile=resultSet.getString("mobile");
                String userMessage=resultSet.getString("userMessage");
                java.util.Date createDate=DateUtil.t2d(resultSet.getTimestamp("createDate"));
                java.util.Date payDate=DateUtil.t2d(resultSet.getTimestamp("payDate"));
                java.util.Date deliveryDate=DateUtil.t2d(resultSet.getTimestamp("deliveryDate"));
                java.util.Date confirmDate=DateUtil.t2d(resultSet.getTimestamp("confirmDate"));
                String status=resultSet.getString("status");
                bean.setOrderCode(orderCode);
                bean.setAddress(address);
                bean.setPost(post);
                bean.setReceiver(receiver);
                bean.setMobile(mobile);
                bean.setUserMessage(userMessage);
                bean.setCreateDate(createDate);
                bean.setPayDate(payDate);
                bean.setDeliveryDate(deliveryDate);
                bean.setConfirmDate(confirmDate);
                User user=new UserDAO().get(uid);
                bean.setUser(user);
                bean.setStatus(status);
                beans.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }
    //展示出订单中排除某种状态的全部订单
    public List<Order> list(int uid,String excludedStatus){
        return list(uid,excludedStatus,0,Short.MAX_VALUE);
    }

}
