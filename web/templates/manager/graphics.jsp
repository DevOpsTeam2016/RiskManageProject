<%--
  Created by IntelliJ IDEA.
  User: zsmy
  Date: 16/11/17
  Time: 上午10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">统计</rapid:override>

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
        <div id="main" style="height:400px"></div>
    </div>
</rapid:override>


<rapid:override name="loadJsFile">
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
    <script src="/static/js/manager/graphics.js"></script>
</rapid:override>
<%@ include file="/base.jsp" %>


