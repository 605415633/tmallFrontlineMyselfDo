package tmalls.bean;

/**
 * 基础属性的getter，setter。与Product的多对一的关系
 *
 * @author home-pc
 * @create2017 -08 -02 -13:16
 */
public class ProductImage {
    private int id;
    private String type;
    private Product product;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
