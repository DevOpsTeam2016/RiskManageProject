<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2016/11/8
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">管理者主页</rapid:override>

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
                                    <a href="/login" class="fg-white1 fg-hover-yellow">退出登录</a>
                                </li>
                            </ul>

                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <div class="row">
        <div class="list-group col-sm-4 col-sm-offset-4" style="padding-top: 10px">
        <s:iterator value="riskList">
            <a  class="list-group-item" href="/manage/risk?id=<s:property value="id"></s:property>"><s:property value="id"></s:property></a>
            <s:property value="project.name"></s:property>
            <s:property value="content"></s:property>
            <s:property value="possibility"></s:property>
            <s:property value="effect"></s:property>
            <s:property value="threshold"></s:property>
            <s:property value="creator.name"></s:property>
        </s:iterator>
        </div>
    </div>
</rapid:override>

<%@ include file="/base.jsp" %>
