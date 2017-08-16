package tmalls.filter;

import org.apache.commons.lang.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author home-pc
 * @create2017 -08 -16 -15:18
 */
public class BackServletFilters implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request=(HttpServletRequest)servletRequest;
        HttpServletResponse response=(HttpServletResponse)servletResponse;
        String contextPath=request.getServletContext().getContextPath();
        System.out.println("context path :/    :"+contextPath);
        String uri=request.getRequestURI();
        System.out.println("rui:"+uri);
        uri= StringUtils.remove(uri,contextPath);

        if(uri.startsWith("/admin_")){
            String servletPath=StringUtils.substringBetween(uri,"_","_")+"Servlet";
            String method=StringUtils.substringAfterLast(uri,"_");
            request.setAttribute("method",method);
            request.getRequestDispatcher("/"+servletPath).forward(request,response);
            return;
        }

        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {

    }
}
