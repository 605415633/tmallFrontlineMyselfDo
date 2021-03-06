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
public class    EncodingFilter implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request=(HttpServletRequest)servletRequest;
        HttpServletResponse response=(HttpServletResponse)servletResponse;
        System.out.println("先进入了EncodingFilter拦截器！");
        request.setCharacterEncoding("UTF-8");//把请求信息设置为UTF-8的编码。而这行代码必须放在获取请求参数之前。
        //而拦截器正好体现了这一作用。
        System.out.println("把请求设置了UTF-8编码：EncodingFilter拦截器结束！");
        filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
