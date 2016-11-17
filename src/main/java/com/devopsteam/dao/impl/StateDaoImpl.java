package com.devopsteam.dao.impl;

import com.devopsteam.dao.BaseDao;
import com.devopsteam.dao.StateDao;
import com.devopsteam.model.State;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
@Repository
public class StateDaoImpl implements StateDao {

    @Autowired
    private BaseDao baseDao;

    public List<State> findStateWithTime(Date start, Date end) {
        return baseDao.getListWithTime(State.class, "timestamp", start, end);
    }

    public void save(State state) {
        baseDao.save(state);
    }
}
