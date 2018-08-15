package com.roxy.maven.dinner.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.roxy.maven.dinner.common.Constants;
import com.roxy.maven.dinner.entity.Admin;
import com.roxy.maven.dinner.entity.AdminLog;
import com.roxy.maven.dinner.entity.Orders;
import com.roxy.maven.dinner.entity.User;
import com.roxy.maven.dinner.enumeration.LogType;
import com.roxy.maven.dinner.service.AdminLogService;
import com.roxy.maven.dinner.service.DownloadService;
import com.roxy.maven.dinner.service.UserService;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin/user")
public class UserManagerController {

    @Autowired
    private UserService userService;
    @Autowired
    private DownloadService downloadService;
    @Autowired
    private AdminLogService adminLogService;


    @RequestMapping(value = "/")
    public String findAllUser(Map<String, Object> map,
                              @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                              @RequestParam(value="pageSize",defaultValue="5") int pageSize){
        PageHelper.startPage(pageNum, pageSize);//设置分页
        List<User> userList = userService.findAll();
        PageInfo<User> page = new PageInfo<User>(userList);

        map.put("page",page);
        return "admin/user_list";
    }


    /**
     * 下载exce文件
     * @param request
     * @param response
     */
    @RequestMapping(value = "/userExce", method = RequestMethod.GET)
    public void ordersExce(HttpServletRequest request, HttpServletResponse response, HttpSession session){

        List<User> userList = userService.findAll();
        File file = writerExcelData(userList, "用户信息.xls");
        try {
            //保存日志
            Admin admin = (Admin)session.getAttribute("loginAdmin");//当前时间
            Timestamp now = new Timestamp(new Date().getTime());
            AdminLog log = new AdminLog();
            log.setAdmin(admin);
            log.setCreateTime(now);
            log.setType(LogType.CHECK);
            log.setContent("下载用户信息");
            adminLogService.create(log);
            downloadService.downloadSolve(request, response, file);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 保存到本地
     * @param list
     * @param fileName
     * @return
     */
    public File writerExcelData(List<User> list, String fileName){
        File file = null;
        try {
            WritableWorkbook wwb = null;
            // 创建可写入的Excel工作簿
            file=new File(Constants.saveExcel+fileName);
            if (!file.exists()) {
                file.createNewFile();
            }
            //以fileName为文件名来创建一个Workbook
            wwb = Workbook.createWorkbook(file);
            WritableSheet ws = wwb.createSheet("Users", 0);

            //设置表头
            Label id= new Label(0, 0, "ID");
            ws.addCell(id);
            Label email= new Label(1, 0, "账号");
            ws.addCell(email);
            Label nickname= new Label(2, 0, "昵称");
            ws.addCell(nickname);
            Label sex= new Label(3, 0, "性别");
            ws.addCell(sex);
            Label mobile= new Label(4, 0, "手机号");
            ws.addCell(mobile);
            Label job= new Label(5, 0, "工作");
            ws.addCell(job);

            for (int r = 1; r <= list.size(); r++){

                Label id2= new Label(0, r, list.get(r-1).getId()+"");
                ws.addCell(id2);
                Label email2= new Label(1, r, list.get(r-1).getEmail());
                ws.addCell(email2);
                Label nickname2= new Label(2, r, list.get(r-1).getNickname());
                ws.addCell(nickname2);
                Label sex2= new Label(3, r, list.get(r-1).getSex());
                ws.addCell(sex2);
                Label mobile2= new Label(4, r, list.get(r-1).getMobile());
                ws.addCell(mobile2);
                Label job2= new Label(5, r, list.get(r-1).getJob());
                ws.addCell(job2);
            }

            //写进文档
            wwb.write();
            // 关闭Excel工作簿对象
            wwb.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return file;
    }


}
