package tmalls.servlet;

import tmalls.bean.Category;
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
}
