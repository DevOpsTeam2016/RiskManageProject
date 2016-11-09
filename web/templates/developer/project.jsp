<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2016/11/8
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">
    <s:if test="#session.projectName != null">
        <%=session.getAttribute("projectName")%>
    </s:if>
</rapid:override>

<rapid:override name="content">
    <s:iterator value="riskList">
        <s:property value="id"></s:property>
        <s:property value="name"></s:property>
        <s:property value="tracker"></s:property>
    </s:iterator>
</rapid:override>

<%@ include file="/base.jsp" %>
