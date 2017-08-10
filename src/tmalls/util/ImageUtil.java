package tmalls.util;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.*;
import java.io.File;

/**
 * @author home-pc
 * @create2017 -08 -10 -10:43
 */
public class ImageUtil {


    /**
     * 确保图片文件的二进制格式jpg。
     * @param f
     * @return
     */
    public static BufferedImage change2jpg(File f){

            try {
                java.awt.Image i = Toolkit.getDefaultToolkit().createImage(f.getAbsolutePath());
                PixelGrabber pg = new PixelGrabber(i, 0, 0, -1, -1, true);
                pg.grabPixels();
                int width = pg.getWidth(), height = pg.getHeight();
                final int[] RGB_MASKS = { 0xFF0000, 0xFF00, 0xFF };
                final ColorModel RGB_OPAQUE = new DirectColorModel(32, RGB_MASKS[0], RGB_MASKS[1], RGB_MASKS[2]);
                DataBuffer buffer = new DataBufferInt((int[]) pg.getPixels(), pg.getWidth() * pg.getHeight());
                WritableRaster raster = Raster.createPackedRaster(buffer, width, height, width, RGB_MASKS, null);
                BufferedImage img = new BufferedImage(RGB_OPAQUE, raster, false, null);
                return img;
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                return null;
            }

        }

    /**
     * 用于改变图片大小，在上传产品图片的时候会用到。
     * @param srcFile
     * @param width
     * @param height
     * @param destFile
     */
        public static void resizeImage(File srcFile,int width,int height,File destFile){
            try {
                Image i= ImageIO.read(srcFile);//图像读取流读取源文件
                i=resizeImage(i,width,height);
                ImageIO.write((RenderedImage) i,"jpg",destFile);
            }catch (Exception e){
                e.printStackTrace();
            }
        }


        public static Image resizeImage(Image srcImage,int width , int height ){
            try {
                BufferedImage bufferedImage=null;
                bufferedImage=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
                bufferedImage.getGraphics().drawImage(srcImage.getScaledInstance(width,height,Image.SCALE_SMOOTH),0,0,null);

                return bufferedImage;
            }catch (Exception e){
                e.printStackTrace();
            }
            return null;
        }


    }

