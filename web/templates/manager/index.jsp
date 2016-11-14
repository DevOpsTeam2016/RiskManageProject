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
    <div style="margin-top: 30px;margin-left: 40px;margin-right: 40px">
    <table class="table table-striped" >
    <thead>
    <tr>
        <th>编号</th>
        <th>项目名称</th>
        <th>内容</th>
        <th>可能性</th>
        <th>影响程度</th>
        <th>阈值</th>
        <th>创建者</th>
    </tr>
    </thead>
    <tbody>
        <s:iterator value="riskList">
            <tr>
                <td>
                    <a href="/manage/risk?id=<s:property value="id"></s:property>"><s:property value="id"></s:property></a>
                </td>
                <td>
                    <s:property value="project.name"></s:property>
                </td>
                <td>
                    <s:property value="content"></s:property>
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
                    <s:property value="creator.name"></s:property>
                </td>
            </tr>
        </s:iterator>
    </tbody>
    </table>
    </div>
</rapid:override>

<%@ include file="/base.jsp" %>
