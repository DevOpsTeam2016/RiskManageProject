package com.devopsteam.dao;

import com.devopsteam.model.RiskPlan;

/**
 * Created by motoon on 2016/11/16.
 */
public interface RiskPlanDao {

    public RiskPlan find(int id);

    public void save(RiskPlan riskPlan);

    public void update(RiskPlan riskPlan);

}
