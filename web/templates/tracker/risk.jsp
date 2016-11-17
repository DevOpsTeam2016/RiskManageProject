<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2016/11/8
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">风险</rapid:override>

<rapid:override name="content">


    <!-- Modal -->
    <div id="createStateModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">创建风险状态</h4>
                </div>
                <div class="modal-body">
                    <form action="/tracker/riskplan" method="post">
                        <input type="hidden" name="riskPlanId" value="<%=session.getAttribute("riskPlanId")%>">
                        <div class="form-group">
                            <label for="state" class="col-sm-2 control-label">状态</label>
                            <select class="form-control" id="state" name="state" required>
                                <option value="0">未解决且未演变成问题</option>
                                <option value="1">未解决但已演变成问题</option>
                                <option value="2">解决中</option>
                                <option value="3">已解决</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="description" placeholder="状态描述" required/>
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

    <button class="form-control" name="createState" data-toggle="modal" data-target="#createStateModal" style="width: 50%;margin-left: 25%">
        创建风险状态<span class="glyphicon glyphicon-plus" style="color: deepskyblue"></span></button>


    <div style=" width: 80%;margin-top: 30px;margin-left: 40px;margin-right: 40px">
    <table class="table table-striped" >
        <thead>
            <tr>
                <th>编号</th>
                <th>状态</th>
                <th>描述</th>
                <th>创建时间</th>
            </tr>
        </thead>
        <tbody>
    <s:iterator value="stateList">
        <tr>
            <td> <s:property value="id"></s:property></td>
            <td> <s:property value="state"></s:property></td>
            <td> <s:property value="description"></s:property></td>
            <td><s:date name="timestamp" format="yyyy-MM-dd HH:mm:ss"></s:date></td>
        </tr>
    </s:iterator>
        </tbody>
    </table>
    </div>

</rapid:override>

<%@ include file="/base.jsp" %>
