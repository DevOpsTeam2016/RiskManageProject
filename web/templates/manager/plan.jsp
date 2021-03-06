<%--
  Created by IntelliJ IDEA.
  User: zsmy
  Date: 16/11/15
  Time: 下午3:17
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">计划</rapid:override>

<rapid:override name="content">
    <div class="gem_sidebar" style="height: 100%;width: 18%;float: left;padding-left: 30px;padding-right: 5px;margin-top: 50px">
        <div style="margin-left: -10px;height: 100%">
            <ul id="main-nav" class="main-nav nav nav-tabs nav-stacked" style="height: 100%">
                <li id="sidebar1" class="title" ><a href="index"><i class="glyphicon glyphicon-th-large"></i>风险计划</a></li>
                <%--<li id="sidebar2" class="title" ><a href="plan"><i class="glyphicon glyphicon-fire"></i>风险计划</a></li>--%>
                <li id="sidebar3" class="stick" ><a href="graphics"><i class="glyphicon glyphicon-cog"></i>统计</a></li>
            </ul>
        </div>
    </div>
    <div style=" width: 70%;float: left;margin-top: 30px;margin-left: 40px;margin-right: 40px">
        <%--导入风险条目modal--%>
        <div id="createPlanModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel1" >导入风险条目 </h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group row">
                                    <div class="col-sm-5">
                                        <label>开始时间：</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="date" class="form-control" name="start" required/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group row">
                                    <div class="col-sm-5">
                                        <label>结束时间：</label>
                                    </div>
                                    <div class="col-sm-7">
                                        <input type="date" class="form-control" name="end" required/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div id="radios" class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="riskRadio" id="inlineRadio1" value="0"> 被识别最多的风险
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="riskRadio" id="inlineRadio2" value="1">演变成问题最多的风险
                                </label>
                            </div>
                            <div class="col-sm-2">
                                <button type="button" class="query btn btn-primary">查询</button>
                            </div>
                        </div>
                        <hr>
                        <div style="float:right">
                            <button type="button" class="import btn btn-success">导入</button>
                        </div>
                        <table class="table table-striped"  style="padding-top: 20px">
                            <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" name="inlineRadioOptions" class="checkAll" value="">
                                </th>
                                <th>风险编号</th>
                                <th>风险名称</th>
                            </tr>
                            </thead>
                            <tbody id="query_tbody">
                            <s:iterator value="riskList">
                                <tr>
                                    <td>
                                        <input type="checkbox" name="inlineRadioOptions" class="checkOne" value="">
                                    </td>
                                    <td class="riskId"><s:property value="id"></s:property></td>
                                    <td>
                                        <s:property value="content"></s:property>
                                    </td>
                                </tr>
                            </s:iterator>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
        <!-- 创建风险条目Modal -->
        <div id="createRiskModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">创建风险</h4>
                    </div>
                    <div class="modal-body">
                        <form action="/manage/plan" method="post">
                            <div class="form-group">
                                <input type="hidden" name="planId" value="<%=session.getAttribute("planId")%>">
                                <input type="text" class="form-control" name="description" placeholder="风险内容" required/>
                            </div>
                            <div class="form-group">
                                <label for="riskId" class="col-sm-2 control-label">风险名称</label>
                                <select class="form-control" id="riskId" name="riskId" required>
                                    <s:iterator value="riskList">
                                        <option value="<s:property value="id"></s:property>"><s:property value="content"></s:property></option>
                                    </s:iterator>
                                </select>
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

        <div class="row">
            <div class="col-sm-6">
                <button class="form-control" name="createRisk" data-toggle="modal" data-target="#createRiskModal" style="width: 50%;margin-left: 25%">
                    创建风险
                    <span class="glyphicon glyphicon-plus" style="color: deepskyblue"></span></button>
            </div>
            <div class="col-sm-6 ">
                <button class="form-control" name="createPlan" data-toggle="modal" data-target="#createPlanModal" style="width: 50%;margin-left: 25%">导入风险条目<span class="glyphicon glyphicon-plus" style="color: deepskyblue"></span></button>

            </div>
        </div>

            <!-- 修改模态框（Modal） -->
            <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel2">修改风险</h4>
                        </div>
                        <div class="modal-body">
                            <form action="/manage/risk" method="post" >
                                <div class="form-group">
                                    <input type="hidden" name="operation" value="update" />
                                    <label>编号</label>
                                    <input type="text" class="form-control" name="riskPlanId" hidden/>
                                </div>
                                <div class="form-group">
                                    <label>风险名称</label>
                                    <input type="text" class="form-control" name="riskName" disabled/>
                                </div>
                                <div class="form-group">
                                    <label>风险内容</label>
                                    <input type="text" class="form-control" name="description" required/>
                                </div>
                                <div class="form-group">
                                    <label for="possibility" class="col-sm-2 control-label">可能性</label>
                                    <select class="form-control" id="possibility2" name="possibility" required>
                                        <option value="0">低</option>
                                        <option value="1">中</option>
                                        <option value="2">高</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="effect" class="col-sm-2 control-label">影响程度</label>
                                    <select class="form-control" id="effect2" name="effect" required>
                                        <option value="0">低</option>
                                        <option value="1">中</option>
                                        <option value="2">高</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>阈值</label>
                                    <input type="text" class="form-control" name="threshold" required/>
                                </div>
                                <div class="form-group">
                                    <label>创建者</label>
                                    <input type="text" class="form-control" name="creator" disabled/>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary">修改</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                </div>
                            </form>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>

    <div style="margin-top: 30px">
        <table class="table table-striped" >
            <thead>
            <tr>
                <th>
                    <input type="checkbox" name="inlineRadioOptions" class="checkAll_index" value="">
                </th>
                <th>编号</th>
                <th>风险名称</th>
                <th>风险内容</th>
                <th>可能性</th>
                <th>影响程度</th>
                <th>阈值</th>
                <th>创建者</th>
                <th>跟踪者</th>
                <th>时间</th>
                <th>修改</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="riskPlanList">
            <tr>
                <td>
                    <input type="checkbox" name="inlineRadioOptions"  class="checkOne_index" value="">
                </td>
                <td class="riskPlanId"><s:property value="id"></s:property></td>
                <td class="riskName"><s:property value="risk.content"></s:property> </td>
                <td class="description"><s:property value="description"></s:property> </td>
                <td class="possibility">
                    <s:if test="possibility==0">低</s:if>
                    <s:elseif test="possibility==1">中</s:elseif>
                    <s:else>高</s:else>
                </td>
                <td class="effect">
                    <s:if test="effect==0">低</s:if>
                    <s:elseif test="effect==1">中</s:elseif>
                    <s:else>高</s:else>
                </td>
                <td class="threshold"><s:property value="threshold"></s:property></td>
                <td class="creator"><s:property value="creator.username"></s:property></td>
                <td class="assignItem">
                    <s:if test="tracker == null">
                        <select name="assignRiskSelect">
                            <option value="">未委派</option>
                            <s:iterator value="trackerList">
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
                <td>
                    <button type="button" class="updateRisk btn btn-success"  data-toggle="modal" data-target="#modifyModal">修改</button>
                </td>
                <td>
                    <button type="button" class="deleteRisk btn btn-danger">删除</button>
                </td>
            </tr>
            </s:iterator>
        </table>

    </div>
    </div>
</rapid:override>
<rapid:override name="loadJsFile">
    <script src="/static/js/manager/checkAll.js"></script>
    <script src="/static/js/manager/modify.js"></script>
    <script src="/static/js/manager/plan.js"></script>
</rapid:override>

<%@ include file="/base.jsp" %>

