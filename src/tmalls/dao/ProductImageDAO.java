package tmalls.dao;

import tmalls.bean.Product;
import tmalls.bean.ProductImage;
import tmalls.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 基本的CRUD，还有一个支持业务场景的方法
 *
 * @author home-pc
 * @create2017 -08 -03 -12:52
 */
public class ProductImageDAO {
    public static final String type_single="type_single";
    public static final String type_detail="type_detail";

    public int getTotal(){
        int total=0;
        try(Connection connection= DBUtil.getConnection(); Statement statement=connection.createStatement()){
            String sql="select count(*) from productImage";
            ResultSet resultSet=statement.executeQuery(sql);
            while(resultSet.next()){
                total=resultSet.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return total;
    }
    public void add(ProductImage bean){
        String sql="insert into productImage values(null,?,?)";
        try(Connection connection=DBUtil.getConnection(); PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,bean.getProduct().getId());
            preparedStatement.setString(2,bean.getType());
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

    public void update(ProductImage bean){

    }

    public void delete(int id){
        try(Connection connection=DBUtil.getConnection();Statement statement=connection.createStatement()){
            String sql="delete from productImage where id="+id;
            statement.execute(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public ProductImage get (int id){
        ProductImage bean =null;
        try(Connection connection=DBUtil.getConnection();Statement statement=connection.createStatement()){
            String sql="select * from productImage where id="+id;
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                bean=new ProductImage();
                bean.setId(id);
                int pid=resultSet.getInt("pid");
                Product product=new ProductDAO().get(pid);
                String type=resultSet.getString("type");
                bean.setType(type);
                bean.setProduct(product);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }

    public List<ProductImage> list(Product p,String type ,int start,int count){
        List<ProductImage> beans=new ArrayList<>();
        String sql="select * from productImage where pid=? and type=? order by id desc limit ?,? ";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,p.getId());
            preparedStatement.setString(2,type);
            preparedStatement.setInt(3,start);
            preparedStatement.setInt(4,count);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                ProductImage bean=new ProductImage();
                int id=resultSet.getInt(1);
                bean.setProduct(p);
                bean.setType(type);
                bean.setId(id);
                beans.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }

    public List<ProductImage> list(Product p,String type){
        return list(p,type,0,Short.MAX_VALUE);
    }
}
