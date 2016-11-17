<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2016/11/8
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">跟踪者主页</rapid:override>

<rapid:override name="content">

    <div style=" width: 80%;margin-top: 30px;margin-left: 40px;margin-right: 40px">
    <table class="table table-striped" >
    <thead>
    <tr>
        <th>编号</th>
        <th>计划名</th>
        <th>描述</th>
        <th>可能性</th>
        <th>影响程度</th>
        <th>阈值</th>
        <th>创建者</th>
    </tr>
    </thead>
    <tbody>
        <s:iterator value="riskPlanList">
            <tr>
                <td>
                    <a href="/tracker/riskplan?id=<s:property value="id"></s:property>"><s:property value="id"></s:property></a>
                </td>
                <td>
                    <s:property value="plan.name"></s:property>
                </td>
                <td>
                    <s:property value="description"></s:property>
                </td>
                <td>
                    <s:property value="possibility"></s:property>
                </td>
                <td>
                    <s:property value="effect"></s:property>
                </td>
                <td>
                    <s:property value="threshold"></s:property>
                </td>
                <td>
                    <s:property value="creator.username"></s:property>
                </td>
            </tr>
        </s:iterator>
    </tbody>
    </table>
    </div>
</rapid:override>

<%@ include file="/base.jsp" %>
