<%--
  Created by IntelliJ IDEA.
  User: J
  Date: 2016/11/8
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<html>
    <head>
        <link rel="stylesheet" href="/static/css/gem_form.css">
        <link rel="stylesheet" href="/static/css/bootstrap.min.css">
        <rapid:block name="loadCssFile"></rapid:block>

        <title>风险管理 - <rapid:block name="title"></rapid:block></title>
    </head>
    <body>
        <rapid:block name="nav">
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
        </rapid:block>
        <rapid:block name="content"></rapid:block>
    </body>
</html>

<script src="/static/js/jquery-3.1.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<rapid:block name="loadJsFile"></rapid:block>