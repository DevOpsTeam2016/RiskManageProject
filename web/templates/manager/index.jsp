<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2016/11/8
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">管理者主页</rapid:override>

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
        <div id="createPlanModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel" >创建风险计划 </h4>
                    </div>
                    <div class="modal-body">
                        <form action="/manage/create_plan" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" name="name" placeholder="计划名" required/>
                            </div>
                            <div class="form-group">
                                <select type="text" class="form-control" name="type" placeholder="规模" required>
                                    <option value="0">小型</option>
                                    <option value="1">中型</option>
                                    <option value="2">大型</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="language" placeholder="语言" required/>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="people" placeholder="人数" required/>
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
        <button class="form-control" name="createPlan" data-toggle="modal" data-target="#createPlanModal" style="width: 50%;margin-left: 25%">创建风险计划 <span class="glyphicon glyphicon-plus" style="color: deepskyblue"></span></button>

        <table class="table table-striped" >
            <thead>
            <tr>
                <th>编号</th>
                <th>计划名称</th>
                <th>项目语言</th>
                <th>创建时间</th>
                <th>项目人数</th>
                <th>项目类别</th>
            </tr>
            </thead>
            <tbody>
            <s:iterator value="planList">
            <tr>
                <td class="riskPlanId"><s:property value="id"></s:property></td>
                <td><a  class="list-group-item" href="/manage/plan?id=<s:property value="id" ></s:property>">
                    <s:property value="name"></s:property>
                </a>
                </td>
                <td><s:property value="language"></s:property></td>
                <td><s:date name="timestamp" format="yyyy-MM-dd HH:mm:ss"></s:date></td>
                <td><s:property value="people"></s:property></td>
                <td>
                    <s:if test="type==0">
                        小型
                    </s:if>
                    <s:elseif test="type==1">
                        中型
                    </s:elseif>
                    <s:else>
                        大型
                    </s:else>
                </td>
            </tr>
            </s:iterator>
        </table>
    </div>
</rapid:override>

<%@ include file="/base.jsp" %>
