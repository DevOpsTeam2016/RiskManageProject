package com.devopsteam.dao.impl;

import com.devopsteam.dao.BaseDao;
import com.devopsteam.dao.ProjectDao;
import com.devopsteam.model.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
@Repository
public class ProjectDaoImpl implements ProjectDao {

    @Autowired
    private BaseDao baseDao;

    public Project find(int id) {
        return (Project) baseDao.load(Project.class, id);
    }

    public List<Project> findAll() {
        return baseDao.getAllList(Project.class);
    }

    public void save(Project project) {
        baseDao.save(project);
    }
}
