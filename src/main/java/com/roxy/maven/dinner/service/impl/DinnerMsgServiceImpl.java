package com.roxy.maven.dinner.service.impl;

import com.roxy.maven.dinner.dao.DinnerMsgDao;
import com.roxy.maven.dinner.entity.DinnerMsg;
import com.roxy.maven.dinner.service.DinnerMsgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class DinnerMsgServiceImpl implements DinnerMsgService {

    @Autowired
    private DinnerMsgDao dinnerMsgDao;

    @Override
    public int create(DinnerMsg dinnerMsg) {
        return dinnerMsgDao.create(dinnerMsg);
    }

    @Override
    public int delete(long id) {
        return dinnerMsgDao.delete(id);
    }

    @Override
    public List<DinnerMsg> findByDinnerId(long dinnerId) {
        return dinnerMsgDao.findByDinnerId(dinnerId);
    }
}
