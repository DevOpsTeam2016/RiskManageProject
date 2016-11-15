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
                    <h4 class="modal-title" id="myModalLabel">创建风险</h4>
                </div>
                <div class="modal-body">
                    <form action="/developer/project" method="post">
                        <div class="form-group">
                            <input type="hidden" name="projectId" value="<%=session.getAttribute("projectId")%>">
                            <input type="text" class="form-control" name="content" placeholder="风险内容" required/>
                        </div>
                        <div class="form-group">
                            <label for="possibility" class="col-sm-2 control-label">可能性</label>
                            <select class="form-control" id="possibility" name="possibility" required>
                                <option value="0">低</option>
                                <option value="1">中</option>
                                <option value="2">高</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="effect" class="col-sm-2 control-label">影响程度</label>
                            <select class="form-control" id="effect" name="effect" required>
                                <option value="0">低</option>
                                <option value="1">中</option>
                                <option value="2">高</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="threshold" placeholder="阈值" required/>
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

    <button class="form-control" name="createRisk" data-toggle="modal" data-target="#createRiskModal" style="width: 50%;margin-left: 25%">
        创建风险
        <span class="glyphicon glyphicon-plus" style="color: deepskyblue"></span></button>

    <div style="margin-top: 30px;margin-left: 40px;margin-right: 40px">
    <table class="table table-striped" >
        <thead>
        <tr>
            <th>编号</th>
            <th>内容</th>
            <th>可能性</th>
            <th>影响程度</th>
            <th>阈值</th>
            <th>创建者</th>
            <th>跟踪者</th>
        </tr>
        </thead>
        <tbody>
        <s:iterator value="riskList">
            <tr>
                <td class="riskId"><s:property value="id"></s:property></td>
                <td><s:property value="content"></s:property></td>
                <td><s:property value="possibility"></s:property></td>
                <td><s:property value="effect"></s:property></td>
                <td><s:property value="threshold"></s:property></td>
                <td><s:property value="creator.username"></s:property></td>
                <td class="assignItem">
                    <s:if test="tracker == null">
                        <select name="assignRiskSelect">
                            <option value="">未委派</option>
                            <s:iterator value="managerList">
                                <option value="<s:property value="username"></s:property>">
                                    <s:property value="username"></s:property>
                                </option>
                            </s:iterator>
                        </select>
                    </s:if>
                    <s:else>
                        <s:property value="tracker.username"></s:property>
                    </s:else>
                </td>
                <td><s:property value="timestamp"></s:property></td>
            </tr>
        </s:iterator>
    </table>
    </div>
</rapid:override>

<rapid:override name="loadJsFile">
    <script src="/static/js/developer/project.js"></script>
</rapid:override>

<%@ include file="/base.jsp" %>