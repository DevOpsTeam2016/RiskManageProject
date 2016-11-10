package com.devopsteam.action;

import com.devopsteam.model.Project;
import com.devopsteam.model.Risk;
import com.devopsteam.model.User;
import com.devopsteam.service.DeveloperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
@Repository
public class DeveloperAction extends BaseAction {

    @Autowired
    private DeveloperService developerService;

    private List<Project> projectList;
    private List<Risk> riskList;
    private List<User> managerList;

    private String message;

    public String index() {
        //显示项目列表
        projectList = developerService.getProjectList();
        return "index";
    }

    public String createProject() {
        //创建项目
        String name = request.getParameter("name");
        developerService.createProject(name);
        return "success";
    }

    public String project() {
        //显示项目的风险列表、创建风险
        if(request.getMethod().equalsIgnoreCase("get")) {
            String projectId = request.getParameter("id");
            if (projectId == null) projectId = session.get("projectId").toString();
            riskList = developerService.getRiskList(projectId);
            managerList = developerService.getManagerList();
            session.put("projectId", projectId);
            session.put("projectName", developerService.getProjectName(projectId));
            return "project";
        }
        String projectId = request.getParameter("projectId");
        String content = request.getParameter("content");
        String possibility = request.getParameter("possibility");
        String effect = request.getParameter("effect");
        String threshold = request.getParameter("threshold");
        System.out.println(projectId + " " + content + " " + possibility + " " + effect + " " + threshold);
        developerService.createRisk(projectId, content, possibility, effect, threshold, session.get("username").toString());
        return "success";
    }

    public String assignRisk() {
        //指派风险给跟踪者
        String riskId = request.getParameter("riskId");
        String trackerName = request.getParameter("trackerName");
        developerService.assignRisk(riskId, trackerName);
        message = "success";
        return "success";
    }

    public List<Project> getProjectList() {
        return projectList;
    }

    public void setProjectList(List<Project> projectList) {
        this.projectList = projectList;
    }

    public List<Risk> getRiskList() {
        return riskList;
    }

    public void setRiskList(List<Risk> riskList) {
        this.riskList = riskList;
    }

    public List<User> getManagerList() {
        return managerList;
    }

    public void setManagerList(List<User> managerList) {
        this.managerList = managerList;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
