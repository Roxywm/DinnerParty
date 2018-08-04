package com.roxy.maven.dinner.util;

import com.roxy.maven.dinner.common.Constants;
import com.roxy.maven.dinner.entity.Photo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.*;

public class SaveImg {

    /**
     * 获取商品的照片集合
     * @param request
     * @return
     * @throws IOException
     * @throws ServletException
     */
    public static List<Photo> getFiles(HttpServletRequest request) throws IOException, ServletException {
        //新建图片集合对象
        List<Photo> photos = new ArrayList<Photo>();
        //获取上传的文件集合
        Collection<Part> parts = request.getParts();
        for (Part p : parts) {//循环处理上传的文件
            //判断p的名称是上传域的名称，=才进行写文件的操作
            if(p.getName().equals("files")){
                String suffix = getSuffixName(p.getHeader("content-disposition"));//获取文件后缀名
                try {
                    Thread.sleep(5);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                String newFilename = System.currentTimeMillis()+suffix;//新文件名
                p.write(Constants.savePath+newFilename); //把文件写到指定路径
                Photo photo = new Photo();
                photo.setSrc("uploads/"+newFilename);
                photo.setCreateTime(new Timestamp(new Date().getTime()));
                photos.add(photo);
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
}
