package com.roxy.maven.dinner.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.roxy.maven.dinner.entity.*;
import com.roxy.maven.dinner.service.ApplyPartyService;
import com.roxy.maven.dinner.service.ConcernService;
import com.roxy.maven.dinner.service.DinnerService;
import com.roxy.maven.dinner.service.UserMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/me")
public class MeController {

    @Autowired
    private DinnerService dinnerService;
    @Autowired
    private ApplyPartyService applyPartyService;
    @Autowired
    private ConcernService concernService;
    @Autowired
    private UserMsgService userMsgService;

    /**
     * 跳到个人首页
     * @return
     */
    @RequestMapping(value = "/meHome",method = RequestMethod.GET)
    public String home(Map<String, Object> map, HttpSession session,
                       @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                       @RequestParam(value="pageSize",defaultValue="5") int pageSize){
        User user = (User) session.getAttribute("loginUser");

        PageHelper.startPage(pageNum, pageSize);//设置分页
        //找出自己参加的饭局活动
        List<ApplyParty> list = applyPartyService.findByUserId(user.getId());
        for(ApplyParty applyParty:list){
            Dinner dinner = dinnerService.findByDinnerId(applyParty.getDinner().getId());
            applyParty.setDinner(dinner);
        }

        PageInfo<ApplyParty> page = new PageInfo<ApplyParty>(list);
        map.put("page", page);
        map.put("newDate", new Timestamp(new Date().getTime()));
        return "me/me_home";
    }


    /**
     * 跳到自己的饭局
     * @return
     */
    @RequestMapping(value = "/meDinner", method = RequestMethod.GET)
    public String meDinner(HttpSession session, Map<String, Object> map,
                           @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                           @RequestParam(value="pageSize",defaultValue="5") int pageSize){
        User user = (User) session.getAttribute("loginUser");
        PageHelper.startPage(pageNum, pageSize);//设置分页
        //找出自己主持的饭局活动
        List<Dinner> list = dinnerService.findByUserId(user.getId());
        PageInfo<Dinner> page = new PageInfo<Dinner>(list);
        map.put("page", page);
        map.put("newDate", new Timestamp(new Date().getTime()));
        return "me/me_dinner";
    }

    /**
     * 跳到我的关注页面
     * @return
     */
    @RequestMapping(value = "/meFollow", method = RequestMethod.GET)
    public String meFollow(HttpSession session, Map<String, Object> map,
                           @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                           @RequestParam(value="pageSize",defaultValue="10") int pageSize){
        User loginUser = (User)session.getAttribute("loginUser");
        PageHelper.startPage(pageNum, pageSize);//设置分页
        List<Concern> concernList = concernService.findAllConcern(loginUser.getId());
        PageInfo<Concern> page = new PageInfo<Concern>(concernList);
        map.put("page", page);
        return "me/me_follow";
    }

    /**
     * 跳到对我的留言页面
     * @return
     */
    @RequestMapping(value = "/meMessage", method = RequestMethod.GET)
    public String meMessage(HttpSession session, Map<String, Object> map,
                            @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                            @RequestParam(value="pageSize",defaultValue="10") int pageSize){

        User loginUser = (User)session.getAttribute("loginUser");
        PageHelper.startPage(pageNum, pageSize);//设置分页
        List<UserMsg> userMsgList = userMsgService.findByUserId(loginUser.getId());
        PageInfo<UserMsg> page = new PageInfo<UserMsg>(userMsgList);
        map.put("page", page);
        return "me/me_message";
    }

    /**
     * 跳到我的关注页 (我的好友)
     * @param session
     * @param map
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/meConcern", method = RequestMethod.GET)
    public String meConcern(HttpSession session, Map<String, Object> map,
                         @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                         @RequestParam(value="pageSize",defaultValue="10") int pageSize){
        User loginUser = (User)session.getAttribute("loginUser");
        PageHelper.startPage(pageNum, pageSize);//设置分页
        List<Concern> concernList = concernService.findAllConcern(loginUser.getId());
        PageInfo<Concern> page = new PageInfo<Concern>(concernList);
        map.put("page", page);
        return "me/me_concern";
    }

    /**
     * 跳到我的粉丝
     * @param session
     * @param map
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/meFans", method = RequestMethod.GET)
    public String meFans(HttpSession session, Map<String, Object> map,
                            @RequestParam(value="pageNum",defaultValue="1") int pageNum,
                            @RequestParam(value="pageSize",defaultValue="10") int pageSize){
        User loginUser = (User)session.getAttribute("loginUser");
        PageHelper.startPage(pageNum, pageSize);//设置分页
        List<Concern> concernList = concernService.findAllFans(loginUser.getId());
        PageInfo<Concern> page = new PageInfo<Concern>(concernList);
        map.put("page", page);
        return "me/me_fans";
    }



}
