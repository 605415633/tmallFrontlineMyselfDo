package tmalls.servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import tmalls.dao.*;
import tmalls.util.Page;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @author home-pc
 * @create2017 -08 -06 -11:26
 */
public abstract class BaseBackServlet extends HttpServlet{

    public abstract String add(HttpServletRequest request, HttpServletResponse response, Page page);
    public abstract String delete(HttpServletRequest request,HttpServletResponse response, Page page);
    public abstract String update(HttpServletRequest request,HttpServletResponse response, Page page);
    public abstract String edit(HttpServletRequest request,HttpServletResponse response, Page page);
    public abstract String list(HttpServletRequest request,HttpServletResponse response, Page page);

    protected CategoryDAO categoryDAO=new CategoryDAO();
    protected OrderDAO orderDAO=new OrderDAO();
    protected OrderItemDAO orderItemDAO=new OrderItemDAO();
    protected ProductDAO productDAO=new ProductDAO();
    protected ProductImageDAO productImageDAO=new ProductImageDAO();
    protected PropertyDAO propertyDAO=new PropertyDAO();
    protected PropertyValueDAO propertyValueDAO=new PropertyValueDAO();
    protected ReviewDAO reviewDAO=new ReviewDAO();
    protected UserDAO userDAO=new UserDAO();

    @Override
    public void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        try{
            System.out.println("先进入了BaseBackServlet。");
            int start=0;
            int count=5;
            try {
                start=Integer.parseInt(req.getParameter("page.start"));
            }catch (Exception e){
            }

            try {
                count=Integer.parseInt(req.getParameter("page.count"));
            }catch (Exception e){
            }
            //***********************************
            Page page=new Page(start,count);
            String method=(String) req.getAttribute("method");
            System.out.println("method:"+method);
            /*根据方法的返回值，进行相应的客户端跳转，服务端跳转，或者仅仅输出字符串*/
            System.out.println("this代表的对象的名字"+this.getClass().getName());
            Method m=this.getClass().getMethod(method,//this代表class tmalls.servlet.CategoryServlet
                    //name代表方法的名称，后面的几个参数为参数列表
                    //该方法返回与指定的name和parameterTypes（后面的参数）匹配的Method对象。
                    javax.servlet.http.HttpServletRequest.class,
                    javax.servlet.http.HttpServletResponse.class,Page.class);
            System.out.println("没求redirect的值");
            String redirect=m.invoke(this,req,resp,page).toString();//此方法返回值为m形
            // 成的方法所返回的值。调用此方法后，实际上是调用CategoryServlet的list方法，并把返回值赋值为redirect。
            System.out.println("执行完了invoke()方法");
            System.out.println("redirect为"+redirect);
            if(redirect.startsWith("@"))
                resp.sendRedirect(redirect.substring(1));//substring(1)是取出字符串中从第二个到最后。
            else if(redirect.startsWith("%"))
                resp.getWriter().print(redirect.substring(1));
            else
                req.getRequestDispatcher(redirect).forward(req,resp);
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public InputStream parseUpload(HttpServletRequest request, Map<String,String> params){
        InputStream is=null;
        try{
            DiskFileItemFactory factory=new DiskFileItemFactory();
            ServletFileUpload upload=new ServletFileUpload(factory);
            //设置文件上传的大小限制为10M。
            factory.setSizeThreshold(1024*10240);//设置入口大小

            List items=upload.parseRequest(request);//通过解析请求得到所有的文件项目
            Iterator iter=items.iterator();
            while (iter.hasNext()){
                FileItem item=(FileItem) iter.next();
                if (!item.isFormField()) {//item.isFormFiled()用来判断是常规的字段还是文件，如果是true的话表示是常规字段。
                    //item.getInputStream()获取上传文件的输入流
                    is=item.getInputStream();
                }else {
                    String paramName=item.getFieldName();
                    String paramValue=item.getString();
                    paramValue=new String(paramValue.getBytes("ISO-8859-1"),"UTF-8");
                    params.put(paramName,paramValue);
                }
                }
            }catch (Exception e){
            e.printStackTrace();
        }
        return is;
        }
    }


