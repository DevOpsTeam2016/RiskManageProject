package com.devopsteam.dao.impl;

import com.devopsteam.dao.BaseDao;
import com.devopsteam.dao.StateDao;
import com.devopsteam.model.State;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by J on 2016/11/8.
 */
@Repository
public class StateDaoImpl implements StateDao {

    @Autowired
    private BaseDao baseDao;

    public void save(State state) {
        baseDao.save(state);
    }
}
