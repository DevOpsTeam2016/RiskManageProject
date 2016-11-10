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
    <div class="menu">
        <nav class='navbar navbar-default' role='navigation'>
            <div class='container-fluid'>
                <div class='navbar-header'><a class='navbar-brand branding'>风险管理</a></div>
                <div class='collapse navbar-collapse' id='bs-example-navbar-collapse-1'>
                    <ul class='nav navbar-nav'id='nav_left'>
                        <li id="menu1">
                            <a href="#">首页</a>
                        </li>
                        <li id="menu2" class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                项目
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" data-role="menu">
                                <li id="menu3">
                                    <a href="#">
                                        新建
                                    </a>
                                </li>
                            </ul>
                        </li>

                    </ul>
                    <form class='navbar-form navbar-left' role='search'>
                    </form>
                    <ul class='nav navbar-nav navbar-right'>
                        <li class='dropdown'>
                            <a id='text' href='#' class='dropdown-toggle' data-toggle='dropdown'>
                                <span id="icon" class="mif-cog">账号管理</span>
                                <span class="caret"></span>
                            </a>
                            <ul class='dropdown-menu' role='menu' id='nav_right'>
                                <li>
                                    <a href="login.html" class="fg-white1 fg-hover-yellow">退出登录</a>
                                </li>
                            </ul>

                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <!-- Modal -->
    <div id="createProjectModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel" >创建项目 </h4>
                </div>
                <div class="modal-body">
                    <form action="/developer/create_project" method="post">
                        <div class="form-group">
                            <input type="text" class="form-control" name="name" placeholder="项目名" required/>
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
    <button class="form-control" name="createProject" data-toggle="modal" data-target="#createProjectModal" style="width: 50%;margin-left: 25%">创建项目 <span class="glyphicon glyphicon-plus" style="color: deepskyblue"></span></button>

    <div class="row">
        <div class="list-group col-sm-2" style="padding-left: 20px;padding-top: 10px">
            <s:iterator value="projectList">
                <s:property value="id"></s:property>
                <a  class="list-group-item" href="/developer/project?id=<s:property value="id" ></s:property>">
                    <s:property value="name"></s:property>
                </a>
                <s:property value="language"></s:property>
                <s:property value="people"></s:property>
                <s:if test="<s:property value=\"type\"></s:property> == 0">
                    小型
                </s:if>
                <s:elseif test="<s:property value=\"type\"></s:property> == 1">
                    中型
                </s:elseif>
                <s:else>大型</s:else>
                <s:date name="timestamp" format="yyyy-MM-dd HH:mm:ss"></s:date>
            </s:iterator>
        </div>
        <div class="jumbotron col-sm-8 col-sm-offset-1" style="margin-top:60px;padding-left:30px">
            <h1>管理风险，科学开发项目</h1>
            <p>通过软件项目风险管理系统，开发者可以将项目中发现的风险及时记录报告，管理者可以跟踪查看风险，从而达到规避风险的作用。</p>
            <p><a class="btn btn-primary btn-lg" href="#" role="button" style="width:150px">加入我们</a></p>
        </div>
    </div>
</rapid:override>

<%@ include file="/base.jsp" %>
