package com.devopsteam.dao.impl;

import com.devopsteam.dao.BaseDao;
import com.devopsteam.dao.TestDao;
import com.devopsteam.model.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by J on 2016/11/3.
 */

@Repository
public class TestDaoImpl implements TestDao {

    @Autowired
    private BaseDao baseDao;

    public void save(Test test) {
        baseDao.save(test);
    }

}
