package com.devopsteam.action;

import com.devopsteam.model.Project;
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

    public String index() {
        projectList = developerService.getProjectList();
        return "index";
    }

    public String createProject() {
        String name = request.getParameter("name");
        developerService.createProject(name);
        return "success";
    }

    public List<Project> getProjectList() {
        return projectList;
    }

    public void setProjectList(List<Project> projectList) {
        this.projectList = projectList;
    }
}
