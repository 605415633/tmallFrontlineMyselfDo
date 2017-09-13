package tmalls.servlet;

import tmalls.bean.Category;
import tmalls.bean.Product;
import tmalls.bean.Property;
import tmalls.bean.PropertyValue;
import tmalls.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Iterator;
import java.util.List;

/**
 * @author home-pc
 * @create2017 -08 -20 -13:23
 */
public class ProductServlet extends BaseBackServlet {
    @Override
    public String add(HttpServletRequest request, HttpServletResponse response, Page page) {
        int cid=Integer.parseInt(request.getParameter("cid"));
        Category category=categoryDAO.get(cid);
        int stock=Integer.parseInt(request.getParameter("stock"));
        float propmotePrice=Float.parseFloat(request.getParameter("promotePrice"));
        float orignalPrice=Float.parseFloat(request.getParameter("orignalPrice"));
        String subTitle=request.getParameter("subTitle");
        String name=request.getParameter("name");
        Product product=new Product();
        product.setCategory(category);
        product.setStock(stock);
        product.setPromotePrice(propmotePrice);
        product.setOrignalPrice(orignalPrice);
        product.setName(name);
        product.setSubTitle(subTitle);
        productDAO.add(product);
        return "@admin_product_list?cid="+cid;
    }

    @Override
    public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
        int id=Integer.parseInt(request.getParameter("id"));
        productDAO.delete(id);
        Product product=productDAO.get(id);
        return "admin_product_list?cid="+product.getCategory().getId();
    }

    @Override
    public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
        String name=request.getParameter("name");
        String subTitle=request.getParameter("subTitle");
        Float orignalPrice=Float.parseFloat(request.getParameter("orignalPrice"));
        Float promotePrice=Float.parseFloat(request.getParameter("promotePrice"));
        int stock=Integer.parseInt(request.getParameter("stock"));
        int id=Integer.parseInt(request.getParameter("id"));
        int cid=Integer.parseInt(request.getParameter("cid"));
        Product product=new Product();
        product.setSubTitle(subTitle);
        product.setName(name);
        product.setPromotePrice(promotePrice);
        product.setOrignalPrice(orignalPrice);
        product.setStock(stock);
        product.setId(id);
        Category category=categoryDAO.get(cid);
        product.setCategory(category);
        productDAO.update(product);
        return "@admin_product_list?cid="+product.getCategory().getId();
    }

    @Override
    public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
        int id=Integer.parseInt(request.getParameter("id"));
        Product product=productDAO.get(id);
        request.setAttribute("p",product);
        return "admin/editProduct.jsp";
    }

    @Override
    public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
        int cid=Integer.parseInt(request.getParameter("cid"));
        Category category=categoryDAO.get(cid);
        List<Product> products=productDAO.list(cid,page.getStart(),page.getCount());
        int total=productDAO.getTotal(cid);
        page.setTotal(total);
        page.setParam("&cid="+category.getId());
        request.setAttribute("ps",products);
        request.setAttribute("page",page);
        System.out.println("page.param():"+page.getParam());
        request.setAttribute("c",category);
        return "admin/listProduct.jsp";
    }

    /**
     * 更新属性值，这个现在好像用不到。返回值为%success。直接返回字符串。
     * @param request
     * @param response
     * @param page
     * @return
     */
    public String updatePropertyValue(HttpServletRequest request,HttpServletResponse response,Page page){
        int pvid=Integer.parseInt(request.getParameter("pvid"));
        String value=request.getParameter("value");
        System.out.println("pvid:"+pvid+" value:"+value);
        PropertyValue pv=propertyValueDAO.get(pvid);
        pv.setValue(value);
        System.out.println("接下来即将要进入update方法了");
        propertyValueDAO.update(pv);
        return "%success";
    }

    public String editPropertyValue(HttpServletRequest request,HttpServletResponse response,Page page){

        int id=Integer.parseInt(request.getParameter("id"));
        Product product=productDAO.get(id);
        System.out.println("product: name : "+product.getName()+"  id:"+product.getId());
        request.setAttribute("p",product);
//下面这有错误
        List<Property> pts=propertyDAO.list(product.getCategory().getId());
        propertyValueDAO.init(product);

        List<PropertyValue> pvs=propertyValueDAO.list(product.getId());
        Iterator iterator=pvs.iterator();
        while (iterator.hasNext()){
            PropertyValue propertyValue=(PropertyValue) iterator.next();
            System.out.println("所有的属性值;propertyValue:"+propertyValue.toString());
        }
        request.setAttribute("pvs",pvs);
        return "admin/editProductValue.jsp";
    }
}
