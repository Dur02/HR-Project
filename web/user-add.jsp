<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script  src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<div class="layui-card">
    <div class="layui-card-header" style="background-color:#009688;color: #FFFFFF" >用户添加</div>
    <div class="layui-card-body" style="height:auto;width: 500px;margin-left: 350px;">
        <form class="layui-form layui-form-pane" title="用户添加" method="post">
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-cellphone"></i>手机</label>
                <div class="layui-input-inline">
                    <input type="text" name="phone" id="phone" lay-verify="required|phone|phonecheck" placeholder="请输入手机" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i>密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" id="pw1" lay-verify="required|pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i>确认密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" id="pw2" lay-verify="required|equal" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i>   姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="username" id="username" lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text" style="width: 500px">
                <label class="layui-form-label"><i class="layui-icon layui-icon-note"></i>备注</label>
                <div class="layui-input-block">
                    <textarea name="remark" id="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-vercode"></i>验证码</label>
                <div class="layui-input-inline">
                    <input type="text" name="checkcode" id="checkcode" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <a href="javascript:void(0);" id="change2" style="margin-left: 220px;"><img src="CheckCodeUtil" id="codeImg2" style="border:1px solid #000;width: 80px;height: 40px;margin-bottom: 10px;"></a>
            <div class="layui-form-item" style="margin-left: 80px;">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="formDemo" type="submit">添加</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>
    //刷新验证码
    $(function () {
        //点击事件
        $("#change2").click(function () {
            //修改图片的src属性
            $("#codeImg2").attr("src","CheckCodeUtil?time="+new Date().getTime());
        })
    })
</script>

<script charset="GB2312" language="JavaScript" type="text/javascript">
    //Demo
    layui.use(['form','layer'], function(){
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;

        form.verify({
            pass:[/^[\S]{6,12}$/,'密码必须要是6-12位']
            ,
            equal:function(value){
                if ($('input[name=password]').val() !== value){
                    return "两次输入的密码不一致";
                }
            }
            ,
            phonecheck:function (value) {
                var phone = $("#phone").val();
                var json = {'phone':phone};
                var flag = false;
                $.ajaxSettings.async = false; //设置ajax同步
                $.post("phoneCheck.do",json,function (data) {
                    if(data=="1"){
                        flag = true;
                        // return "该手机号已被注册";
                    }
                });
                if (flag){
                    return "该手机号已被注册";
                }
            }
        })

        form.on('submit(formDemo)', function(data){
            // layer.alert(JSON.stringify(data.field),{
            //     title: '最终提交的信息'
            // })
            var checkcode = data.field.checkcode;
            var json = {"checkcode": checkcode,"json":JSON.stringify(data.field)};
            $.post("register.do",json,function (data) {
                if (data == "1"){
                    layer.msg("注册成功",{'icon':1,'time':2000});
                }else if (data == "-1"){
                    layer.msg("验证码错误",{'icon':5,'time':2000});
                }else {
                    layer.msg("注册失败",{'icon':5,'time':2000});
                }
            })
            return false;
        });


        <%--// 监听提交--%>
        <%--form.on('submit(formDemo)', function(data){--%>
        <%--    var loginId =  $("#loginId").val();--%>
        <%--    var username = $("#username").val();--%>
        <%--    var password = $("#pw2").val();--%>
        <%--    var phone =    $("#phone").val();--%>
        <%--    var role_idStr=$("#role_idStr").val();--%>
        <%--    var remark =   $("#remark").val();--%>
        <%--    var mail =     $('#mail').val();--%>
        <%--    var json = {'loginId':loginId,'username':username,'password':password,'phone':phone,'role_idStr':role_idStr,'remark':remark,'mail':mail};--%>
        <%--    $.post("${pageContext.request.contextPath}/register/finishRegister.do",json,function (flag) {--%>
        <%--        if(flag== "true"){--%>
        <%--            layer.msg("已向你的邮箱发送激活邮件，请前往激活",{"icon":1,"time":2000});--%>
        <%--            $("#loginId").val('');--%>
        <%--            $("#username").val('');--%>
        <%--            $("#pw2").val('');--%>
        <%--            $("#phone").val('');--%>
        <%--            $("#role_idStr").val('')--%>
        <%--            $("#remark").val('')--%>
        <%--            $('#mail').val('')--%>
        <%--        }else{--%>
        <%--            layer.msg("注册失败",{"icon":2,"time":2000});--%>
        <%--        }--%>
        <%--    })--%>
        <%--    return false;--%>
        <%--});--%>



        <%--$("#loginId").blur(function () {--%>
        <%--    var loginId = $(this).val();--%>

        <%--    $.get("${pageContext.request.contextPath}/register/findUserByLoginId.do",{loginId:loginId},function (data) {--%>

        <%--        data = JSON.parse(data);--%>

        <%--        if(data.userExsit === true){--%>

        <%--            layer.msg("用户已存在",{"icon":2,"time":2000});--%>

        <%--        }else{--%>

        <%--        }--%>
        <%--    });--%>

        <%--});--%>




        // $("#btnSubmit").click(function () {
        //
        // });

        // $("#pw2").blur(function () {
        //     var pw1 = $("#pw1").val();
        //     var pw2 = $("#pw2").val();
        //     if(pw1 != pw2){
        //         layer.msg("两次密码不一样",{"icon":2,"time":2000});
        //         return false;
        //     }
        //     return true;
        // })
    });

