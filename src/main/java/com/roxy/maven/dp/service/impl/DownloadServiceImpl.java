package com.roxy.maven.dp.service.impl;

import com.roxy.maven.dp.service.IDownloadService;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

@Service
public class DownloadServiceImpl implements IDownloadService {

//    @Cacheable(value = "userExce")
    @Override
    public void downloadSolve(HttpServletRequest request, HttpServletResponse response, String fileName) throws IOException {

        //文件所在目录路径
        String filePath = "E:\\Intellij\\server\\download\\";
        //获取文件名
//        String fileName = request.getParameter("fileName");
        //得到该文件
        File file = new File(filePath+fileName);
        if(!file.exists()){
            System.out.println("Have no such file!");
            return;//文件不存在就退出方法
        }

        FileInputStream fileInputStream = new FileInputStream(file);
        //设置Http响应头告诉浏览器下载这个附件
        response.setHeader("Content-Disposition", "attachment;Filename=" + URLEncoder.encode(fileName, "UTF-8"));
        OutputStream outputStream = response.getOutputStream();
        byte[] bytes = new byte[2048];
        int len = 0;
        while ((len = fileInputStream.read(bytes))>0){
            outputStream.write(bytes,0,len);
        }
        fileInputStream.close();
        outputStream.close();
    }

}
