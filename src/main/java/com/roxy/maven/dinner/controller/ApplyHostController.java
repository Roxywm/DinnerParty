package com.roxy.maven.dinner.controller;

import com.roxy.maven.dinner.common.Constants;
import com.roxy.maven.dinner.entity.ApplyHost;
import com.roxy.maven.dinner.entity.Area;
import com.roxy.maven.dinner.entity.User;
import com.roxy.maven.dinner.service.ApplyHostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping(value = "/user/applyHost")
public class ApplyHostController {

    @Autowired
    private ApplyHostService applyHostService;

    /**
     * 跳到报名页
     * @return
     */
    @RequestMapping(value = "/createApply", method = RequestMethod.GET)
    public String createApply(){
        return "dinner/applyHost";
    }

    /**
     * 申请报名主持
     * @return
     */
    @RequestMapping(value = "/createApply", method = RequestMethod.POST)
    public String createApply(ApplyHost applyHost, long areaId, long cityId, @RequestParam("file")MultipartFile file, HttpSession session, Map<String, Object> map){
        if(file!=null&&!file.getOriginalFilename().equals("")){
            String suffix = getSuffix(file.getOriginalFilename());
            long fileName = System.currentTimeMillis();
            File oldName = new File(Constants.savePath +fileName+suffix);
            try {
                file.transferTo(oldName);
                applyHost.setPhoto(oldName.getName());
                Area area = new Area();
                if(areaId!=0){
                    area.setId(areaId);
                }else{
                    area.setId(cityId);
                }

                applyHost.setArea(area);
                User loginUser = (User) session.getAttribute("loginUser");
                applyHost.setUser(loginUser);
                int rows = applyHostService.applyHost(applyHost);
                if(rows==0){
                    map.put("error","报名,请重新填写申请表！");
                    return "dinner/applyHost";
                }
            } catch (IOException e) {
                map.put("error","请求错误,请重新填写申请表！");
                e.printStackTrace();
            }
        }
        return "dinner/host_apply_success";
    }

    /**
     * 按文件名获取后缀名的方法
     * @param filename 文件名
     * @return 后缀名
     */
    private String getSuffix(String filename){
        return filename.substring(filename.lastIndexOf("."));
    }

}
