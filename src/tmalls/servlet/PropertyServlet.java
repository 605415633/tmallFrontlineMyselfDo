package tmalls.servlet;

import tmalls.bean.Category;
import tmalls.bean.Property;
import tmalls.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author home-pc
 * @create2017 -08 -12 -15:03
 */
public class PropertyServlet extends BaseBackServlet{
    @Override
    public String add(HttpServletRequest request, HttpServletResponse response, Page page) {
        int cid=Integer.parseInt(request.getParameter("cid"));
        Category category=categoryDAO.get(cid);
        Property property=new Property();
        property.setCategory(category);
        String name=request.getParameter("name");
        property.setName(name);
        propertyDAO.add(property);
        return "@admin_category_list?cid="+cid;
    }

    @Override
    public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
        int id=Integer.parseInt(request.getParameter("id"));
        Property property=propertyDAO.get(id);
        propertyDAO.delete(id);
        return "admin_category_list?cid="+property.getCategory().getId();
    }

    @Override
    public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
        int id=Integer.parseInt(request.getParameter("id"));
        Property property=new Property();
        int cid=Integer.parseInt(request.getParameter("cid"));
        Category category=categoryDAO.get(cid);
        String name=request.getParameter("name");
        property.setName(name);
        property.setCategory(category);
        property.setId(id);
        propertyDAO.update(property);
        return "@admin_property_list?cid="+property.getCategory().getId();
    }

    /**
     * 整个系统的edit都是用于客户端跳转到相应的编辑页面，然后利用编辑页面进行新内容的
     * 填充，然后把新内容提交到了相应Servlet的update()方法进行更新。更新完后，再跳转到最终的展示页面。
     * @param request
     * @param response
     * @param page
     * @return
     */
    @Override
    public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
        int id=Integer.parseInt(request.getParameter("id"));
        Property property=propertyDAO.get(id);
        request.setAttribute("p",property);
        return "admin/editProperty.jsp";

    }

    @Override
    public String list(HttpServletRequest request, HttpServletResponse response, Page page) {

        int cid=Integer.parseInt(request.getParameter("cid"));
        Category category=categoryDAO.get(cid);
        List<Property> properties=propertyDAO.list(cid,page.getStart(),page.getCount());
        int total=propertyDAO.getTotal(cid);
        page.setTotal(total);
        page.setParam("&cid="+category.getId());//因为属性分页都是基于当前分类下的分页，所以分页的时候需要传递这个值。
        request.setAttribute("ps",properties);
        request.setAttribute("c",category);
        request.setAttribute("page",page);
        return "admin/listProperty.jsp";

    }
}
