package tmalls.comparator;

import tmalls.bean.Product;

import java.util.Comparator;

/**
 * 价格比较器，把价格低的放在前面
 *
 * @author home-pc
 * @create2017 -09 -12 -15:10
 */
public class ProductPriceComparator implements Comparator<Product> {

    @Override
    public int compare(Product o1, Product o2) {
        return (int)(o1.getPromotePrice()-o2.getPromotePrice());
    }
}
