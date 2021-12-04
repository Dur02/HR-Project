<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/20
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"></script>
</head>
<body>
<div class="layui-card" style="width: auto;height: auto;" >
    <div class="layui-card-header" style="background-color:#009688;color: #FFFFFF" >公告添加</div>
    <div class="layui-card-body" style="height:auto;">
        <form class="layui-form layui-form-pane">
            <div class="layui-form-item" style="margin-left: 400px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i> 主题</label>
                <div class="layui-input-inline">
                    <input type="text" name="name" id="name" lay-verify="required" placeholder="请输入公告主题" autocomplete="off" class="layui-input" style="width: 400px;">
                </div>
            </div>
            <div class="layui-form-item" style="margin-left: 400px;">
                <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i> 标题</label>
                <div class="layui-input-inline">
                    <input type="text" name="title" id="title" lay-verify="required" placeholder="请输入公告标题" autocomplete="off" class="layui-input" style="width: 400px;">
                </div>
            </div>

            <textarea id="container" name="content" style="width:100%;height: 300px;"></textarea>

            <div class="layui-form-item layui-form-text" style="width: auto">
                <label class="layui-form-label"><i class="layui-icon layui-icon-note"></i>备注</label>
                <div class="layui-input-block">
                    <textarea name="remark" id="remark" class="layui-textarea"></textarea>
                </div>
            </div>
            <div class="layui-form-item" >
                <div class="layui-input-block " style="margin-left: 550px;">
                    <button class="layui-btn" id="addBtn" lay-submit="" lay-filter="formDemo" type="submit">添加</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    var ue = UE.getEditor("container");  //建立编辑器


    layui.use(['form','layer','layedit'], function(){
        var form = layui.form;
        var $ = layui.jquery;
        var layer = layui.layer;
        var layedit = layui.layedit;
        // layedit.set({
        //     uploadImage: {
        //         url: '/notice/uploadConImage.do' //接口url
        //         ,type: 'post' //默认post
        //     }
        // });

        // var index = layedit.build('container');  //编辑器

        //监听提交
        form.on('submit(formDemo)', function(data){
            // var name = $("#name").val();
            // var title = $("#title").val();
            // var content = layedit.getContent(index);
            // var remark = $("#remark").val();
            // console.log(name)   //在用ueditor编辑器才能用ajax传数据到后台，不知为何，浏览器端的控制台看到json是有数据的
            // console.log(title)   //但传到后台却为null，于是换了编辑器和json数据的构造方法，就是注释的地方
            // console.log(content)  //后端使用的方法中一定要有code，msg，count，data等内容,是否因此才无法在后端获得前端构建的json数据呢？因为构建的数据不对
            // console.log(remark)
            // var json = {"name":name,"title":title,"content":content, "remark":remark};

            var json = {"json":JSON.stringify(data.field)};

            console.log(json);
            $.post("addNotice.do",json,function (data) {
                if(data!="0"){
                    layer.msg("公告添加成功",{"icon":1,"time":2000})
                }else{
                    layer.msg("公告添加失败",{"icon":2,"time":2000})
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
