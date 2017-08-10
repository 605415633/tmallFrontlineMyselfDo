package tmalls.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 中文问题统一交由EncodingFilter处理
 *
 * @author home-pc
 * @create2017 -08 -10 -11:02
 */
public class EncodingFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request=(HttpServletRequest)servletRequest;
        HttpServletResponse response=(HttpServletResponse)servletResponse;
        request.setCharacterEncoding("UTF-8");//把请求信息设置为UTF-8的编码。而这行代码必须放在获取请求参数之前。
        //而拦截器正好体现了这一作用。
        filterChain.doFilter(request,response);
        System.out.println("改变请求内容的编码");
    }

    @Override
    public void destroy() {

    }
}
