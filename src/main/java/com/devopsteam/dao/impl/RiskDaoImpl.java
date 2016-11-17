package com.devopsteam.dao.impl;

import com.devopsteam.dao.BaseDao;
import com.devopsteam.dao.RiskDao;
import com.devopsteam.model.Risk;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
@Repository
public class RiskDaoImpl implements RiskDao {

    @Autowired
    private BaseDao baseDao;

    public int getCount() {
        return baseDao.getTotalCount(Risk.class);
    }

    public Risk find(int id) {
        return (Risk) baseDao.load(Risk.class, id);
    }

    public List<Risk> findAll() {
        return baseDao.getAllList(Risk.class);
    }

    public void save(Risk risk) {
        baseDao.save(risk);
    }

    public void update(Risk risk) {
        baseDao.update(risk);
    }
}
