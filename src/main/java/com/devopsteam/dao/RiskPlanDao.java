package com.devopsteam.dao;

import com.devopsteam.model.RiskPlan;

import java.util.Date;
import java.util.List;

/**
 * Created by motoon on 2016/11/16.
 */
public interface RiskPlanDao {

    public RiskPlan find(int id);

    public List<RiskPlan> findWithTime(Date start, Date end);

    public void save(RiskPlan riskPlan);

    public void update(RiskPlan riskPlan);

}
