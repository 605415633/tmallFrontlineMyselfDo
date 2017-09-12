package tmalls.comparator;

import tmalls.bean.Product;

import java.util.Comparator;

/**
 * 人气比较器，把评价数量多的放前面
 *
 * @author home-pc
 * @create2017 -09 -12 -15:12
 */
public class ProductReviewComparator implements Comparator<Product> {
    @Override
    public int compare(Product o1, Product o2) {
        return o2.getReviewCount()-o1.getReviewCount();
    }
}
