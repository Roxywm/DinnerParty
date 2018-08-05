package com.roxy.maven.dinner.service;

import com.roxy.maven.dinner.entity.DinnerMsg;

import java.util.List;

public interface DinnerMsgService {

    /**
     * 添加对饭局的留言
     * @param dinnerMsg
     * @return
     */
    int create(DinnerMsg dinnerMsg);

    /**
     * 删除对饭局的留言
     * @param id
     * @return
     */
    int delete(long id);

    /**
     * 根据饭局ID查找该饭局的所有留言
     * 带分页
     * @param dinnerId
     * @return
     */
    List<DinnerMsg> findByDinnerId(long dinnerId);
}
