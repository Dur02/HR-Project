<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script  src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
</head>
<body>
<div>
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
        <legend>拖拽上传</legend>
    </fieldset>

    <div class="layui-upload-drag" id="test10">
        <i class="layui-icon"></i>
        <p>点击上传，或将文件拖拽到此处</p>
        <div class="layui-hide" id="uploadDemoView">
            <hr>
            <img src="" alt="上传成功后渲染" style="max-width: 196px">
        </div>
    </div>
<script>
    layui.use(['upload', 'element', 'layer'], function() {
        var $ = layui.jquery
            , upload = layui.upload
            , element = layui.element
            , layer = layui.layer;

        //拖拽上传
        upload.render({
            elem: '#test10'
            , multiple:true  //支持多文件上传
            , size: 2097152000  //设置文件最大大小
            , url: '${pageContext.request.contextPath}/upload.do' //改成您自己的上传接口
            , accept:'file' //可上传所有文件类型
            , done: function (res) {
                if(res.code=='200'){
                    layer.msg('上传成功',{"icon":1});
                }else{
                    layer.msg('上传失败',{"icon":5});
                }
                //layui.$('#uploadDemoView').removeClass('layui-hide').find('img').attr('src', res.files.file);
                console.log(res)
            }
        });
    });
</script>

</html>

