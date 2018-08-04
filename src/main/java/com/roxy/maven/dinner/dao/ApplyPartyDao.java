package com.roxy.maven.dinner.dao;

import com.roxy.maven.dinner.entity.ApplyParty;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ApplyPartyDao {

    //添加报名记录
    int create(ApplyParty applyParty);

    /**
     * 删除报名记录
     * @param userId
     * @param dinnerId
     * @return
     */
    int delete(long userId, long dinnerId);

    /**
     * 根据用户ID查找报名记录
     * 有多少条记录就报名多少次
     * @param userId
     * @return
     */
    List<ApplyParty> findByUserId(long userId);

    /**
     * 根据饭局ID查找报名人员
     * 有多少条记录就有多少人报名
     * @param dinnerId
     * @return
     */
    List<ApplyParty> findByDinnerId(long dinnerId);

}
