package com.roxy.maven.dinner.service;

import com.roxy.maven.dinner.entity.ApplyHost;

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
}
