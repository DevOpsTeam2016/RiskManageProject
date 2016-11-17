package com.devopsteam.dao;

import com.devopsteam.model.State;

import java.util.Date;
import java.util.List;

/**
 * Created by J on 2016/11/8.
 */
public interface StateDao {

    public List<State> findStateWithTime(Date start, Date end);

    public void save(State state);

}
