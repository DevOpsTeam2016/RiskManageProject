package com.devopsteam.action;

import com.devopsteam.model.Plan;
import com.devopsteam.model.Risk;
import com.devopsteam.model.RiskPlan;
import com.devopsteam.model.User;
import com.devopsteam.service.ManagerService;
import com.devopsteam.vo.RiskVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

/**
 * Created by J on 2016/11/8.
 */
@Repository
public class ManagerAction extends BaseAction {

    @Autowired
    private ManagerService managerService;

    private List<Plan> planList;
    private List<RiskPlan> riskPlanList;
    private List<User> trackerList;
    private List<Risk> riskList;

    private List<RiskVo> mostRecognizedRisk;
    private List<RiskVo> mostProblemedRisk;

    private String message;

    public String index() {
        //显示项目列表
        planList = managerService.getPlanList();
        return "index";
    }

    public String createPlan() {
        //创建计划
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String language = request.getParameter("language");
        String people = request.getParameter("people");
        managerService.createPlan(name, type, language, people);
        return "success";
    }

    public String plan() {
        //显示计划的风险列表、创建风险
        if(request.getMethod().equalsIgnoreCase("get")) {
            String planId = request.getParameter("id");
            if (planId == null) planId = session.get("planId").toString();
            riskPlanList = managerService.getRiskPlanList(planId);
            trackerList = managerService.getTrackerList();
            riskList = managerService.getRiskList();
            session.put("planId", planId);
            session.put("planName", managerService.getPlanName(planId));
            return "plan";
        }
        String planId = request.getParameter("planId");
        String riskId = request.getParameter("riskId");
        String description = request.getParameter("description");
        String possibility = request.getParameter("possibility");
        String effect = request.getParameter("effect");
        String threshold = request.getParameter("threshold");
        managerService.createRiskPlan(planId, riskId, description, possibility, effect, threshold, session.get("username").toString());
        return "success";
    }

    public String assignRisk() {
        //指派风险给跟踪者
        String riskPlanId = request.getParameter("riskPlanId");
        String trackerName = request.getParameter("trackerName");
        managerService.assignRiskPlan(riskPlanId, trackerName);
        message = "success";
        return "success";
    }

    public String risk() {
        //风险的删改，导入
        String operation = request.getParameter("operation");
        if(operation.equals("query")){
            String start = request.getParameter("start");
            String end = request.getParameter("end");
            String riskRadio = request.getParameter("riskRadio");
            if (riskRadio.equals("0")) {
                mostRecognizedRisk = managerService.getMostRecognizedRisk(start, end);
                return "most_recognized";
            } else {
                mostProblemedRisk = managerService.getMostProblemedRisk(start, end);
                return "most_problemed";
            }
        }else if (operation.equals("import")) {
            String[] riskIds = request.getParameterValues("riskIds[]");
            managerService.importRiskPlan(session.get("planId").toString(), riskIds, session.get("username").toString());
            message = "success";
            return "import_done";
        } else if (operation.equals("update")) {
            String riskPlanId = request.getParameter("riskPlanId");
            String description = request.getParameter("description");
            String possibility = request.getParameter("possibility");
            String effect = request.getParameter("effect");
            String threshold = request.getParameter("threshold");
            managerService.updateRiskPlan(riskPlanId, description, possibility, effect, threshold);
            return "reload";
        } else if (operation.equals("delete")) {
            String riskPlanId = request.getParameter("riskPlanId");
            managerService.deleteRiskPlan(riskPlanId);
            return "success";
        }else {
            return "error";
        }
    }

    public String graphics(){
        String start = request.getParameter("start");
        String end = request.getParameter("end");
        if (start == null) start = "2016-01-01 00:00:00";
        if (end == null) end = "2017-01-01 00:00:00";
        mostRecognizedRisk = managerService.getMostRecognizedRisk(start, end);
        mostProblemedRisk = managerService.getMostProblemedRisk(start, end);
        return "graphics";
    }

    public List<Plan> getPlanList() {
        return planList;
    }

    public void setPlanList(List<Plan> planList) {
        this.planList = planList;
    }

    public List<RiskPlan> getRiskPlanList() {
        return riskPlanList;
    }

    public void setRiskPlanList(List<RiskPlan> riskPlanList) {
        this.riskPlanList = riskPlanList;
    }

    public List<User> getTrackerList() {
        return trackerList;
    }

    public void setTrackerList(List<User> trackerList) {
        this.trackerList = trackerList;
    }

    public List<Risk> getRiskList() {
        return riskList;
    }

    public void setRiskList(List<Risk> riskList) {
        this.riskList = riskList;
    }

    public List<RiskVo> getMostRecognizedRisk() {
        return mostRecognizedRisk;
    }

    public void setMostRecognizedRisk(List<RiskVo> mostRecognizedRisk) {
        this.mostRecognizedRisk = mostRecognizedRisk;
    }

    public List<RiskVo> getMostProblemedRisk() {
        return mostProblemedRisk;
    }

    public void setMostProblemedRisk(List<RiskVo> mostProblemedRisk) {
        this.mostProblemedRisk = mostProblemedRisk;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
