package tmalls.servlet;

import tmalls.bean.Product;
import tmalls.bean.ProductImage;
import tmalls.dao.ProductImageDAO;
import tmalls.util.ImageUtil;
import tmalls.util.Page;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


/**
 * @author home-pc
 * @create2017 -08 -20 -15:55
 */
public class ProductImageServlet extends BaseBackServlet {

    @Override
    public String add(HttpServletRequest request, HttpServletResponse response, Page page) {
        InputStream inputStream=null;
        Map<String ,String> params=new HashMap<>();
        inputStream=parseUpload(request,params);
        ProductImage productImage=new ProductImage();
        int pid=Integer.parseInt(params.get("pid"));
        Product product=productDAO.get(pid);
        productImage.setProduct(product);
        String type=params.get("type");
        productImage.setType(type);
        productImageDAO.add(productImage);

        String fileName=productImage.getId()+".jpg";
        System.out.println("产品图片ID:"+productImage.getId());
        String imageFolder;
        String smallFolder=null;
        String middleFolder=null;

        if(ProductImageDAO.type_single.equals(productImage.getType())){
            imageFolder=request.getSession().getServletContext().getRealPath("img/productSingle");
            smallFolder=request.getSession().getServletContext().getRealPath("img/productSingle_small");
            middleFolder=request.getSession().getServletContext().getRealPath("img/productSingle_middle");
            System.out.println("smallFolder:"+smallFolder);
            System.out.println("middleFolder:"+middleFolder);
        }else
            imageFolder=request.getSession().getServletContext().getRealPath("img/productDetail");
        File file=new File(imageFolder,fileName);
        file.getParentFile().mkdirs();

        //复制文件
        try {
            if(inputStream!=null&&inputStream.available()!=0){
                try(FileOutputStream fileOutputStream=new FileOutputStream(file)){
                    byte [] bytes=new byte[1024*1024];
                    int length=0;
                    while ((length=inputStream.read(bytes))!=-1){
                        fileOutputStream.write(bytes,0,length);
                    }
                    fileOutputStream.flush();
                    BufferedImage bufferedImage=ImageUtil.change2jpg(file);
                    ImageIO.write(bufferedImage,"jpg",file);

                    if(ProductImageDAO.type_single.equals(productImage.getType())){

                        System.out.println("进入了创建small middle目录了");
                        File fileSmall=new File(smallFolder,fileName);
                        File fileMiddle=new File(middleFolder,fileName);
                        ImageUtil.resizeImage(file,56,56,fileSmall);
                        ImageUtil.resizeImage(file,217,190,fileMiddle);
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "@admin_productImage_list?pid="+product.getId();

    }

    /**
     * 在我们在数据库中删除了相应的文件时，我们也需要删除文件夹中相应的文件
     * @param request
     * @param response
     * @param page
     * @return
     */
    @Override
    public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {

        int id=Integer.parseInt(request.getParameter("id"));
        ProductImage productImage=productImageDAO.get(id);
        productImageDAO.delete(id);
        if(productImage.getType().equals(ProductImageDAO.type_single)){
            String imageFolder_single=request.getSession().getServletContext().getRealPath("img/productSingle");
            String imageFolder_small=request.getSession().getServletContext().getRealPath("img/productSingle_small");
            String imageFolder_middle=request.getSession().getServletContext().getRealPath("img/productSingle_middle");

            File single_file=new File(imageFolder_single,productImage.getId()+".jpg");
            single_file.delete();
            File small_file=new File(imageFolder_small,productImage.getId()+".jpg");
            small_file.delete();
            File middle_file=new File(imageFolder_middle,productImage.getId()+".jpg");
            middle_file.delete();
        }
        else
        {
            String imageFolder_detail=request.getSession().getServletContext().getRealPath("img/imgDetail");
            File detailFile=new File(imageFolder_detail,productImage.getId()+".jpg");
            detailFile.delete();
        }


        return "@admin_productImage_list?pid="+productImage.getProduct().getId();
    }

    @Override
    public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
        return null;
    }

    @Override
    public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
        return null;
    }

    @Override
    public String list(HttpServletRequest request, HttpServletResponse response, Page page) {

        int pid=Integer.parseInt(request.getParameter("pid"));
        Product product=productDAO.get(pid);
        System.out.println("pid:"+pid);

        List<ProductImage> pisSingle=productImageDAO.list(product,ProductImageDAO.type_single);
        List<ProductImage> pisDetail=productImageDAO.list(product,ProductImageDAO.type_detail);
        request.setAttribute("p",product);
        Iterator iterator=pisSingle.iterator();
        while (iterator.hasNext()){
            ProductImage productImage= (ProductImage) iterator.next();
            System.out.println("List中的productImage的id"+productImage.getId());

        }
        request.setAttribute("pisSingle",pisSingle);
        request.setAttribute("pisDetail",pisDetail);
        return "admin/listProductImage.jsp";
    }
}
