package com.roxy.maven.dinner.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.roxy.maven.dinner.common.Constants;
import com.roxy.maven.dinner.entity.Admin;
import com.roxy.maven.dinner.entity.AdminLog;
import com.roxy.maven.dinner.entity.ApplyHost;
import com.roxy.maven.dinner.entity.Orders;
import com.roxy.maven.dinner.enumeration.LogType;
import com.roxy.maven.dinner.service.AdminLogService;
import com.roxy.maven.dinner.service.DownloadService;
import com.roxy.maven.dinner.service.OrdersService;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin/orders")
public class OrdersManagerController {

    @Autowired
    private OrdersService ordersService;
    @Autowired
    private DownloadService downloadService;
    @Autowired
    private AdminLogService adminLogService;

    @RequestMapping(value = "/")
    public String findAllOrders(Map<String, Object> map,
                                @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                                @RequestParam(value="pageSize",defaultValue="5") int pageSize){
        PageHelper.startPage(pageNum, pageSize);//设置分页
        List<Orders> ordersList = ordersService.findAll();
        PageInfo<Orders> page = new PageInfo<Orders>(ordersList);
        map.put("page", page);
        return "admin/orders_list";
    }

    /**
     * 下载exce文件
     * @param request
     * @param response
     */
    @RequestMapping(value = "/ordersExce", method = RequestMethod.GET)
    public void ordersExce(HttpServletRequest request, HttpServletResponse response, HttpSession session){

        List<Orders> ordersList = ordersService.findAll();
        File file = writerExcelData(ordersList, "订单信息.xls");
        try {
            //保存日志
            Admin admin = (Admin)session.getAttribute("loginAdmin");//当前时间
            Timestamp now = new Timestamp(new Date().getTime());
            AdminLog log = new AdminLog();
            log.setAdmin(admin);
            log.setCreateTime(now);
            log.setType(LogType.CHECK);
            log.setContent("下载订单记录");
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
    public File writerExcelData(List<Orders> list, String fileName){
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
            WritableSheet ws = wwb.createSheet("Orders", 0);

            //设置表头
            Label id= new Label(0, 0, "订单ID");
            ws.addCell(id);
            Label email= new Label(1, 0, "账号");
            ws.addCell(email);
            Label dinnerId= new Label(2, 0, "饭局ID");
            ws.addCell(dinnerId);
            Label titel= new Label(3, 0, "饭局标题");
            ws.addCell(titel);
            Label total= new Label(4, 0, "总价");
            ws.addCell(total);
            Label orderNumber= new Label(5, 0, "订单号");
            ws.addCell(orderNumber);
            Label payTime= new Label(6, 0, "支付时间");
            ws.addCell(payTime);


            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            for (int r = 1; r <= list.size(); r++){
                Label id1= new Label(0, r, list.get(r-1).getId()+"");
                ws.addCell(id1);
                Label email1= new Label(1, r, list.get(r-1).getUser().getEmail());
                ws.addCell(email1);
                Label dinnerId1= new Label(2, r, list.get(r-1).getDinner().getId()+"");
                ws.addCell(dinnerId1);
                Label titel1= new Label(3, r, list.get(r-1).getDinner().getTitel());
                ws.addCell(titel1);
                Label total1= new Label(4, r, list.get(r-1).getTotal()+"");
                ws.addCell(total1);
                Label orderNumber1= new Label(5, r, list.get(r-1).getOutTradeNo());
                ws.addCell(orderNumber1);
                Label payTime1= new Label(6, r, format.format(list.get(r-1).getCreateTime()));
                ws.addCell(payTime1);
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
