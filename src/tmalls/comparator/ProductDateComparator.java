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
        System.out.println("o1的Date:"+o1.getCreateDate());
        System.out.println("o2的Date:"+o2.getCreateDate());
        return o1.getCreateDate().compareTo(o2.getCreateDate());
//        因为o1的date为空，所以没法比较
    }
}
