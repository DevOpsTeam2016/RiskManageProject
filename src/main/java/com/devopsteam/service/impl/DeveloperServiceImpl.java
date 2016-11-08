package com.devopsteam.service.impl;

import com.devopsteam.dao.ProjectDao;
import com.devopsteam.model.Project;
import com.devopsteam.service.DeveloperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
@Service
public class DeveloperServiceImpl implements DeveloperService {

    @Autowired
    private ProjectDao projectDao;

    public List<Project> getProjectList() {
        return projectDao.findAll();
    }

    public void createProject(String name) {
        Project project = new Project();
        project.setName(name);
        project.setTimestamp(new Date());
        projectDao.save(project);
    }
}
