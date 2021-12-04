<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script  src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<div class="layui-card">
    <div class="layui-card-header" style="background-color:#009688;color: #FFFFFF" >员工添加</div>
    <div class="layui-card-body" style="height:auto;width: 500px;margin-left: 350px;">
        <form class="layui-form layui-form-pane">
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i>   姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" id="name" required lay-verify="required|namecheck"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-chart-screen"></i>   部门</label>
                <div class="layui-input-inline">
                    <input type="text" name="deptId" id="deptId" lay-verify="required"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-read"></i>   职位</label>
                <div class="layui-input-inline">
                    <input type="text" name="jobId" id="jobId" lay-verify="required"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-template-1"></i>   银行卡号</label>
                <div class="layui-input-inline">
                    <input type="text" name="cardId" id="cardId" lay-verify="required"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-face-surprised"></i>   邮政编码</label>
                <div class="layui-input-inline">
                    <input type="text" name="postCode" id="postCode" lay-verify="required"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-home"></i>   地址</label>
                <div class="layui-input-inline">
                    <input type="text" name="address" id="address" lay-verify="required"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-dialogue"></i>   家庭电话</label>
                <div class="layui-input-inline">
                    <input type="text" name="tel" id="tel" lay-verify=""  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-cellphone"></i>手机号码</label>
                <div class="layui-input-inline">
                    <input type="text" name="phone" id="phone" lay-verify="required|phone"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-login-qq"></i>   QQ号</label>
                <div class="layui-input-inline">
                    <input type="text" name="qqNum" id="qqNum" lay-verify=""  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-login-qq"></i>   QQ邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" name="email" id="email" lay-verify=""  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-female"></i>   性别</label>
                <div class="layui-input-inline" >
                    <select name="sex" id="sex" lay-verify="required">
                        <option value="" selected></option>
                        <option value="1">男</option>
                        <option value="2">女</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-flag"></i>   政治面貌</label>
                <div class="layui-input-inline" >
                    <select name="party" id="party" lay-verify="required">
                        <option value="" selected></option>
                        <option value="党员">党员</option>
                        <option value="群众">群众</option>
                        <option value="共青团员">团员</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-tread"></i>出生日期</label><!-- 注意：这一层元素并不是必须的 -->
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="birthday" name="birthday">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-water"></i>   民族</label>
                <div class="layui-input-inline">
                    <input type="text" name="race" id="race" lay-verify="required"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-snowflake"></i>学历</label>
                <div class="layui-input-inline" >
                    <select name="education" id="education" name="education" lay-verify="required">
                        <option value=""></option>
                        <option value="高中及以下">高中及以下</option>
                        <option value="专科">专科</option>
                        <option value="本科">本科</option>
                        <option value="硕士">硕士</option>
                        <option value="博士">博士</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-app"></i>   专业</label>
                <div class="layui-input-inline">
                    <input type="text" name="speciality" id="speciality" lay-verify="required"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 100px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-face-smile"></i>   爱好</label>
                <div class="layui-input-inline">
                    <input type="text" name="hobby" id="hobby" lay-verify="" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text" style="width: 500px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-note"></i>备注</label>
                <div class="layui-input-block">
                    <textarea name="remark" id="remark" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 80px;">
                <div class="layui-input-block " style="align-content: center">
                    <button class="layui-btn" lay-submit lay-filter="formDemo" type="submit">添加</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use(['form','laydate','layer'], function(){
        var form = layui.form;
        var $ = layui.jquery;
        var laydate = layui.laydate;
        var layer = layui.layer


        form.verify({
            namecheck:function (value) {
                var name = $("#name").val();
                var json = {'name':name};
                var flag = false;
                $.ajaxSettings.async = false; //设置ajax同步
                $.post("nameCheck.do",json,function (data) {
                    if(data=="1"){
                        flag = true;
                    }
                });
                if (flag){
                    return "已有该员工";
                }
            }
            // ,
            // checkphone:function (value) {
            //     var phone = $("#phone").val();
            //     alert(phone);
            //     var json = {'phone':phone};
            //     var flag = false;
            //     $.ajaxSettings.async = false; //设置ajax同步
            //     $.post("checkphone.do",json,function (data) {
            //         if(data=="1"){
            //             flag = true;
            //             // return "该手机号已被注册";
            //         }
            //     });
            //     if (flag){
            //         return "该手机号已被登记";
            //     }
            // }
        });

        //监听提交
        form.on('submit(formDemo)', function(data){

            var json = {"json":JSON.stringify(data.field)}
            $.post("addEmployee.do",json,function (data) {
                if(data == "1"){
                    layer.msg("添加成功",{'icon':1,'time':2000});
                }else {
                    layer.msg("添加失败",{'icon':5,'time':2000});
                }
            })
            return false;
        });

        <%--laydate.render({--%>
        <%--    elem: '#birthday' //指定元素--%>
        <%--    ,type: 'datetime'--%>
        <%--});--%>

        <%--$.ajax({--%>
        <%--    url: '/job/find.do',--%>
        <%--    dataType: 'json',--%>
        <%--    type: 'post',--%>
        <%--    success: function(data) {--%>
        <%--        if (data!== null) {--%>
        <%--            console.log(data)--%>
        <%--            $("#job_id").empty();--%>
        <%--            $("#job_id").append(new Option("请选择职位", "0"));--%>
        <%--            $.each(data, function(index, item) {--%>
        <%--                console.log("index:"+index)--%>
        <%--                console.log("item:"+item.rname)--%>

        <%--                $('#job_id').append(new Option(item.jname,item.jid));--%>
        <%--            });--%>
        <%--        } else {--%>
        <%--            $("#job_id").append(new Option("暂无数据", ""));--%>
        <%--        }--%>
        <%--        //重新渲染--%>
        <%--        form.render("select");--%>
        <%--    }--%>
        <%--});--%>

        <%--$.ajax({--%>
        <%--    url: '/dept/find.do',--%>
        <%--    dataType: 'json',--%>
        <%--    type: 'post',--%>
        <%--    success: function(data) {--%>
        <%--        if (data!== null) {--%>
        <%--            console.log(data)--%>
        <%--            $("#dept_id").empty();--%>
        <%--            $("#dept_id").append(new Option("请选择部门", "0"));--%>
        <%--            $.each(data, function(index, item) {--%>
        <%--                console.log("index:"+index)--%>
        <%--                console.log("item:"+item.did)--%>

        <%--                $('#dept_id').append(new Option(item.dname,item.did));--%>
        <%--            });--%>
        <%--        } else {--%>
        <%--            $("#dept_id").append(new Option("暂无数据", ""));--%>
        <%--        }--%>
        <%--        //重新渲染--%>
        <%--        form.render("select");--%>
        <%--    }--%>
        <%--});--%>
        <%--//监听提交--%>
        <%--form.on('submit(formDemo)', function(){--%>
        <%--    // console.log(json);--%>

        <%--    var name      = $("#name").val();--%>
        <%--    var dept_id  =  $("#dept_id").val();--%>
        <%--    var job_id   =  $("#job_id").val();--%>
        <%--    var card_id   = $("#card_id").val();--%>
        <%--    var post_code = $("#post_code").val();--%>
        <%--    var address   = $("#address").val();--%>
        <%--    var tel       = $("#tel").val();--%>
        <%--    var phone     = $("#phone").val();--%>
        <%--    var qq_num    = $("#qq_num").val();--%>
        <%--    var email     = $("#email").val();--%>
        <%--    var sex       = $("#sex").val();--%>
        <%--    var party     = $("#party").val();--%>
        <%--    var birthday      = $("#birthday").val();--%>
        <%--    var race      = $("#race").val();--%>
        <%--    var education = $("#education").val();--%>
        <%--    var speciality= $("#speciality").val();--%>
        <%--    var hobby     = $("#hobby").val();--%>
        <%--    var remark    = $("#remark").val();--%>
        <%--    var json = {--%>
        <%--        'name': name,--%>
        <%--        'dept_id': dept_id,--%>
        <%--        'job_id': job_id,--%>
        <%--        'card_id': card_id,--%>
        <%--        'post_code': post_code,--%>
        <%--        'address': address,--%>
        <%--        'tel': tel,--%>
        <%--        'phone':phone,--%>
        <%--        'qq_num': qq_num,--%>
        <%--        'email': email,--%>
        <%--        'sex': sex,--%>
        <%--        'party': party,--%>
        <%--        'birthdayStr':birthday,--%>
        <%--        'race': race,--%>
        <%--        'education': education,--%>
        <%--        'speciality': speciality,--%>
        <%--        'hobby': hobby,--%>
        <%--        'remark': remark--%>
        <%--    };--%>

        <%--    console.log(json)--%>
        <%--    var data =JSON.stringify(json)--%>
        <%--    console.log(JSON.stringify(json))--%>
        <%--    /*--%>
        <%--                $.post("${pageContext.request.contextPath}/employee/addEmployee.do",json,function (addFlag) {--%>
        <%--        if(addFlag=="true"){--%>
        <%--            layer.msg("员工添加成功",{"icon":1,"time":2000})--%>
        <%--        }else{--%>
        <%--            layer.msg("员工添加失败",{"icon":2,"time":2000})--%>
        <%--        }--%>
        <%--    });*/--%>
        <%--    return false;--%>
        <%--});--%>
    });
</script>
</body>
</html>
