package tmalls.dao;

import tmalls.bean.Order;
import tmalls.bean.OrderItem;
import tmalls.bean.Product;
import tmalls.bean.User;
import tmalls.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author home-pc
 * @create2017 -08 -04 -14:23
 */
public class OrderItemDAO {

    public int getTotal(){
        int total=0;
        try(Connection connection= DBUtil.getConnection(); Statement statement=connection.createStatement()){
            String sql="select count(*) from orderItem";
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                total=resultSet.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return total;
    }

    public void add(OrderItem bean){
        String sql="insert into orderItem values(null,?,?,?,?)";
        try(Connection connection=DBUtil.getConnection(); PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,bean.getProduct().getId());
            if(bean.getOrder()==null)//订单项在创建的时候，是没有订单信息的
                preparedStatement.setInt(2,-1);
            else
                preparedStatement.setInt(2,bean.getOrder().getId());
            preparedStatement.setInt(3,bean.getUser().getId());
            preparedStatement.setInt(4,bean.getNumber());
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
            String sql="delete from orderItem where id="+id;
            statement.execute(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void update(OrderItem bean){
        String sql="update orderItem set pid= ?, oid=?, uid=?, number=? where id= ?";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,bean.getProduct().getId());
            if(bean.getOrder()==null)
                preparedStatement.setInt(2,-1);
            else
                preparedStatement.setInt(2,bean.getOrder().getId());
            preparedStatement.setInt(3,bean.getUser().getId());
            preparedStatement.setInt(4,bean.getNumber());
            preparedStatement.setInt(5,bean.getId());
            preparedStatement.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }


    public OrderItem get(int id){
        OrderItem bean=new OrderItem();
        try(Connection connection=DBUtil.getConnection();Statement statement=connection.createStatement()){
            String sql=" select * from orderItem where id = "+id;
            ResultSet resultSet=statement.executeQuery(sql);
            if (resultSet.next()){
              int pid=resultSet.getInt("pid");
              int oid=resultSet.getInt("oid");
              int uid=resultSet.getInt("uid");
              int number=resultSet.getInt("number");
              Product product=new ProductDAO().get(pid);
              User user=new UserDAO().get(uid);
              bean.setProduct(product);
              bean.setUser(user);
              bean.setNumber(number);

              if(oid!=-1){
                  Order order=new OrderDAO().get(oid);
                  bean.setOrder(order);
              }
              bean.setId(id);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return  bean;
    }

    public List<OrderItem> listByUser(int uid,int start,int count){
        List<OrderItem> beans=new ArrayList<>();
        //-1代表空。
        String sql="select * from orderItem where uid= ? and oid=-1 order by id desc limit ?,?";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,uid);
            preparedStatement.setInt(2,start);
            preparedStatement.setInt(3,count);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                OrderItem bean=new OrderItem();
                int id=resultSet.getInt(1);
                int pid=resultSet.getInt("pid");
                int oid=resultSet.getInt("oid");
                int number=resultSet.getInt("number");
                bean.setId(id);
                Product product=new ProductDAO().get(pid);
                bean.setProduct(product);
                if(oid!=-1){
                    Order order=new OrderDAO().get(oid);
                    bean.setOrder(order);
                }
                User user=new UserDAO().get(uid);
                bean.setUser(user);
                bean.setNumber(number);
                beans.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }
    public List<OrderItem> listByUser(int uid){
        return listByUser(uid,0,Short.MAX_VALUE);
    }


    public List<OrderItem> listByOrder(int oid,int start,int count){
        List<OrderItem> beans=new ArrayList<>();
        String sql="select * from orderItem where oid = ? order by id desc limit ?,? ";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,oid);
            preparedStatement.setInt(2,start);
            preparedStatement.setInt(3,count);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                OrderItem bean=new OrderItem();
                int id=resultSet.getInt(1);
                int pid=resultSet.getInt("pid");
                int uid=resultSet.getInt("uid");
                int number=resultSet.getInt("number");
                Product product=new ProductDAO().get(pid);
                if(oid!=-1){
                    Order order=new OrderDAO().get(oid);
                    bean.setOrder(order);
                }
                User user=new UserDAO().get(uid);
                bean.setProduct(product);
                bean.setId(id);
                bean.setNumber(number);
                bean.setUser(user);
                beans.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }

    public List<OrderItem> listByOrder(int oid){
        return listByOrder(oid,0,Short.MAX_VALUE);
    }


    /**
     * 为订单设置订单项集合
     *
     * @param os
     */
    public void fill(List<Order> os){
        for(Order o:os){                        //把订单集合中每个订单中的所有订单项放入集合ois中。
            List<OrderItem> ois=listByOrder(o.getId());
            float total=0;
            int totalNumber=0;
            for(OrderItem oi:ois){
                total+=oi.getNumber()*oi.getProduct().getPromotePrice();//算出某个订单中所有订单项的总价钱。
                totalNumber+=oi.getNumber();//算出某个订单中共有的订单数。
            }
            o.setTotal(total);//某个订单的总价钱
            o.setOrderItems(ois);//设置该订单的订单项
            o.setTotalNumber(totalNumber);
        }
    }

    public void fill(Order o){
        List<OrderItem> ois=listByOrder(o.getId());
        float total=0;
        for(OrderItem oi: ois){
            total+=oi.getNumber()*oi.getProduct().getPromotePrice();
        }
        o.setTotal(total);
        o.setOrderItems(ois);
    }

    public List<OrderItem> listByProduct(int pid,int start,int count){
        List<OrderItem> beans=new ArrayList<>();
        String sql="select * from orderItem where pid=? order by id desc limit ?,?";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,pid);
            preparedStatement.setInt(2,start);
            preparedStatement.setInt(3,count);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                OrderItem bean=new OrderItem();
                int id=resultSet.getInt(1);
                bean.setId(id);
                int number=resultSet.getInt("number");
                bean.setNumber(number);
                int uid=resultSet.getInt("uid");
                User user=new UserDAO().get(uid);
                bean.setUser(user);
                Product product=new ProductDAO().get(pid);
                bean.setProduct(product);
                int oid=resultSet.getInt("oid");
                if(oid!=-1){
                    Order order=new OrderDAO().get(oid);
                    bean.setOrder(order);
                }
                beans.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }


    public int getSaleCount(int pid){
        int total=0;
        try(Connection connection=DBUtil.getConnection(); Statement statement=connection.createStatement()){
            String sql="select sum(number) from orderItem where pid="+pid;
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                total=resultSet.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return total;
    }
}
