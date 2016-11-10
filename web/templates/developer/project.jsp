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
                                    <a href="../login/login.jsp" class="fg-white1 fg-hover-yellow">退出登录</a>
                                </li>
                            </ul>

                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

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

    <div class="row">
        <div class="list-group col-sm-4 col-lg-offset-4" style="padding-top: 10px">
        <s:iterator value="riskList">
            <a  class="list-group-item">
                <s:property value="id"></s:property>
                <s:property value="content"></s:property>
                <s:property value="possibility"></s:property>
                <s:property value="effect"></s:property>
                <s:property value="threshold"></s:property>
                <s:property value="creator"></s:property>
                <s:if test="tracker == null">
                <select name="assignRisk">
                    <option value="">--未委派--</option>
                </select>
                </s:if>
                <s:else>
                    <s:property value="tracker"></s:property>
                </s:else>
                <s:property value="timestamp"></s:property>
            </a>
        </s:iterator>
        </div>
    </div>
</rapid:override>

<%@ include file="/base.jsp" %>
