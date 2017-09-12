package tmalls.comparator;

import tmalls.bean.Product;

import java.util.Comparator;

/**
 * 新品比较器，把创建日期晚的放前面
 *
 * @author home-pc
 * @create2017 -09 -12 -15:07
 */
public class ProductDateComparator implements Comparator<Product> {
    @Override
    public int compare(Product o1, Product o2) {
        return o1.getCreateDate().compareTo(o2.getCreateDate());
    }
}
