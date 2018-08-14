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
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
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
     * 跳到查看报名页
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

    /**
     * 通过审核
     * @param applyId
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/updateStatus")
    public Map<String, Object> updateStatus(long applyId, User user){
        int rows = applyHostService.updateStatus(applyId);
        user.setHostStatus(1);
        userService.update(user);
        Map<String, Object> map = new HashMap<String,Object>();
        if(rows>0){
            map.put("ok",true);
        }else{
            map.put("ok", false);
            map.put("error", "审核失败！");
        }
        return map;
    }


}
