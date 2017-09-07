package tmalls.servlet;

import org.springframework.web.util.HtmlUtils;
import tmalls.bean.Category;
import tmalls.bean.User;
import tmalls.dao.CategoryDAO;
import tmalls.dao.ProductDAO;
import tmalls.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

}
