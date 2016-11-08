<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>

<rapid:override name="title">登录</rapid:override>

<rapid:override name="content">
    <div style="width: 50%; margin-left: 25%;margin-top: 200px;padding: 30px 30px 30px 30px" class="panel panel-default">
        <form class="form-horizontal" role="form"  name='login' onsubmit="return validateForm( );" action="coder.html">
            <div class="form-group">
                <label for="account" class="col-sm-2 control-label">账号</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="account" name="acc" placeholder="账号">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="password" placeholder="密码">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">类型</label>
                <div class="col-sm-10">
                    <div>
                        <label class="checkbox-inline">
                            <input type="radio" name="type" id="type1" value="option1" checked>开发者
                        </label>
                        <label class="checkbox-inline">
                            <input type="radio" name="type" id="type2" value="option2" >管理者
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-10 col-sm-2">
                    <input type="submit" name="submit">
                </div>
            </div>
        </form>
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