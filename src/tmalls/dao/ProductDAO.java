package tmalls.dao;

import tmalls.bean.Category;
import tmalls.bean.Product;
import tmalls.bean.ProductImage;
import tmalls.util.DBUtil;
import tmalls.util.DateUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 普通的CRUD，还提供了了一些用于支持业务的方法
 *
 * @author home-pc
 * @create2017 -08 -03 -16:02
 */
public class ProductDAO {

    /**
     * 获取某种分类下的产品数量
     * @param cid
     * @return
     */
    public int getTotal(int cid){
        int total=0;
        try(Connection connection= DBUtil.getConnection(); Statement statement=connection.createStatement()){
            String sql="select count(*) from product WHERE cid="+cid;
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                total=resultSet.getInt(1);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return total;
    }

    public void add(Product bean){
        String sql="insert into product values(null,?,?,?,?,?,?,?)";
        try(Connection connection=DBUtil.getConnection(); PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setString(1,bean.getName());
            preparedStatement.setString(2,bean.getSubTitle());
            preparedStatement.setFloat(3,bean.getOrignalPrice());
            preparedStatement.setFloat(4,bean.getPromotePrice());
            preparedStatement.setInt(5,bean.getStock());
            preparedStatement.setInt(6,bean.getCategory().getId());
            preparedStatement.setTimestamp(7, DateUtil.d2t(bean.getCreateDate()));//需要调用日期转换
            preparedStatement.execute();
            ResultSet resultSet=preparedStatement.getGeneratedKeys();
            if (resultSet.next()){//对谁调用，谁成为当前行。
                int id=resultSet.getInt(1);
                bean.setId(id);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public void delete(int id){
        try(Connection connection=DBUtil.getConnection();Statement statement=connection.createStatement()){
            String sql="delete from product where id="+id;
            statement.execute(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public void update(Product bean){
        String sql="update product set name=?, subTitle=?, orignalPrice=?, promotePrice=?, stock=?, cid=?, createDate=? where id=?";
        try(Connection connection=DBUtil.getConnection(); PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setString(1,bean.getName());
            preparedStatement.setString(2,bean.getSubTitle());
            preparedStatement.setFloat(3,bean.getOrignalPrice());
            preparedStatement.setFloat(4,bean.getPromotePrice());
            preparedStatement.setInt(5,bean.getStock());
            preparedStatement.setInt(6,bean.getCategory().getId());
            preparedStatement.setTimestamp(7,DateUtil.d2t(bean.getCreateDate()));
            preparedStatement.setInt(8,bean.getId());
            preparedStatement.execute();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public Product get(int id){
        Product bean=new Product();
        try(Connection connection=DBUtil.getConnection();Statement statement=connection.createStatement()){
            String sql="select * from product where id="+id;
            ResultSet resultSet=statement.executeQuery(sql);
            while (resultSet.next()){
                String name=resultSet.getString("name");
                String subTitle=resultSet.getString("subTitle");
                float orignalPrice=resultSet.getFloat("orignalPrice");
                float promotePrice=resultSet.getFloat("promotePrice");
                int stock=resultSet.getInt("stock");
                int cid=resultSet.getInt("cid");
                Date createDate=DateUtil.t2d(resultSet.getTimestamp("createDate"));
                bean.setName(name);
                bean.setSubTitle(subTitle);
                bean.setOrignalPrice(orignalPrice);
                bean.setPromotePrice(promotePrice);
                bean.setStock(stock);
                Category category=new CategoryDAO().get(cid);
                bean.setCategory(category);
                bean.setCreateDate(createDate);
                bean.setId(id);
                setFirstProductImage(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return bean;
    }

    /**
     * 查询分类下的产品
     * @param cid
     * @param start
     * @param count
     * @return
     */
    public List<Product> list(int cid,int start,int count){
        List<Product> beans=new ArrayList<>();
        Category category=new CategoryDAO().get(cid);
        String sql="select * from product where cid= ? order by id desc limit ?,?";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,cid);
            preparedStatement.setInt(2,start);
            preparedStatement.setInt(3,count);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                Product bean=new Product();
                int id=resultSet.getInt(1);
                bean.setId(id);
                String name=resultSet.getString("name");
                bean.setName(name);
                String subTitle=resultSet.getString("subTitle");
                bean.setSubTitle(subTitle);
                float orignalPrice=resultSet.getFloat("orignalPrice");
                bean.setOrignalPrice(orignalPrice);
                float promotePrice=resultSet.getFloat("promotePrice");
                bean.setPromotePrice(promotePrice);
                int stock=resultSet.getInt("stock");
                bean.setStock(stock);
                bean.setCategory(category);
                Date date=DateUtil.t2d(resultSet.getTimestamp("createDate"));
                bean.setCreateDate(date);
                setFirstProductImage(bean);
                beans.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }

    /**
     * 查询某一分类产品下的所有产品
     * @param cid
     * @return
     */
    public List<Product> list(int cid){
        return list(cid,0,Short.MAX_VALUE);
    }
    public List<Product> list(int start,int count){
        List<Product> beans=new ArrayList<>();
        String sql="select * from product limit ?,?";
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setInt(1,start);
            preparedStatement.setInt(2,count);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                Product bean=new Product();
                int id=resultSet.getInt(1);
                bean.setId(id);
                String name=resultSet.getString("name");
                bean.setName(name);
                String subTitle=resultSet.getString("subTitle");
                bean.setSubTitle(subTitle);
                float orignalPrice=resultSet.getFloat("orignalPrice");
                bean.setOrignalPrice(orignalPrice);
                float promotePrice=resultSet.getFloat("promotePrice");
                bean.setPromotePrice(promotePrice);
                int stock=resultSet.getInt("stock");
                bean.setStock(stock);
                int cid=resultSet.getInt("cid");
                Category category=new CategoryDAO().get(cid);
                bean.setCategory(category);
                Date date=DateUtil.t2d(resultSet.getTimestamp("createDate"));
                bean.setCreateDate(date);
                beans.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }
    public List<Product> list(){
        return list(0,Short.MAX_VALUE);
    }

    /**
     * 为分类填充产品集合
     * @param cs
     */
    public void fill(List<Category> cs){
        for(Category c:cs){
            fill(c);
        }
    }
    public void fill(Category c){
        List<Product> ps=this.list(c.getId());//把c类别下的所有产品都放在了List<Product> ps中了。
        c.setProducts(ps);//给产品种类设置它所包含的产品。
    }

    public void fillByRow(List<Category> cs){
        int productNumberEachRow=8;//每行8个产品
        for(Category c:cs){
            List<Product> products=c.getProducts();//获取某一种类产品的全部产品，并放入products集合中。
            List<List<Product>> productsByRow=new ArrayList<>();//初始化产品竖列表中所有的产品。
            for(int i=0;i<products.size();i+=productNumberEachRow){
                int size=i+productNumberEachRow;
                size=size>products.size()?products.size():size;
                List<Product> productsOfEachRow=products.subList(i,size);
                productsByRow.add(productsOfEachRow);
            }
            c.setProductsByRow(productsByRow);
        }
    }

    /**
     * 一个产品有多个图片。但是只有一个主图片
     * @param p
     */
    public void setFirstProductImage(Product p){
        List<ProductImage> pis=new ProductImageDAO().list(p,ProductImageDAO.type_single);
        if(!pis.isEmpty()){
            p.setFirstProductImage(pis.get(0));
        }
    }

    /**
     * 没写了
     * @param p
     */
    public void setSaleAndReviewNumber(Product p){
        int saleCount=new OrderItemDAO().getSaleCount(p.getId());
        p.setSaleCount(saleCount);

        int reviewCount=new ReviewDAO().getTotal(p.getId());
        p.setReviewCount(reviewCount);
    }

    public void setSaleAndReviewNumber(List<Product> products){
        for(Product p:products){
            setSaleAndReviewNumber(p);
        }
    }



    public List<Product> search(String keyword,int start,int count){
        List<Product> beans=new ArrayList<>();
        if(keyword==null||keyword.trim().length()==0){//去掉前面和后面的空白
            return beans;
        }
        String sql="select * from Product where name like ? limit ?,?";//like用于搜索任何包含?的内容的所有产品、
        try(Connection connection=DBUtil.getConnection();PreparedStatement preparedStatement=connection.prepareStatement(sql)){
            preparedStatement.setString(1,"%"+keyword.trim()+"%");
            preparedStatement.setInt(2,start);
            preparedStatement.setInt(3,count);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                Product bean=new Product();
                int id=resultSet.getInt(1);
                String name =resultSet.getString("name");
                String subTitle=resultSet.getString("subTitle");
                float orignalPrice=resultSet.getFloat("orignalPrice");
                float promotePrice=resultSet.getFloat("promotePrice");
                int stock=resultSet.getInt("stock");
                int cid=resultSet.getInt("cid");
                Date date=DateUtil.t2d(resultSet.getTimestamp("createDate"));
                bean.setId(id);
                bean.setName(name);
                bean.setSubTitle(subTitle);
                bean.setOrignalPrice(orignalPrice);
                bean.setPromotePrice(promotePrice);
                bean.setStock(stock);
                bean.setCreateDate(date);
                Category category=new CategoryDAO().get(cid);
                bean.setCategory(category);
                setFirstProductImage(bean);
                beans.add(bean);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return beans;
    }
}
