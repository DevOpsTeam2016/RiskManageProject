package com.devopsteam.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * Created by J on 2016/11/8.
 */
public class ManagerInterceptor extends AbstractInterceptor {

    public String intercept(ActionInvocation actionInvocation) throws Exception {
        String role = (String) actionInvocation.getInvocationContext().getSession().get("role");
        if (null != role && role.equals("manager")) return actionInvocation.invoke();
        return "403";
    }
}
