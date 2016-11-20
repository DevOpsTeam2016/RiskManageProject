package com.devopsteam.vo;

/**
 * Created by motoon on 2016/11/20.
 */
public class RiskVo {

    int id;
    String content;
    int number;

    public RiskVo(int id, String content, int number) {
        this.id = id;
        this.content = content;
        this.number = number;
    }

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

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }
}
