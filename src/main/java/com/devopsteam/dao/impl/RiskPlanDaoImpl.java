package com.devopsteam.dao.impl;

import com.devopsteam.dao.BaseDao;
import com.devopsteam.dao.RiskPlanDao;
import com.devopsteam.model.RiskPlan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by motoon on 2016/11/16.
 */

@Repository
public class RiskPlanDaoImpl implements RiskPlanDao {

    @Autowired
    private BaseDao baseDao;

    public RiskPlan find(int id) {
        return (RiskPlan) baseDao.load(RiskPlan.class, id);
    }

    public void save(RiskPlan riskPlan) {
        baseDao.save(riskPlan);
    }

    public void update(RiskPlan riskPlan) {
        baseDao.update(riskPlan);
    }
}
