package com.roxy.maven.dinner.controller;

import com.roxy.maven.dinner.entity.Area;
import com.roxy.maven.dinner.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/area")
public class AreaController {

    @Autowired
    private AreaService areaService;

    @ResponseBody
    @RequestMapping("/getCitys")
    public List<Area> getCitys(Long provinceId){
        List<Area> areaList = areaService.findByParentId(provinceId);
        return areaList;
    }

}
