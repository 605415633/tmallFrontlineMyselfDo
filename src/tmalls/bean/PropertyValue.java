package tmalls.bean;

/**
 * 基本属性的getter，setter。与Product是多对一关系 与属性是多对一关系
 *
 * @author home-pc
 * @create2017 -08 -02 -13:22
 */
public class PropertyValue {
    private int id;
    private String value;
    private Product product;
    private Property property;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Property getProperty() {
        return property;
    }

    public void setProperty(Property property) {
        this.property = property;
    }
}
