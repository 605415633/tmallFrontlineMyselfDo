package tmalls.comparator;

import tmalls.bean.Product;

import java.util.Comparator;

/**
 * 综合比较器 把销量*评价高的放前面
 *
 * @author home-pc
 * @create2017 -09 -12 -15:04
 */
public class ProductAllComparator implements Comparator<Product> {
    @Override
    public int compare(Product o1, Product o2) {
        return o2.getReviewCount()*o2.getSaleCount()-o1.getReviewCount()*o1.getSaleCount();
    }
}
