<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">登录</rapid:override>

<rapid:override name="content" >
    <div style="width: 50%; margin-left: 25%;margin-top: 200px;padding: 30px 70px 10px 30px" class="panel panel-default">
        <s:form class="form-horizontal" role="form"  name='login' onsubmit="return validateForm( );" action="login" method="POST">
            <div class="form-group">
                <label for="username" class="col-sm-2 control-label">账号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="username" name="username" placeholder="账号">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="password" name="password" placeholder="密码">
                </div>
            </div>
            <s:if test="#session.message != null">
                <div id="message">
                    <%=session.getAttribute("message")%>
                </div>
            </s:if>
            <div class="form-group">
                <div class="col-sm-offset-9 col-sm-3">
                    <input class="form-control" type="submit" name="submit" style="width: 100%;height: 40px;">
                </div>
            </div>
        </s:form>
    </div>
</rapid:override>

<rapid:override name="loadJsFile">
    <script type="text/javascript">
        function validateForm(){
            if(document.login.acc.value == ""){ //通过form名来获取form
                alert("please input the title!");
                document.reply.title.focus();
                return false;
            }
            return true;
        }
    </script>
</rapid:override>

<%@ include file="/base.jsp" %>