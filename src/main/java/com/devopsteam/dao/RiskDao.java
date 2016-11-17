package com.devopsteam.dao;

import com.devopsteam.model.Risk;

import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
public interface RiskDao {

    public int getCount();

    public Risk find(int id);

    public List<Risk> findAll();

    public void save(Risk risk);

    public void update(Risk risk);

}