</script>




<%--<script>--%>
<%--    //Demo--%>
<%--    layui.use('form', function(){--%>
<%--        var form = layui.form;--%>
<%--        var $ = layui.jquery;--%>
<%--        form.verify({--%>
<%--            pass:[/^[\S]{6,12}$/,'密码必须要是6-12位']--%>

<%--        })--%>
<%--        $.ajax({--%>
<%--            url: '/role/find.do',--%>
<%--            dataType: 'json',--%>
<%--            type: 'post',--%>
<%--            success: function(data) {--%>
<%--                if (data!== null) {--%>
<%--                    console.log(data)--%>
<%--                    $("#role_idStr").empty();--%>
<%--                    $("#role_idStr").append(new Option("请选择角色", "0"));--%>
<%--                    $.each(data, function(index, item) {--%>
<%--                        console.log("index:"+index)--%>
<%--                        console.log("item:"+item.rname)--%>

<%--                        $('#role_idStr').append(new Option(item.rname,item.rid));--%>
<%--                    });--%>
<%--                } else {--%>
<%--                    $("#role_idStr").append(new Option("暂无数据", ""));--%>
<%--                }--%>
<%--                //重新渲染--%>
<%--                form.render("select");--%>
<%--            }--%>
<%--        });--%>

<%--        form.on('submit(formDemo)', function(data){--%>
<%--            var loginId =  $("#loginId").val();--%>
<%--            var username = $("#username").val();--%>
<%--            var password = $("#pw2").val();--%>
<%--            var phone =    $("#phone").val();--%>
<%--            var role_idStr=$("#role_idStr").val();--%>
<%--            var remark =   $("#remark").val();--%>
<%--            var json = {'loginId':loginId,'username':username,'password':password,'phone':phone,'role_idStr':role_idStr,'remark':remark};--%>
<%--            console.log(json)--%>
<%--            $.post("${pageContext.request.contextPath}/register/finishRegister.do",json,function (flag) {--%>
<%--                if(flag== "true"){--%>
<%--                    $("#loginId").val('');--%>
<%--                    $("#username").val('');--%>
<%--                    $("#pw2").val('');--%>
<%--                    $("#phone").val('');--%>
<%--                    $("#role_idStr").val('');--%>
<%--                    $("#remark").val('');--%>
<%--                    layer.msg("注册成功",{"icon":1,"time":2000});--%>

<%--                }else{--%>
<%--                    layer.msg("注册失败",{"icon":2,"time":2000});--%>
<%--                }--%>
<%--            })--%>
<%--            return false;--%>
<%--        });--%>
<%--        $("#username").blur(function () {--%>
<%--            var username = $(this).val();--%>
<%--            $.get("${pageContext.request.contextPath}/register/findUserByUsername.do",{username:username},function (data) {--%>

<%--                data = JSON.parse(data);--%>

<%--                if(data.userExsit === true){--%>
<%--                    layer.msg("用户已存在",{"icon":2,"time":2000});--%>
<%--                }else{--%>
<%--                }--%>
<%--            });--%>

<%--        });--%>

<%--        $("#pw2").blur(function () {--%>
<%--            var pw1 = $("#pw1").val();--%>
<%--            var pw2 = $("#pw2").val();--%>
<%--            if(pw1 != pw2){--%>
<%--                layer.msg("两次密码不一样",{"icon":2,"time":2000});--%>
<%--                $("#pw2").val("");--%>
<%--                return false;--%>
<%--            }--%>
<%--            return true;--%>
<%--        })--%>
<%--    });--%>

<%--</script>--%>
</body>
</html>
