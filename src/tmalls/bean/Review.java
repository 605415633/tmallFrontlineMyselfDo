package tmalls.bean;

import java.util.Date;

/**
 * 基本属性的getter，setter。与User多对一的关系。与Product是多对一的关系
 *
 * @author home-pc
 * @create2017 -08 -02 -13:25
 */
public class Review {
    private String content;
    private Date createDate;
    private User user;
    private Product product;
    private int id;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
