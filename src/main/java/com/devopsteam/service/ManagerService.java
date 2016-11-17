package com.devopsteam.service;

import com.devopsteam.model.Plan;
import com.devopsteam.model.Risk;
import com.devopsteam.model.RiskPlan;
import com.devopsteam.model.User;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by J on 2016/11/8.
 */
public interface ManagerService {

    public List<Plan> getPlanList();

    public String getPlanName(String planId);

    public void createPlan(String name, String type, String language, String people);

    public List<RiskPlan> getRiskPlanList(String planId);

    public void createRiskPlan(String planId, String riskId, String description, String possibility, String effect, String threshold, String creatorName);

    public void importRiskPlan(String planId, String[] riskIds, String creator);

    public void updateRiskPlan(String riskPlanId, String description, String possibility, String effect, String threshold);

    public void deleteRiskPlan(String riskPlanId);

    public void assignRiskPlan(String riskPlanId, String trackerName);

    public List<User> getTrackerList();

    public List<Risk> getRiskList();

    public Map<Integer, Risk> getMostRecognizedRisk(String start, String end);

    public Map<Integer, Risk> getMostProblemedRisk(String start, String end);

}
