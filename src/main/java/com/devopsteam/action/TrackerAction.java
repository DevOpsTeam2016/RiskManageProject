package com.devopsteam.action;

import com.devopsteam.model.Risk;
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

    private List<Risk> riskList;
    private List<State> stateList;

    public String index() {
        //显示风险列表
        riskList = trackerService.getRiskList(session.get("username").toString());
        return "index";
    }

    public String risk() {
        //显示状态列表，创建状态
        if(request.getMethod().equalsIgnoreCase("get")) {
            String riskId = request.getParameter("id");
            if (riskId == null) riskId = session.get("riskId").toString();
            stateList = trackerService.getStateList(riskId);
            session.put("riskId", riskId);
            return "risk";
        }
        String state = request.getParameter("state");
        String description = request.getParameter("description");
        String riskId = request.getParameter("riskId");
        System.out.println(state + " " + description + " " + riskId);
        trackerService.createState(state, description, riskId);
        return "success";
    }

    public List<Risk> getRiskList() {
        return riskList;
    }

    public void setRiskList(List<Risk> riskList) {
        this.riskList = riskList;
    }

    public List<State> getStateList() {
        return stateList;
    }

    public void setStateList(List<State> stateList) {
        this.stateList = stateList;
    }
}
