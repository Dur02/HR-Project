<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script  src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<form class="layui-form layui-form-pane" style="margin-left: 100px;margin-top: 60px;">
    <div class="layui-form-item" style="padding-left: 100px;">
        <label class="layui-form-label"><i class="layui-icon layui-icon-face-smile-b"></i>登录账号</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" name="loginId" id="loginId"  disabled="disabled" value="${user.id}" >
        </div>
    </div>
    <div class="layui-form-item" style="padding-left: 100px;">
        <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i> 姓名</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" name="username" id="username"  disabled="disabled" value="${user.username}" >
        </div>
    </div>
    <div class="layui-form-item" style="padding-left: 100px;">
        <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i>密码</label>
        <div class="layui-input-inline">
            <input class="layui-input" type="text" name="password" id="password" disabled="disabled" value=${user.password}  >
        </div>
    </div>

    <div class="layui-form-item" style="padding-left: 100px;">
        <label class="layui-form-label"><i class="layui-icon layui-icon-cellphone"></i>手机</label>
        <div class="layui-input-inline">
            <input  class="layui-input" type="text" name="phone" disabled="disabled" id="phone" value=${user.phone} >
        </div>
    </div>
    <div class="layui-form-item" style="padding-left: 100px;">
        <label class="layui-form-label"><i class="layui-icon layui-icon-user"></i>角色</label>
        <div class="layui-input-inline" >
            <input class="layui-input" type="text" name="" id="role" disabled="disabled" value=${user.roleId} >
        </div>
    </div>
    <div class="layui-form-item layui-form-text" style="width: 500px">
        <label class="layui-form-label"><i class="layui-icon layui-icon-note"></i>备注</label>
        <div class="layui-input-block">
            <textarea  class="layui-textarea" disabled="disabled" id="remark" name="remark" value=${user.remark} ></textarea>
        </div>
    </div>
</form>
</body>
</html>

