package tmalls.bean;

/**
 * 基本属性的getter，setter
 *与Product的多对一的关系
 * 与User多对一的关系
 * 与Order多对一的关系
 * @author home-pc
 * @create2017 -08 -02 -21:36
 */
public class OrderItem {
    private int number;
    private Product product;
    private Order order;
    private User user;
    private int id;

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
