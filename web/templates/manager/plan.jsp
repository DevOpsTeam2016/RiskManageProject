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
                        <form action="" method="post">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group row">
                                        <div class="col-sm-5">
                                            <label>开始时间：</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" name="name" placeholder="格式YYYY/MM/DD" required/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group row">
                                        <div class="col-sm-5">
                                            <label>结束时间：</label>
                                        </div>
                                        <div class="col-sm-7">
                                            <input type="text" class="form-control" name="name" placeholder="格式YYYY/MM/DD" required/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-10">
                                    <div class="form-group">
                                        <label class="radio-inline">
                                            <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> 被识别最多的风险
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">演变成问题最多的风险
                                        </label>
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <div class="form-group" style="float: right">
                                        <button type="submit" class="btn btn-primary">查询</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <hr>
                        <div style="float:right">
                            <button type="button" class="btn btn-success">导入</button>
                        </div>
                        <table class="table table-striped"  style="padding-top: 20px">
                            <thead>
                            <tr>
                                <th>
                                    <input type="checkbox" name="inlineRadioOptions" class="checkAll" value="">
                                </th>
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
                                        <input type="checkbox" name="inlineRadioOptions"  class="checkOne"   value="">
                                    </td>
                                    <td>
                                        <a href="/tracker/risk?id=<s:property value="id"></s:property>"><s:property value="id"></s:property></a>
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
                        <form action="/manage/project" method="post">
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
                            <h4 class="modal-title" id="myModalLabel2">模态框（Modal）标题</h4>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group">
                                    <label>编号</label>
                                    <input type="text" class="form-control" name="content" placeholder="" disabled/>
                                </div>
                                <div class="form-group">
                                    <label>可能性</label>
                                    <input type="text" class="form-control" name="content" placeholder="" required/>
                                </div>
                                <div class="form-group">
                                    <label>影响程度</label>
                                    <input type="text" class="form-control" name="content" placeholder="" required/>
                                </div>
                                <div class="form-group">
                                    <label>阈值</label>
                                    <input type="text" class="form-control" name="content" placeholder="" required/>
                                </div>
                                <div class="form-group">
                                    <label>创建者</label>
                                    <input type="text" class="form-control" name="content" placeholder="" disabled/>
                                </div>
                                <div class="form-group">
                                    <label>跟踪者</label>
                                    <input type="text" class="form-control" name="content" placeholder="" required/>
                                </div>
                                <div class="form-group">
                                    <label>时间</label>
                                    <input type="text" class="form-control" name="content" placeholder="" disabled/>
                                </div>


                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary">提交更改</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>

    <div style="margin-top: 30px">
        <div style="float:right">
            <button type="button" class="btn btn-success" id="modify" data-toggle="modal" data-target="#modifyModal">修改</button>
            <button type="button" class="btn btn-danger" id="delete">删除</button>
        </div>

        <table class="table table-striped" >
            <thead>
            <tr>
                <th>
                    <input type="checkbox" name="inlineRadioOptions" class="checkAll_index" value="">
                </th>
                <th>编号</th>
                <th>可能性</th>
                <th>影响程度</th>
                <th>阈值</th>
                <th>创建者</th>
                <th>跟踪者</th>
                <th>时间</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="riskPlanList">
            <tr>
                <td>
                    <input type="checkbox" name="inlineRadioOptions"  class="checkOne_index" value="">
                </td>
                <td class="riskId"><s:property value="id"></s:property></td>
                <td><s:property value="possibility"></s:property></td>
                <td><s:property value="effect"></s:property></td>
                <td><s:property value="threshold"></s:property></td>
                <td><s:property value="creator.username"></s:property></td>
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
            </tr>
            </s:iterator>
        </table>

    </div>
    </div>
</rapid:override>
<rapid:override name="loadJsFile">
    <script src="/static/js/manager/checkAll.js"></script>
    <script src="/static/js/manager/modify.js"></script>
</rapid:override>

<%@ include file="/base.jsp" %>

