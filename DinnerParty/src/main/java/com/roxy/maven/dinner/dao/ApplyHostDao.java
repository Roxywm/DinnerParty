package com.roxy.maven.dinner.dao;

import com.roxy.maven.dinner.entity.ApplyHost;
import org.springframework.stereotype.Repository;

@Repository
public interface ApplyHostDao {

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
