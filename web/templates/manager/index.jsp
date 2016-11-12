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

<rapid:override name="title">管理者主页</rapid:override>

<rapid:override name="content">

    <div class="row">
        <div class="list-group col-sm-4 col-sm-offset-4" style="padding-top: 10px">
        <s:iterator value="riskList">
            <a  class="list-group-item" href="/manage/risk?id=<s:property value="id"></s:property>"><s:property value="id"></s:property></a>
            <s:property value="project.name"></s:property>
            <s:property value="content"></s:property>
            <s:property value="possibility"></s:property>
            <s:property value="effect"></s:property>
            <s:property value="threshold"></s:property>
            <s:property value="creator.name"></s:property>
        </s:iterator>
        </div>
    </div>
</rapid:override>

<%@ include file="/base.jsp" %>
