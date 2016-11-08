package com.devopsteam.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by J on 2016/11/8.
 */

@Entity
public class Risk {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;
    String content;
    int possibility;  //0 1 2递增
    int effect;  //0 1 2递增
    int trigger;
    Date timestamp;
    @ManyToOne
    Project project;
    @OneToMany(cascade = CascadeType.REMOVE, mappedBy = "risk")
    @OrderBy("timestamp desc")
    List<State> stateList;
    @ManyToOne
    User creator;
    @ManyToOne
    User tracker;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getPossibility() {
        return possibility;
    }

    public void setPossibility(int possibility) {
        this.possibility = possibility;
    }

    public int getTrigger() {
        return trigger;
    }

    public void setTrigger(int trigger) {
        this.trigger = trigger;
    }

    public int getEffect() {
        return effect;
    }

    public void setEffect(int effect) {
        this.effect = effect;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public List<State> getStateList() {
        return stateList;
    }

    public void setStateList(List<State> stateList) {
        this.stateList = stateList;
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
}
