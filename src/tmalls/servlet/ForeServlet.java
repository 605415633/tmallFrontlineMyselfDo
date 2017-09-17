package tmalls.servlet;

import org.apache.commons.lang.math.RandomUtils;
import org.springframework.web.util.HtmlUtils;
import tmalls.bean.*;
import tmalls.comparator.*;
import tmalls.dao.CategoryDAO;
import tmalls.dao.OrderDAO;
import tmalls.dao.ProductDAO;
import tmalls.dao.ProductImageDAO;
import tmalls.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
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
        int pid=Integer.parseInt(request.getParameter("pid"));
        Product product=productDAO.get(pid);
        List<ProductImage> productSingleImages=productImageDAO.list(product, ProductImageDAO.type_single);
        List<ProductImage> productDetailImages=productImageDAO.list(product,ProductImageDAO.type_detail);
        product.setProductSingleImages(productSingleImages);
        product.setProductDetailImages(productDetailImages);


        List<PropertyValue> propertyValues=propertyValueDAO.list(product.getId());

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
        User user=(User) request.getSession().getAttribute("user");//通过会话获取用户的信息
        boolean found=false;

        List<OrderItem> orderItems=orderItemDAO.listByUser(user.getId());//通过用户获取该用户名下的所有订单项。
        for(OrderItem orderItem:orderItems){
            if(orderItem.getProduct().getId()==product.getId()){
                orderItem.setNumber(orderItem.getNumber()+num);
                orderItemDAO.update(orderItem);
                found=true;
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
            total+=orderItem.getProduct().getPromotePrice()*orderItem.getNumber();
            orderItems.add(orderItem);//把该订单项添加到集合中。
        }

        request.getSession().setAttribute("ois",orderItems);
        request.setAttribute("total",total);
        return "buy.jsp";

    }

    public String addCart(HttpServletRequest request,HttpServletResponse response,Page page){
        int pid=Integer.parseInt(request.getParameter("pid"));
        int num=Integer.parseInt(request.getParameter("num"));
        Product product=productDAO.get(pid);

        User user=(User) request.getSession().getAttribute("user");

        boolean found=false;
        List<OrderItem> orderItems=orderItemDAO.listByUser(user.getId());//获取该用户其下的所有订单项》
        for(OrderItem orderItem:orderItems){
            if(orderItem.getProduct().getId()==product.getId()){
                orderItem.setNumber(orderItem.getNumber()+num);
                orderItemDAO.update(orderItem);
                found=true;
                break;
            }
        }
        if(!found){
            OrderItem oi=new OrderItem();
            oi.setNumber(num);
            oi.setUser(user);
            oi.setProduct(product);
            orderItemDAO.add(oi);
        }
        return "%success";

    }
    public String cart(HttpServletRequest request,HttpServletResponse response,Page page){
        User user=(User)request.getSession().getAttribute("user");
        List<OrderItem> ois=orderItemDAO.listByUser(user.getId());
        request.setAttribute("ois",ois);
        return "cart.jsp";

    }

    public String changeOrderItem(HttpServletRequest request,HttpServletResponse response,Page page){
        User user=(User)request.getSession().getAttribute("user");
        if(user==null){
            return "%fail";
        }
        int pid=Integer.parseInt(request.getParameter("pid"));
        int number=Integer.parseInt(request.getParameter("number"));
        List<OrderItem> ois=orderItemDAO.listByUser(user.getId());
        for (OrderItem oi:ois){
            if(oi.getProduct().getId()==pid){
                oi.setNumber(number);
                orderItemDAO.update(oi);
                break;
            }
        }
        return "%success";
//        还有另一种方法，在客户端传过来的是oiid,即订单项的id，直接通过oiid查看是否有该同类的订单项，
//       直接进行相关的操作就可以了。
    }

    public String deleteOrderItem(HttpServletRequest request,HttpServletResponse response,Page page){
        User user=(User)request.getSession().getAttribute("user");
        if(user==null){
            return "%fail";
        }
        int oiid= Integer.parseInt(request.getParameter("oiid"));
        orderItemDAO.delete(oiid);
        return "%success";

    }
    public String createOrder(HttpServletRequest request, HttpServletResponse response, Page page){
        User user =(User) request.getSession().getAttribute("user");

        List<OrderItem> ois= (List<OrderItem>) request.getSession().getAttribute("ois");
        if(ois.isEmpty())
            return "@login.jsp";

        String address = request.getParameter("address");
        String post = request.getParameter("post");
        String receiver = request.getParameter("receiver");
        String mobile = request.getParameter("mobile");
        String userMessage = request.getParameter("userMessage");

        Order order = new Order();
        String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date()) +RandomUtils.nextInt(10000);

        order.setOrderCode(orderCode);
        order.setAddress(address);
        order.setPost(post);
        order.setReceiver(receiver);
        order.setMobile(mobile);
        order.setUserMessage(userMessage);
        order.setCreateDate(new Date());
        order.setUser(user);
        order.setStatus(OrderDAO.waitPay);
        orderDAO.add(order);
        float total =0;
        for (OrderItem oi: ois) {

            oi.setOrder(order);
            orderItemDAO.update(oi);
            total+=oi.getProduct().getPromotePrice()*oi.getNumber();
        }
        return "@forealipay?oid="+order.getId() +"&total="+total;
    }
