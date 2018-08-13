package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.common.Constants;
import com.roxy.maven.dinner.service.DownloadService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

@Transactional
@Service
public class DownloadServiceImpl implements DownloadService {

//    @Cacheable(value = "userExce")
    @Override
    public void downloadSolve(HttpServletRequest request, HttpServletResponse response, File file) throws IOException {

        if(!file.exists()){
            System.out.println("Have no such file!");
            return;//文件不存在就退出方法
        }

        FileInputStream fileInputStream = new FileInputStream(file);
        //设置Http响应头告诉浏览器下载这个附件
        response.setHeader("Content-Disposition", "attachment;Filename=" + URLEncoder.encode(file.getName(), "UTF-8"));
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
