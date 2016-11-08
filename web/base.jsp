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
        <rapid:block name="content"></rapid:block>
    </body>
</html>

<script src="/static/js/jquery-3.1.1.min.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
<rapid:block name="loadJsFile"></rapid:block>