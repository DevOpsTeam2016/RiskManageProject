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
                <li id="sidebar1" class="title" ><a href="index"><i class="glyphicon glyphicon-th-large"></i>风险条目</a></li>
                <li id="sidebar2" class="title" ><a href="plan"><i class="glyphicon glyphicon-fire"></i>风险计划</a></li>
                <li id="sidebar3" class="stick" ><a href="graphics"><i class="glyphicon glyphicon-cog"></i>统计</a></li>
            </ul>
        </div>
    </div>
    <div style=" width: 70%;float: left;margin-top: 30px;margin-left: 40px;margin-right: 40px">
        <div id="createPlanModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel" >导入风险条目 </h4>
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
        <button class="form-control" name="createPlan" data-toggle="modal" data-target="#createPlanModal" style="width: 50%;margin-left: 25%">导入风险条目<span class="glyphicon glyphicon-plus" style="color: deepskyblue"></span></button>

    <div style="margin-top: 30px">
        <div style="float:right">
            <button type="button" class="btn btn-success">修改</button>
            <button type="button" class="btn btn-danger">删除</button>
        </div>
        <table class="table table-striped" >
            <thead>
            <tr>
                <th>
                    <input type="checkbox" name="inlineRadioOptions" class="checkAll_index" value="">
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
                        <input type="checkbox" name="inlineRadioOptions"  class="checkOne_index" value="">
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
</rapid:override>
<rapid:override name="loadJsFile">
    <script src="/static/js/manager/checkAll.js"></script>
</rapid:override>

<%@ include file="/base.jsp" %>

