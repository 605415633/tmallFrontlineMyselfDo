package tmalls.servlet;

import tmalls.bean.Category;
import tmalls.util.ImageUtil;
import tmalls.util.Page;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author home-pc
 * @create2017 -08 -07 -9:36
 */
public class CategoryServlet extends BaseBackServlet {


    @Override
    public String add(HttpServletRequest request, HttpServletResponse response, Page page) {
        Map<String,String> params=new HashMap<>();
        InputStream is=super.parseUpload(request,params);

        String name=params.get("name");
        Category c=new Category();
        c.setName(name);
        categoryDAO.add(c);

        File imageFloder=new File(request.getSession().getServletContext().getRealPath("img/categoryProductImgTitle"));
        System.out.println("ADD   request.getSession().getServletContext()"+request.getSession().getServletContext());
        System.out.println("ADD  imageFloder:是"+request.getSession().getServletContext().getRealPath("img/categoryProductImgTitle"));

        File file=new File(imageFloder,c.getId()+".jpg");

        try{
            if(is!=null&&is.available()!=0){//当流为0的时候，不会阻塞
                try(FileOutputStream fileOutputStream=new FileOutputStream(file)){
                    byte b[]=new byte[1024*1024];
                    int length=0;
                    while ((length=is.read(b))!=-1){
                        fileOutputStream.write(b,0,length);
                    }
                    fileOutputStream.flush();
                    //通过如下代码，把文件保存为jpg格式。
                    BufferedImage img= ImageUtil.change2jpg(file);
                    ImageIO.write(img,"jpg",file);
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }catch (IOException e){
            e.printStackTrace();
        }
        return "@admin_category_list";
    }

    @Override
    public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {

        int id=Integer.parseInt(request.getParameter("id"));
        categoryDAO.delete(id);
        return "@admin_category_list";
    }


    @Override
    public String update(HttpServletRequest request, HttpServletResponse response, Page page) {

        Map<String,String> params=new HashMap<>();
        InputStream is=super.parseUpload(request,params);

        System.out.println(params);
        String name=params.get("name");
        int id=Integer.parseInt(params.get("id"));

        Category category=new Category();
        category.setId(id);
        category.setName(name);
        categoryDAO.add(category);


        File imageFolder=new File(request.getSession().getServletContext().getRealPath("img/categoryProductImgTitle"));
        System.out.println("UPDATE   request.getSession().getServletContext()"+request.getSession().getServletContext());
        System.out.println("UPDATE     imageFloder:是"+request.getSession().getServletContext().getRealPath("img/categoryProductImgTitle"));
        File file=new File(imageFolder, category.getId()+"jpg");
        file.getParentFile().mkdirs();
        try {
            if(is!=null&&is.available()!=0){
                try(FileOutputStream fileOutputStream=new FileOutputStream(file)){
                    byte b []=new byte[1024*1024];
                    int length=0;
                    while ((length=is.read(b))!=-1){
                        fileOutputStream.write(b,0,length);
                    }
                    fileOutputStream.flush();
                    BufferedImage bufferedImage=ImageUtil.change2jpg(file);
                    ImageIO.write(bufferedImage,"jpg",file);
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "@admin_category_list";
    }

    @Override
    public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {

        int id=Integer.parseInt(request.getParameter("id"));
        Category category=categoryDAO.get(id);
        return "admin/editCategory.jsp";
    }

    @Override
    public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
        System.out.println("后执行了CategoryServlet.java中的list方法");
        List<Category> cs=categoryDAO.list(page.getStart(),page.getCount());
        System.out.println("start:*************"+page.getStart());//0
        System.out.println("count:*************"+page.getCount());//5

        int total=categoryDAO.getTotal();//求出中类的总数。
        page.setTotal(total);//设置要显示的总的种类数
        request.setAttribute("thecs",cs);//创建了显示5类商品的list。
        request.setAttribute("page",page);
        System.out.println("执行完了CategoryServlet。");
        return "admin/listCategory.jsp";
    }
}
