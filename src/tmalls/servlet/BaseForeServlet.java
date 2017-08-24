package tmalls.servlet;

import tmalls.dao.*;
import tmalls.util.Page;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * @author home-pc
 * @create2017 -08 -24 -9:35
 */
public class BaseForeServlet extends HttpServlet {
    protected CategoryDAO categoryDAO=new CategoryDAO();
    protected PropertyDAO propertyDAO=new PropertyDAO();
    protected PropertyValueDAO propertyValueDAO=new PropertyValueDAO();
    protected ProductDAO productDAO=new ProductDAO();
    protected ProductImageDAO productImageDAO=new ProductImageDAO();
    protected ReviewDAO reviewDAO=new ReviewDAO();
    protected UserDAO userDAO=new UserDAO();
    protected OrderDAO orderDAO=new OrderDAO();
    protected OrderItemDAO orderItemDAO=new OrderItemDAO();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int start=0;
            int count=10;
            try {
                start=Integer.parseInt(req.getParameter("page.start"));
            }catch (Exception e){

            }

            try {
                count=Integer.parseInt(req.getParameter("page.count"));
            }catch (Exception e){

            }
            Page page=new Page(start,count);
            String methodName=(String) req.getAttribute("method");
            Method method=this.getClass().getMethod(methodName,javax.servlet.http.HttpServletRequest.class,
                    javax.servlet.http.HttpServletResponse.class,Page.class);
            String redirect=method.invoke(this,req,resp,page).toString();
            if(redirect.startsWith("@")){
                resp.sendRedirect(redirect.substring(1));
            }
            else if(redirect.startsWith("%")){
                resp.getWriter().print(redirect.substring(1));
            }else {
                req.getRequestDispatcher(redirect).forward(req,resp);
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
