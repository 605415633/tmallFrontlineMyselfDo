package tmalls.servlet;

import tmalls.bean.Category;
import tmalls.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author home-pc
 * @create2017 -08 -07 -9:36
 */
public class CategoryServlet extends BaseBackServlet {

    @Override
    public String add(HttpServletRequest request, HttpServletResponse response, Page page) {

        return null;
    }

    @Override
    public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
        return null;
    }

    @Override
    public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
        return null;
    }

    @Override
    public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
        return null;
    }

    @Override
    public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
        List<Category> cs=categoryDAO.list(page.getStart(),page.getCount());
        System.out.println("start:*************"+page.getStart());//0
        System.out.println("count:*************"+page.getCount());//5

        int total=categoryDAO.getTotal();
        page.setTotal(total);
        request.setAttribute("thecs",cs);
        request.setAttribute("page",page);
        return "admin/listCategory.jsp";
    }
}
