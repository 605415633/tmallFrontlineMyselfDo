package tmalls.servlet;

import org.springframework.web.util.HtmlUtils;
import tmalls.bean.*;
import tmalls.comparator.*;
import tmalls.dao.CategoryDAO;
import tmalls.dao.ProductDAO;
import tmalls.dao.ProductImageDAO;
import tmalls.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author home-pc
 * @create2017 -08 -24 -9:47
 */
public class ForeServlet extends BaseForeServlet {

    public String home(HttpServletRequest request, HttpServletResponse response, Page page){
        List<Category> categories=new CategoryDAO().list();
        new ProductDAO().fill(categories);
        new ProductDAO().fillByRow(categories);
        request.setAttribute("cs",categories);
        for (Category c:categories
             ) {
            System.out.println("种类的ID："+c.getId()+" 种类的名称："+c.getName());
        }
        return "home.jsp";
    }

    public String register(HttpServletRequest request, HttpServletResponse response, Page page){
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        name= HtmlUtils.htmlEscape(name);//通过HtmlUtils.htmlEscape(name);把账户里的特殊符号进行转义。
//        为什么要用 HtmlUtils.htmlEscape？ 因为有些同学在恶意注册的时候，会使用诸如 <script>alert('papapa')</script> 这样的名称，
// 会导致网页打开就弹出一个对话框。 那么在转义之后，就没有这个问题了。
        boolean exit=userDAO.isExist(name);
        if(exit){
            request.setAttribute("msg","用户名已经被使用，不能使用");
            return "register.jsp";
        }
        User user=new User();
        user.setName(name);
        user.setPassword(password);
        userDAO.add(user);
        return "@registerSuccess.jsp";

    }

    public String login(HttpServletRequest request,HttpServletResponse response,Page page){
        String name=request.getParameter("name");
        String password=request.getParameter("password");

        User user=userDAO.get(name,password);
        if(user==null){
            request.setAttribute("message","账户或密码错误");
            return "login.jsp";
        }
        request.getSession().setAttribute("user",user);
        return "@forehome";
    }

    public String logout(HttpServletRequest request,HttpServletResponse response,Page page){
        request.getSession().removeAttribute("user");
        return "@forehome";
    }

    public String product(HttpServletRequest request,HttpServletResponse response, Page page){
        List<Category> categoriess=(List<Category>) request.getAttribute("cs");
        for (Category c:categoriess
                ) {
            System.out.println("在产品列表中的种类的ID："+c.getId()+" 种类的名称："+c.getName());
        }
        int pid=Integer.parseInt(request.getParameter("pid"));
        Product product=productDAO.get(pid);
        List<ProductImage> productSingleImages=productImageDAO.list(product, ProductImageDAO.type_single);
        List<ProductImage> productDetailImages=productImageDAO.list(product,ProductImageDAO.type_detail);
        product.setProductSingleImages(productSingleImages);
        product.setProductDetailImages(productDetailImages);

        System.out.println("开始读取属性值");
        List<PropertyValue> propertyValues=propertyValueDAO.list(product.getId());
        for(PropertyValue pv:propertyValues){
            System.out.println("属性值的值 value:"+pv.getValue());
            System.out.println("属性值所属的产品 product:"+pv.getProduct());
            System.out.println("属性值所属的属性 property:"+pv.getProperty());

        }
        System.out.println("已经读完属性值了");
        List<Review> reviews=reviewDAO.list(product.getId());
        productDAO.setSaleAndReviewNumber(product);
        request.setAttribute("reviews",reviews);
        request.setAttribute("p",product);
        request.setAttribute("pvs",propertyValues);
        return "product.jsp";

    }

    public String checkLogin(HttpServletRequest request,HttpServletResponse response,Page page){
        User user=(User) request.getSession().getAttribute("user");
        if(user!=null)
            return "%success";
        return "%fail";
    }

    public String loginAjax(HttpServletRequest request,HttpServletResponse response,Page page){
        String name=request.getParameter("name");
        String password=request.getParameter("password");

        User user=userDAO.get(name,password);
        if(user==null){
            return "%fail";
        }
        request.getSession().setAttribute("user",user);
        return "%success";
    }

    public String category(HttpServletRequest request,HttpServletResponse response,Page page){
        int cid=Integer.parseInt(request.getParameter("cid"));
        Category category=categoryDAO.get(cid);
        new ProductDAO().fill(category);
        new ProductDAO().setSaleAndReviewNumber(category.getProducts());
        String sort=request.getParameter("sort");
        if(sort!=null){
            switch (sort){
                case "review":
                    Collections.sort(category.getProducts(),new ProductReviewComparator());
                    break;
                case "date":
                    Collections.sort(category.getProducts(),new ProductDateComparator());
                    break;
                case "saleCount":
                    Collections.sort(category.getProducts(),new ProductSaleCountComparator());
                    break;
                case "price":
                    Collections.sort(category.getProducts(),new ProductPriceComparator());
                    break;
                case "all":
                    Collections.sort(category.getProducts(),new ProductAllComparator());
                    break;
            }
        }

        request.setAttribute("c",category);
        return "category.jsp";
    }

    public String search(HttpServletRequest request,HttpServletResponse response,Page page){
        String keyword=request.getParameter("keyword");
        System.out.println("调用search方法，且关键字keyword："+keyword);
        List<Product> ps=productDAO.search(keyword,0,20);
        productDAO.setSaleAndReviewNumber(ps);
        request.setAttribute("ps",ps);
        return "searchResult.jsp";
    }

    public String buyone(HttpServletRequest request,HttpServletResponse response,Page page){
        int pid=Integer.parseInt(request.getParameter("pid"));
        int num=Integer.parseInt(request.getParameter("num"));
        Product product=productDAO.get(pid);
        int oiid=0;
        boolean found=false;
        User user=(User) request.getSession().getAttribute("user");//通过会话获取用户的信息
        List<OrderItem> orderItems=orderItemDAO.listByUser(user.getId());//通过用户获取该用户名下的所有订单项。
        for(OrderItem orderItem:orderItems){
            if(orderItem.getProduct().getId()==product.getId()){
                orderItem.setNumber(orderItem.getNumber()+num);
                found=true;
                orderItemDAO.update(orderItem);
                oiid=orderItem.getId();
                break;
            }
        }
        if(!found){
            OrderItem oi=new OrderItem();
            oi.setNumber(num);
            oi.setProduct(product);
            oi.setUser(user);
            orderItemDAO.add(oi);
            oiid=oi.getId();
        }
        return "@forebuy?oiid="+oiid;
    }

    public String buy(HttpServletRequest request,HttpServletResponse response,Page page){
        String oiids[]=request.getParameterValues("oiid");//为了满足购物车页面的一次多个订单项的提交.
        List<OrderItem> orderItems=new ArrayList<>();//定义一个订单项集合。
        float total=0;
        for(String oiIdStr:oiids){
            int oiid=Integer.parseInt(oiIdStr);
            OrderItem orderItem=orderItemDAO.get(oiid);//获取该订单项。
            total=orderItem.getProduct().getPromotePrice()*orderItem.getNumber();
            orderItems.add(orderItem);//把该订单项添加到集合中。
        }
        request.getSession().setAttribute("ois",orderItems);
        request.setAttribute("total",total);
        return "buy.jsp";

    }

}
