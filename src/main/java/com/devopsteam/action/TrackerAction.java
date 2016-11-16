package com.devopsteam.action;

import com.devopsteam.model.Risk;
import com.devopsteam.model.RiskPlan;
import com.devopsteam.model.State;
import com.devopsteam.service.TrackerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
@Repository
public class TrackerAction extends BaseAction {

    @Autowired
    private TrackerService trackerService;

    private List<RiskPlan> riskPlanList;
    private List<State> stateList;

    public String index() {
        //显示风险列表
        riskPlanList = trackerService.getRiskPlanList(session.get("username").toString());
        return "index";
    }

    public String riskPlan() {
        //显示状态列表，创建状态
        if(request.getMethod().equalsIgnoreCase("get")) {
            String riskPlanId = request.getParameter("id");
            if (riskPlanId == null) riskPlanId = session.get("riskPlanId").toString();
            stateList = trackerService.getStateList(riskPlanId);
            session.put("riskPlanId", riskPlanId);
            return "riskPlan";
        }
        String state = request.getParameter("state");
        String description = request.getParameter("description");
        String riskPlanId = request.getParameter("riskPlanId");
        trackerService.createState(state, description, riskPlanId);
        return "success";
    }

    public List<RiskPlan> getRiskPlanList() {
        return riskPlanList;
    }

    public void setRiskPlanList(List<RiskPlan> riskPlanList) {
        this.riskPlanList = riskPlanList;
    }

    public List<State> getStateList() {
        return stateList;
    }

    public void setStateList(List<State> stateList) {
        this.stateList = stateList;
    }
}
