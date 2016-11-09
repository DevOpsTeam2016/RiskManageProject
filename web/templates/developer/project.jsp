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

    <!-- Modal -->
    <div id="createRiskModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">创建项目</h4>
                </div>
                <div class="modal-body">
                    <form action="/developer/project" method="post">
                        <div class="form-group">
                            <input type="hidden" name="projectId" value="<%=session.getAttribute("projectId")%>">
                            <input type="text" class="form-control" name="content" placeholder="风险内容" required/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="possibility" placeholder="可能性" required/>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">创建</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <button class="form-control" name="createRisk" data-toggle="modal" data-target="#createRiskModal">创建风险</button>

    <s:iterator value="riskList">
        <s:property value="id"></s:property>
        <s:property value="name"></s:property>
        <s:property value="tracker"></s:property>
    </s:iterator>
</rapid:override>

<%@ include file="/base.jsp" %>
