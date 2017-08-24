package tmalls.filter;

import org.apache.commons.lang.StringUtils;
import tmalls.bean.Category;
import tmalls.bean.OrderItem;
import tmalls.bean.User;
import tmalls.dao.CategoryDAO;
import tmalls.dao.OrderItemDAO;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author home-pc
 * @create2017 -08 -24 -9:13
 */
public class ForeServletFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request=(HttpServletRequest)servletRequest;
        HttpServletResponse response=(HttpServletResponse) servletResponse;
        String contextPath=request.getSession().getServletContext().getContextPath();
        /*************************************************************************************/
        System.out.println("request.getServletContext():"+request.getServletContext().toString());
        request.getServletContext().setAttribute("contextPath",contextPath);
        System.out.println("foreServletFilter   contextPath:"+contextPath);
        User user=(User) request.getSession().getAttribute("user");
        int cartTotalItemNumber=0;
        if(user!=null){
            List<OrderItem> orderItems=new OrderItemDAO().listByUser(user.getId());
            for(OrderItem orderItem:orderItems){
                cartTotalItemNumber+=orderItem.getNumber();
            }
        }
        request.setAttribute("cartTotalItemNumber",cartTotalItemNumber);
        List<Category> categories=(List<Category>) request.getAttribute("cs");
        if(categories==null){
            categories=new CategoryDAO().list();
            request.setAttribute("cs",categories);
        }
        /*************************************************************************************/
        String uri=request.getRequestURI();
        uri= StringUtils.remove(uri,contextPath);
        if(uri.startsWith("/fore")&&!uri.startsWith("/foreServlet")){
            String method=StringUtils.substringAfterLast(uri,"/fore");
            request.setAttribute("method",method);
            request.getRequestDispatcher("/foreServlet").forward(request,response);
            return;
        }
            filterChain.doFilter(request,response);


    }

    @Override
    public void destroy() {

    }
}