//    public String createOrder(HttpServletRequest request,HttpServletResponse response,Page page){
//        User user=(User)request.getSession().getAttribute("user");
//        System.out.println("进入了createOrder");
//        List<OrderItem> orderItems=(List<OrderItem>)request.getSession().getAttribute("ois");
//        for(OrderItem oi:orderItems){
//            System.out.println("orderItem的id"+oi.getProduct().getName());
//        }
//        //因为在产品页的立即购买和购物车的结算跳转的链接都是buy方法。而在这个方法中设置了
//        //我们要购买的产品的订单项集合。所以在创建订单的时候需要把这些订单项放入相应的订单中。
//        if(orderItems.isEmpty())
//            return "@login.jsp";//进行客户端跳转
//        String address=request.getParameter("address");
//        String post=request.getParameter("post");
//        String receiver=request.getParameter("receiver");
//        String mobile=request.getParameter("mobile");
//        String userMessage=request.getParameter("userMessage");
//        Order order=new Order();
//        String orderCode=new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date())+ RandomUtils.nextInt(10000);
//        //通过把当时的日期+4位随机数生成的订单号合起来连接成字符串然后把它按照日期安排yyyy年MM月dd日，HH时,mm分，ss秒，SSS毫秒。
//        order.setOrderCode(orderCode);
//        order.setAddress(address);
//        order.setPost(post);
//        order.setReceiver(receiver);
//        order.setMobile(mobile);
//        order.setUserMessage(userMessage);//就是给卖家留言
//        order.setCreateDate(new Date());
//        order.setUser(user);
//        System.out.println("user的id："+user.getId());
//        order.setStatus(OrderDAO.waitPay);
//        orderDAO.add(order);
//        float total=0;
//        for(OrderItem orderItem:orderItems){
//            orderItem.setOrder(order);//为每个订单项设置相应的订单。
//            System.out.println("orderItem的名字oid:"+orderItem.getId());
//            orderItemDAO.update(orderItem);
//            total+=orderItem.getProduct().getPromotePrice()*orderItem.getNumber();//求出这个订单的总价格。
//        }
//        return "@forealipay?oid="+order.getId()+"&total="+total;
//    }
    public String alipay(HttpServletRequest request,HttpServletResponse response,Page page){
        return "alipay.jsp";
    }
    public String payed(HttpServletRequest request,HttpServletResponse response,Page page){
        int oid=Integer.parseInt(request.getParameter("oid"));
        Order order=orderDAO.get(oid);
        order.setStatus(OrderDAO.waitDelivery);
        order.setPayDate(new Date());
        new OrderDAO().update(order);
//        orderDAO.update(order);//可以直接使用orderDAO的update。
        request.setAttribute("o",order);
        return "payed.jsp";
    }

    public String bought(HttpServletRequest request,HttpServletResponse response,Page page){
        System.out.println("进入了bought方法");
        User user=(User) request.getSession().getAttribute("user");
        List<Order> orders=orderDAO.list(user.getId(),OrderDAO.delete);//查询user所有状态不是delete的订单集合orders.
        orderItemDAO.fill(orders);
        for(Order order:orders){
            List<OrderItem> orderItems=orderItemDAO.listByOrder(order.getId());
            for(OrderItem orderItem:orderItems){
                System.out.println("orderItem:"+orderItem.getProduct().getName());
            }
        }
        request.setAttribute("os",orders);
        System.out.println("执行完了bought方法");
        return "bought.jsp";
    }

    public String confirmPay(HttpServletRequest request,HttpServletResponse response,Page page){
        int oid=Integer.parseInt(request.getParameter("oid"));
        Order order=orderDAO.get(oid);
        orderItemDAO.fill(order);//给该订单填充订单项
        request.setAttribute("o",order);
        return "confirmPay.jsp";
    }

    public String orderConfirmed(HttpServletRequest request,HttpServletResponse response,Page page){
        int oid=Integer.parseInt(request.getParameter("oid"));
        Order order=orderDAO.get(oid);
        order.setStatus(OrderDAO.waitReview);
        order.setConfirmDate(new Date());
        orderDAO.update(order);
        return "orderConfirmed.jsp";
    }

    public String deleteOrder(HttpServletRequest request,HttpServletResponse response,Page page){
        int oid=Integer.parseInt(request.getParameter("oid"));
        Order order=orderDAO.get(oid);
        order.setStatus(OrderDAO.delete);
        orderDAO.update(order);
        return "%success";
    }

    public String review(HttpServletRequest request,HttpServletResponse response,Page page){
        int oid=Integer.parseInt(request.getParameter("oid"));
        Order order=orderDAO.get(oid);
        orderItemDAO.fill(order);//给订单填充订单项
        Product product=order.getOrderItems().get(0).getProduct();
        List<Review> reviews=reviewDAO.list(product.getId());
        productDAO.setSaleAndReviewNumber(product);//为该产品设置销售和评论数量
        request.setAttribute("p",product);
        request.setAttribute("o",order);
        request.setAttribute("reviews",reviews);
        return "review.jsp";

    }

    public String doreview(HttpServletRequest request,HttpServletResponse response,Page page){

        int oid=Integer.parseInt(request.getParameter("oid"));
        Order order=orderDAO.get(oid);
        order.setStatus(OrderDAO.finish);
        orderDAO.update(order);
        int pid=Integer.parseInt(request.getParameter("pid"));
        Product product=productDAO.get(pid);
        String content=request.getParameter("content");
        content=HtmlUtils.htmlEscape(content);//对评论内容进行转义
        User user=(User)request.getSession().getAttribute("user");
        Review review=new Review();
        review.setContent(content);
        review.setProduct(product);
        review.setUser(user);
        review.setCreateDate(new Date());
        reviewDAO.add(review);
        return "@forereview?oid="+oid+"&showonly=true";

    }


}
