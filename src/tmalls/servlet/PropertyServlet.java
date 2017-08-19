package tmalls.servlet;

import tmalls.bean.Category;
import tmalls.bean.Property;
import tmalls.util.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author home-pc
 * @create2017 -08 -12 -15:03
 */
public class PropertyServlet extends BaseBackServlet{
    @Override
    public String add(HttpServletRequest request, HttpServletResponse response, Page page) {

        int cid=Integer.parseInt(request.getParameter("cid"));
        Category category=categoryDAO.get(cid);
        String name=request.getParameter("name");
        Property property=new Property();
        property.setCategory(category);
        property.setName(name);
        propertyDAO.add(property);
        return "admin_property_list?cid="+cid;
    }

    @Override
    public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
        int id=Integer.parseInt(request.getParameter("id"));
        Property property=propertyDAO.get(id);
        propertyDAO.delete(id);
        return "@admin_property_list?cid="+property.getCategory().getId();
    }

    @Override
    public String update(HttpServletRequest request, HttpServletResponse response, Page page) {

        int cid=Integer.parseInt(request.getParameter("cid"));
        Category category=categoryDAO.get(cid);

        int id=Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        Property property=new Property();
        property.setCategory(category);
        property.setName(name);
        property.setId(id);
        propertyDAO.add(property);
        return "@admin_category_list?cid="+property.getCategory().getId();
    }

    @Override
    public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
        return null;
    }

    @Override
    public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
        return null;
    }
}
