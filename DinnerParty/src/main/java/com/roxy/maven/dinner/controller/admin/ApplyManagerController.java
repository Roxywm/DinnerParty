package com.roxy.maven.dinner.controller.admin;

import com.roxy.maven.dinner.service.ApplyHostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin/applyHost")
public class ApplyManagerController {

    @Autowired
    private ApplyHostService applyHostService;

    /**
     * 跳到报名页
     * @return
     */
    @RequestMapping(value = "/apply_host", method = RequestMethod.GET)
    public String createApply(){
        return "/admin/apply_host";
    }


}
