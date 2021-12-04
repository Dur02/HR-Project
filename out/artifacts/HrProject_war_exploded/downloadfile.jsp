<%--
  Created by IntelliJ IDEA.
  User: 12240
  Date: 8/7/2021
  Time: 上午 2:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script  src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">下载</a>
    <a class="layui-btn layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use(['table'], function(){
        var table = layui.table;
        var $ = layui.jquery;

        table.render({
            elem: '#test'
            ,height: 620
            ,url:'${pageContext.request.contextPath}/selectDownload.do'
            ,toolbar: true //开启头部工具栏，并为其绑定左侧模板
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'filename', title:'文件名', width:'40%'}
                ,{field:'userid', title:'上传者', width:'20%'}
                ,{field:'uploaddate', title:'上传时间', width:'25%',templet : "<div>{{layui.util.toDateString(d.uploaddate, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', }
            ]]
            ,page: true
        });

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;

                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                //修改a标签的地址，使其跳转到下载控制器
                $(this).attr("href","${pageContext.request.contextPath}/download.do?filename="+data.filename);
            }
        });
    });
</script>

</body>
</html>
