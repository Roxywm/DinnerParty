package com.roxy.maven.dinner.controller;

import com.roxy.maven.dinner.entity.ApplyHost;
import com.roxy.maven.dinner.service.DinnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/user/dinner")
public class DinnerController {

    @Autowired
    private DinnerService dinnerService;

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(){
        return "/user/release";
    }
    @RequestMapping(value = "/applyHost", method = RequestMethod.GET)
    public String applyHost(){
        return "/user/applyHost";
    }


    /**
     * 报名主持
     * @return
     */
    @RequestMapping(value = "/applyHost", method = RequestMethod.POST)
    public String applyHost(ApplyHost applyHost, long city){
        return "/user/applyHost";
    }

}
