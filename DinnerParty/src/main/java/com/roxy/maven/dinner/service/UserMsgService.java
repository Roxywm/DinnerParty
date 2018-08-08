package com.roxy.maven.dinner.service;

import com.roxy.maven.dinner.entity.UserMsg;

import java.util.List;

public interface UserMsgService {

    /**
     * 添加对用户的留言 (谁对谁留言)
     * @param userMsg
     * @return
     */
    int add(UserMsg userMsg);

    /**
     * 根据留言ID删除留言
     * @param id
     * @return
     */
    int delete(long id);

    /**
     * 查出对该用户的所有留言
     * @param userId
     * @return
     */
    List<UserMsg> findByUserId(long userId);
}
