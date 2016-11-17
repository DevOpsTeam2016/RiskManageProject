package com.devopsteam.service;

import com.devopsteam.model.Plan;
import com.devopsteam.model.Risk;
import com.devopsteam.model.RiskPlan;
import com.devopsteam.model.User;

import java.util.Date;
import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
public interface ManagerService {

    public List<Plan> getPlanList();

    public String getPlanName(String planId);

    public void createPlan(String name, String type, String language, String people);

    public List<RiskPlan> getRiskPlanList(String planId);

    public void createRiskPlan(String planId, String description, String possibility, String effect, String threshold, String creatorName);

    public void assignRiskPlan(String riskPlanId, String trackerName);

    public List<User> getTrackerList();

    public String[] getMostRecognizedRisk(Date start, Date end);

    public String[] getMostProblemedRisk(Date start, Date end);

}
