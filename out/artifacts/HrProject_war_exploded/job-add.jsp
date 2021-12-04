<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script  src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<div class="layui-card">
    <div class="layui-card-header" style="background-color:#009688;color: #FFFFFF" >职位添加</div>
    <div class="layui-card-body" style="height:auto;width: 500px;margin-left: 450px;">
        <form class="layui-form layui-form-pane">
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i> 职位名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="jname" id="jname" lay-verify="required|jobcheck" placeholder="请输入职位名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i>备注</label>
                <div class="layui-input-inline">
                    <input type="text" name="jremark" id="jremark" lay-verify="required" placeholder="请输入备注" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" >
                <div class="layui-input-block "style="margin-left: 80px;">
                    <button class="layui-btn" lay-submit lay-filter="formDemo" type="submit">添加</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    layui.use('form', function(){
        var form = layui.form;
        var $ = layui.jquery;


        form.verify({
            jobcheck:function (value) {
                var dname = $("#jname").val();
                var json = {'jname':dname};
                var flag = false;
                $.ajaxSettings.async = false; //设置ajax同步
                $.post("jobCheck.do",json,function (data) {
                    if(data=="1"){
                        flag = true;
                    }
                });
                if (flag){
                    return "已有该职位";
                }
            }
        })


        //监听提交
        form.on('submit(formDemo)', function(data) {

            var json = {"json": JSON.stringify(data.field)}
            $.post("addJob.do", json, function (data) {
                if (data == "1") {
                    layer.msg("添加成功", {'icon': 1, 'time': 2000});
                } else {
                    layer.msg("添加失败", {'icon': 5, 'time': 2000});
                }
            })
            return false;
        })

        <%--//监听提交--%>
        <%--form.on('submit(formDemo)', function(){--%>
        <%--    // console.log(json);--%>
        <%--    var jobName =   $("#jobName").val();--%>
        <%--    var jobRemark = $("#jobRemark").val()--%>
        <%--    var json = {--%>
        <%--        'jname' : jobName,--%>
        <%--        'jremark' : jobRemark--%>
        <%--    }--%>
        <%--    //--%>
        <%--    $.post("${pageContext.request.contextPath}/job/addJob.do",json,function (addFlag,textstatus) {--%>

        <%--        if(addFlag=="true"){--%>
        <%--            $("#jobName").val("");--%>
        <%--            $("#jobRemark").val("")--%>
        <%--            layer.msg("部门添加成功",{"icon":1,"time":2000})--%>

        <%--        }else{--%>
        <%--            layer.msg("部门添加失败",{"icon":2,"time":2000})--%>
        <%--        }--%>
        <%--    });--%>
        <%--    return false;--%>
        <%--});--%>
    });
</script>
</body>
</html>
