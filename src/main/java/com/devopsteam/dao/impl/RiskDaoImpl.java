package com.devopsteam.dao.impl;

import com.devopsteam.dao.BaseDao;
import com.devopsteam.dao.RiskDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by J on 2016/11/8.
 */
@Repository
public class RiskDaoImpl implements RiskDao {

    @Autowired
    private BaseDao baseDao;

}
