package com.roxy.maven.dinner.service;

import com.roxy.maven.dinner.entity.ApplyHost;

import java.util.List;

public interface ApplyHostService {
    /**
     * 根据用户ID查找报名记录
     * @param id
     * @return
     */
    ApplyHost findByUserId(long id);

    /**
     * 申请报名成为主持人
     * @param applyHost
     * @return
     */
    int applyHost(ApplyHost applyHost);

    /**
     * 查询所有申请报名
     * @return
     */
    List<ApplyHost> findAll();

    /**
     * 审核通过
     * @return
     */
    int updateStatus(long id);
}
