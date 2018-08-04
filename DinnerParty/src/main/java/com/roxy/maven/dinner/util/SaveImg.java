package com.roxy.maven.dinner.util;

import com.roxy.maven.dinner.common.Constants;
import com.roxy.maven.dinner.entity.Photo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.*;

public class SaveImg {

    /**
     * 获取商品的照片集合
     * @param files
     * @return
     * @throws IOException
     * @throws ServletException
     */
    public static List<Photo> getFiles(MultipartFile[] files) throws IOException, ServletException {
        List<Photo> photos = new ArrayList<Photo>();
        if(files!=null && files.length>0){
            //循环获取file数组中得文件
            for(int i = 0;i<files.length;i++){
                MultipartFile file = files[i];
                try {
                    //文件后缀名
                    String suffix = getSuffix(file.getOriginalFilename());
                    long fileName = System.currentTimeMillis();
                    String filePath =Constants.savePath+ fileName+suffix;
                    // 转存文件
                    file.transferTo(new File(filePath));

                    photos.add(new Photo(null, fileName+suffix,new Timestamp(new Date().getTime())));

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return photos;
    }


    /**
     * 保存商品缩略图的方法
     * @param part
     * @return
     */
    public static String saveSpThumbnail(Part part){
        try {
            String suffix = getSuffixName(part.getHeader("content-disposition"));//获取上传文件的原文件后缀
            if(suffix==null){
                return null;
            }
            String newFilename = System.currentTimeMillis()+suffix;//新文件名
            part.write(Constants.savePath+newFilename);//把文件写到指定路径
            return newFilename;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 保存用户头像的方法
     * @param part
     * @return
     */
    public static String saveThumbnail(Part part){
        try {
            String suffix = getSuffixName(part.getHeader("content-disposition"));//获取上传文件的原文件后缀
            if(suffix==null){
                return null;
            }
            String newFilename = System.currentTimeMillis()+suffix;//新文件名
            part.write(Constants.userIcon+newFilename);//把文件写到指定路径
            return newFilename;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 从请求头获取上传文件的原文件名的后缀名
     * @param header 请求头
     * @return
     */
    public static String getSuffixName(String header) {
        String[] tempArr1 = header.split(";");
        String[] tempArr2 = tempArr1[2].split("=");
        //获取文件名，兼容各种浏览器的写法
        String fileName = tempArr2[1].substring(tempArr2[1].lastIndexOf("\\")+1).replaceAll("\"", "");
        if(fileName.equals(""))
            return null;
        String suffix = fileName.substring(fileName.indexOf("."));
        return suffix;
    }

    /**
     * 按文件名获取后缀名的方法
     * @param filename 文件名
     * @return 后缀名
     */
    private static String getSuffix(String filename){
        return filename.substring(filename.lastIndexOf("."));
    }
}
