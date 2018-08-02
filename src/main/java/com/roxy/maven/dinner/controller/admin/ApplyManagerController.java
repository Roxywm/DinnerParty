package com.roxy.maven.dinner.controller.admin;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.roxy.maven.dinner.entity.ApplyHost;
import com.roxy.maven.dinner.entity.Area;
import com.roxy.maven.dinner.entity.User;
import com.roxy.maven.dinner.service.ApplyHostService;
import com.roxy.maven.dinner.service.AreaService;
import com.roxy.maven.dinner.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/admin/applyHost")
public class ApplyManagerController {

    @Autowired
    private ApplyHostService applyHostService;
    @Autowired
    private AreaService areaService;
    @Autowired
    private UserService userService;

    /**
     * 跳到报名页
     * @return
     */
    @RequestMapping(value = "/applyPage", method = RequestMethod.GET)
    public String applyPage(Map<String, Object> map,
                            @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                            @RequestParam(value="pageSize",defaultValue="5") int pageSize){
        PageHelper.startPage(pageNum, pageSize);//设置分页
        List<ApplyHost> list = applyHostService.findAll();
        for(ApplyHost ah:list){
            Area area = areaService.findById(ah.getArea().getId());
            ah.setArea(area);
        }
        PageInfo<ApplyHost> page = new PageInfo<ApplyHost>(list);
        map.put("page", page);
        return "admin/apply_list";
    }

    @RequestMapping(value = "/updateStatus")
    public String updateStatus(long applyId, User user){
        int rows = applyHostService.updateStatus(applyId);
        user.setHostStatus(1);
        userService.update(user);
        if(rows>0){
            return "ok";
        }
        return "error";
    }


}
