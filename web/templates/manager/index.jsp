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

<rapid:override name="title">开发者主页</rapid:override>

<rapid:override name="content">

    <!-- Modal -->
    <%--<div id="createProjectModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">--%>
        <%--<div class="modal-dialog" role="document">--%>
            <%--<div class="modal-content">--%>
                <%--<div class="modal-header">--%>
                    <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                    <%--<h4 class="modal-title" id="myModalLabel" >创建项目 </h4>--%>
                <%--</div>--%>
                <%--<div class="modal-body">--%>
                    <%--<form action="/manage/create_project" method="post">--%>
                        <%--<div class="form-group">--%>
                            <%--<input type="text" class="form-control" name="name" placeholder="项目名" required/>--%>
                        <%--</div>--%>
                        <%--<div class="form-group">--%>
                            <%--<button type="submit" class="btn btn-primary">创建</button>--%>
                            <%--<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>--%>
                        <%--</div>--%>
                    <%--</form>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<button class="form-control" name="createProject" data-toggle="modal" data-target="#createProjectModal" style="width: 50%;margin-left: 25%">创建计划 <span class="glyphicon glyphicon-plus" style="color: deepskyblue"></span></button>--%>
    <div class="gem_sidebar" style="height: 100%;width: 18%;float: left;padding-left: 30px;padding-right: 5px;margin-top: 50px">
        <div style="margin-left: -10px;height: 100%">
            <ul id="main-nav" class="main-nav nav nav-tabs nav-stacked" style="height: 100%">
                <li id="sidebar1" class="title" ><a href="index"><i class="glyphicon glyphicon-th-large"></i>风险条目</a></li>
                <li id="sidebar2" class="title" ><a href="create_plan"><i class="glyphicon glyphicon-fire"></i>风险计划</a></li>
                <li id="sidebar3" class="stick" ><a href="graphics"><i class="glyphicon glyphicon-cog"></i>统计</a></li>
            </ul>
        </div>
    </div>
    <%--<div class="row">--%>
        <%--<div class="list-group col-sm-2" style="padding-left: 20px;padding-top: 10px">--%>

        <%--</div>--%>
    <div style=" width: 70%;float: left;margin-top: 30px;margin-left: 40px;margin-right: 40px">
        <div id="createPlanModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel" >创建风险计划 </h4>
                    </div>
                    <div class="modal-body">
                        <form action="" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" name="name" placeholder="计划名" required/>
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

        <s:iterator value="planList">
            <s:property value="id"></s:property>
            <a  class="list-group-item" href="/manage/plan?id=<s:property value="id" ></s:property>">
                <s:property value="name"></s:property>
            </a>
            <s:property value="language"></s:property>
            <s:date name="timestamp" format="yyyy-MM-dd HH:mm:ss"></s:date>
            <s:property value="people"></s:property>
            <s:property value="type"></s:property>
        </s:iterator>
    </div>
    <%--<div class="jumbotron col-sm-8 col-sm-offset-1" style="margin-top:60px;padding-left:30px">--%>
            <%--<h1>管理风险，科学开发项目</h1>--%>
            <%--<p>通过软件项目风险管理系统，开发者可以将项目中发现的风险及时记录报告，管理者可以跟踪查看风险，从而达到规避风险的作用。</p>--%>
            <%--<p><a class="btn btn-primary btn-lg" href="#" role="button" style="width:150px">加入我们</a></p>--%>
        <%--</div>--%>
    <%--</div>--%>
</rapid:override>

<%@ include file="/base.jsp" %>
