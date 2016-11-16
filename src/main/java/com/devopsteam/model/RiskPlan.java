package com.devopsteam.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by J on 2016/11/15.
 * Plan中的Risk Item
 */

@Entity
public class RiskPlan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    String description;
    Date timestamp;
    int possibility;  //0 1 2递增
    int effect;  //0 1 2递增
    int threshold;
    @ManyToOne
    Plan plan;
    @ManyToOne
    Risk risk;
    @ManyToOne
    User creator;
    @ManyToOne
    User tracker;
    @OneToMany(cascade = CascadeType.REMOVE, mappedBy = "riskPlan")
    @OrderBy("timestamp desc")
    List<State> stateList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getPossibility() {
        return possibility;
    }

    public void setPossibility(int possibility) {
        this.possibility = possibility;
    }

    public int getEffect() {
        return effect;
    }

    public void setEffect(int effect) {
        this.effect = effect;
    }

    public int getThreshold() {
        return threshold;
    }

    public void setThreshold(int threshold) {
        this.threshold = threshold;
    }

    public Plan getPlan() {
        return plan;
    }

    public void setPlan(Plan plan) {
        this.plan = plan;
    }

    public Risk getRisk() {
        return risk;
    }

    public void setRisk(Risk risk) {
        this.risk = risk;
    }

    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }

    public User getTracker() {
        return tracker;
    }

    public void setTracker(User tracker) {
        this.tracker = tracker;
    }

    public List<State> getStateList() {
        return stateList;
    }

    public void setStateList(List<State> stateList) {
        this.stateList = stateList;
    }
}
