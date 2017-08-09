package tmalls.bean;

/**
 * 基本属性的getter，setter，与Category的多对一的关系
 *
 * @author home-pc
 * @create2017 -08 -02 -13:09
 */
public class Property {
    private String name;
    private int id ;
    private Category category;

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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
