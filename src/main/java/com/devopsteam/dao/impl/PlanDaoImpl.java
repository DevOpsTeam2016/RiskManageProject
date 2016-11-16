package com.devopsteam.dao.impl;

import com.devopsteam.dao.BaseDao;
import com.devopsteam.dao.PlanDao;
import com.devopsteam.model.Plan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
@Repository
public class PlanDaoImpl implements PlanDao {

    @Autowired
    private BaseDao baseDao;

    public Plan find(int id) {
        return (Plan) baseDao.load(Plan.class, id);
    }

    public List<Plan> findAll() {
        return baseDao.getAllList(Plan.class);
    }

    public void save(Plan plan) {
        baseDao.save(plan);
    }
}
