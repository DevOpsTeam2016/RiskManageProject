package com.devopsteam.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by J on 2016/11/8.
 */

@Entity
public class State {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int Id;
    int state;  //0: 未解决    1：解决中   2：已解决
    String description;
    Date timestamp;
    @ManyToOne
    RiskPlan riskPlan;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public RiskPlan getRiskPlan() {
        return riskPlan;
    }

    public void setRiskPlan(RiskPlan riskPlan) {
        this.riskPlan = riskPlan;
    }
}
