package tmalls.comparator;

import tmalls.bean.Product;

import java.util.Comparator;

/**
 * 销量比较器，把销量高的放在前面
 * @author home-pc
 * @create2017 -09 -12 -15:13
 */
public class ProductSaleCountComparator implements Comparator<Product> {
    @Override
    public int compare(Product o1, Product o2) {
        return o2.getSaleCount()-o1.getSaleCount();
    }
}
