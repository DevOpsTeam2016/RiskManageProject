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
    <div id="createProjectModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">创建项目</h4>
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
    <button class="form-control" name="createProject" data-toggle="modal" data-target="#createProjectModal">创建项目</button>

    <s:iterator value="projectList">
        <s:property value="name"></s:property>
    </s:iterator>
</rapid:override>

<%@ include file="/base.jsp" %>
