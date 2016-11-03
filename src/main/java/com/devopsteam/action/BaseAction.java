package com.devopsteam.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by J on 2016/11/3.
 */
public class BaseAction extends ActionSupport implements SessionAware,
        ServletRequestAware, ServletResponseAware {

    public HttpServletRequest request;
    public HttpServletResponse response;
    public Map session;

    public void setSession(Map session) {
        this.session = session;
    }

    public void setServletRequest(HttpServletRequest request) {
        this.request = request;
    }

    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }
}