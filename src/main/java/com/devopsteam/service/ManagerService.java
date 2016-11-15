package com.devopsteam.service;

import com.devopsteam.model.Plan;
import com.devopsteam.model.Risk;
import com.devopsteam.model.User;

import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
public interface ManagerService {

    public List<Plan> getPlanList();

    public String getPlanName(String planId);

    public void createPlan(String name);

    public List<Risk> getRiskList(String projectId);

    public void createRisk(String planId, String content, String possibility, String effect, String threshold, String creatorName);

    public void assignRisk(String riskId, String trackerName);

    public List<User> getTrackerList();

}
