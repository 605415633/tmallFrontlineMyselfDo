package tmalls.bean;

import java.util.List;

/**
 * 产品分类，各种大的类别，如手机，电脑，扫地机等。
 *
 * @author home-pc
 * @create2017 -08 -02 -11:35
 */
public class Category {
    private String name;
    private int id ;
    List<Product> products;
    List<List<Product>> productsByRow;

    @Override
    public String toString() {
        return "Category{" +
                "name='" + name + '\'' +
                '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public List<List<Product>> getProductsByRow() {
        return productsByRow;
    }

    public void setProductsByRow(List<List<Product>> productsByRow) {
        this.productsByRow = productsByRow;
    }
}
