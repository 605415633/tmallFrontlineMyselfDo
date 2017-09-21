package tmalls.filter;

import org.apache.commons.lang.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 1：首先我们需要在web.xml配置文件中，让所有的请求都会经过BackServletFilter
 *
 * @author home-pc
 * @create2017 -08 -06 -10:36
 */
public class BackServletFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request=(HttpServletRequest)servletRequest;
        HttpServletResponse response=(HttpServletResponse)servletResponse;
        String contextPath=request.getServletContext().getContextPath();//contextPath为空（上下文路径）
        String uri= request.getRequestURI();//如果请求的全名为http://localhost:8080/qwewqeq,则uri为 /qwewqeq。
        uri= StringUtils.remove(uri,contextPath);
        if(uri.startsWith("/admin_")){
            String servletPath=StringUtils.substringBetween(uri,"_","_")+"Servlet";//该方法用于提取"_"和"_"之间的字符串。
            String method= StringUtils.substringAfterLast(uri,"_");//该方法用于提取字符串中"_"之后的字符串。
            request.setAttribute("method",method);
            servletRequest.getRequestDispatcher("/"+servletPath).forward(request,response);//服务器端跳转
            //服务器端的跳转在页面的路径上不显示
            System.out.println("出了BackServletFilter拦截器，是从admin_category_list出来的");
            return ;
        }
        System.out.println("没有进入后台");
        filterChain.doFilter(request,response);
    }

    @Override
        public void destroy() {
    }
}
