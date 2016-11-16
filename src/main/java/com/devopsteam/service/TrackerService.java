package com.devopsteam.service;

import com.devopsteam.model.Risk;
import com.devopsteam.model.RiskPlan;
import com.devopsteam.model.State;

import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
public interface TrackerService {

    public List<RiskPlan> getRiskPlanList(String username);

    public List<State> getStateList(String riskPlanId);

    public void createState(String state, String description, String riskPlanId);

}
