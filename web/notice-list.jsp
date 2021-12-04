<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script  src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.css?t=1598935358940" media="all">
    <style>
        body{margin: 10px;}
        .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    </style>
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <div class="layui-inline" style="margin-left: -70px;">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-inline">
                <input type="text" name="id" id="id" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="margin-left: -50px;">
            <label class="layui-form-label">公告标题</label>
            <div class="layui-input-inline">
                <input type="text" name="title" id="title" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <button type="submit" class="layui-btn layui-btn-normal" lay-submit="" lay-filter="demo2">搜索</button>
        </div>
    </div>
</form>
<table class="layui-hide" id="demo" lay-filter="demo"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


</div>
<script>
    layui.config({
        version: '1598935358940' //为了更新 js 缓存，可忽略
    });

    layui.use(['form','laydate','layedit', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider','jquery'], function(){
        var laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,element = layui.element //元素操作
            ,$ =layui.jquery
            ,form =layui.form;

        var layedit = layui.layedit;
        var build = layedit.build('content'); //建立编辑器

        //监听Tab切换
        element.on('tab(demo)', function(data){
            layer.tips('切换了 '+ data.index +'：'+ this.innerHTML, this, {
                tips: 1
            });
        });

        //执行一个 table 实例
        table.render({
            elem: '#demo'
            ,id:'testReload'
            ,height: 620
            ,url: '${pageContext.request.contextPath}/selectNotice.do' //数据接口
            ,title: '公告表'
            ,page: true //开启分页
            ,method: 'post'
            ,toolbar: true //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'id', title: 'Id', width:'15%'}
                ,{field: 'userid', title: '发送人', width: '15%'}
                ,{field: 'name', title: '主题', width:'15%'}
                ,{field: 'title', title: '标题', width:'15%'}
                ,{field:'content', title:'内容', width:'15%',edit:true}
                ,{field: 'remark', title: '备注', width:'15%',edit:true}
                ,{fixed: 'right',width: 165,align:'center',toolbar:'#barDemo'}
            ]]
        });

        table.on('tool(demo)',function (obj) {
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('确定删除吗', function(index) {
                    obj.del();
                    var json = {"id":data.id};
                    $.post("deleteBynid.do",json,function (data) {
                        if(data!="0"){
                            layer.msg("删除成功")
                        }else{
                            layer.msg("删除失败")
                        }
                    })
                    layer.close(index);
                });
            }else if(obj.event === 'edit'){
                layer.confirm('确定修改吗',function(index) {   //点击弹出框的确定执行此函数
                    var json = {"json":JSON.stringify(data)};
                    $.post("updateNotice.do",json,function (data) {
                        if(data!="0"){
                            layer.msg("修改成功")
                        }else{
                            layer.msg("修改失败")
                        }
                    })
                    layer.close(index);
                });
            }
        });

        //监听提交
        form.on('submit(demo2)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            table.reload('testReload',{
                url:"selectByWhereNotice.do"
                ,where:{
                    id:data.field.id,
                    title:data.field.title
                }
                ,page:{
                    curr:1
                }
            })
            return false;
        });

        table.on('rowDouble(demo)',function (obj) {
            var data = obj.data;
            layer.alert("ID："+data.id+"<br/>发送人："+data.userid+"<br/>主题："+data.name+"<br/>标题："+data.title+"<br/>内容："+data.content+"<br/>备注："+data.remark,{
                title: '当前行数据'
            })
        })


        <%--/*监听搜索按钮*/--%>
        <%--$('#search').click(function () {--%>
        <%--    var deptname = $("#searchCon").val().toString();--%>
        <%--    table.reload('testReload', {--%>
        <%--        url: '${pageContext.request.contextPath}/notice/search.do'--%>
        <%--        ,where: { //设定异步数据接口的额外参数，任意设--%>
        <%--            searchName: deptname--%>
        <%--        }--%>
        <%--        , page: {--%>
        <%--            curr: 1 //重新从第 1 页开始--%>
        <%--        },--%>
        <%--    })--%>
        <%--});--%>

        //监听头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                    layer.msg('添加');
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                        layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
                    }
                    break;
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        layer.msg('删除');
                    }
                    break;
            };
        });

        <%--//监听行工具事件--%>
        <%--table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"--%>
        <%--    var data = obj.data //获得当前行数据--%>
        <%--        ,layEvent = obj.event; //获得 lay-event 对应的值--%>
        <%--    if(layEvent === 'edit'){--%>
        <%--        $("#username").val(data.username);--%>
        <%--        $("#name").val(data.name);--%>
        <%--        $("#title").val(data.title);--%>
        <%--        $("#content").val(data.content);--%>
        <%--        $("#remark").val(data.remark);--%>
        <%--        layer.open({--%>
        <%--            type: 1--%>
        <%--            ,title: ['修改信息','font-size:20px'] //不显示标题栏--%>
        <%--            ,area: ['1000px','700px']--%>
        <%--            ,shadeClose:true--%>
        <%--            ,content:$("#div1")--%>
        <%--            ,btn:['提交']--%>
        <%--            ,btn1:function () {--%>
        <%--                var id = data.id--%>
        <%--                var username = $("#username").val();--%>
        <%--                var name     = $("#name").val();--%>
        <%--                var title    = $("#title").val();--%>
        <%--                var content  = layedit.getContent(build);--%>
        <%--                var remark   = $("#remark").val();--%>
        <%--                var json = {'id':id,'username':username,'name':name,'title':title,'content':content,'remark':remark};--%>
        <%--                //修改功能--%>
        <%--                console.log(json)--%>
        <%--                $.ajax({--%>
        <%--                    url:"${pageContext.request.contextPath}/notice/edit.do",--%>
        <%--                    type:"post",--%>
        <%--                    async : true,--%>
        <%--                    contentType: "application/json; charset=utf-8",--%>
        <%--                    data : JSON.stringify(json),--%>
        <%--                    dataType : 'json',--%>
        <%--                    success : function(exitFlag) {--%>
        <%--                        if(exitFlag){--%>
        <%--                            var deptname = $("#searchCon").val().toString();--%>
        <%--                            table.reload('testReload', {--%>
        <%--                                url: '${pageContext.request.contextPath}/notice/search.do'--%>
        <%--                                ,where: { //设定异步数据接口的额外参数，任意设--%>
        <%--                                    searchName: deptname--%>
        <%--                                }--%>
        <%--                                , page: {--%>
        <%--                                    curr: 1 //重新从第 1 页开始--%>
        <%--                                },--%>
        <%--                            })--%>
        <%--                            layer.closeAll();--%>
        <%--                        }else{--%>
        <%--                            layer.msg("修改失败",{icon:2})--%>
        <%--                        }--%>

        <%--                    }--%>
        <%--                })--%>

        <%--            }--%>
        <%--            ,cancel:function () {--%>
        <%--                layer.closeAll();--%>
        <%--            }--%>
        <%--            ,anim:0--%>
        <%--        });--%>
        <%--    } else if(layEvent === 'del'){--%>

        <%--        //删除功能--%>
        <%--        layer.confirm('是否确定删除公告：'+data.title+' 的数据', function(index){--%>
        <%--            obj.del(); //删除对应行（tr）的DOM结构--%>
        <%--            layer.close(index);--%>
        <%--            //向服务端发送删除指令--%>
        <%--            var json={'id':data.id}--%>
        <%--            $.post("${pageContext.request.contextPath}/notice/delete.do",json,function (deleteFlag,textStatus) {--%>
        <%--                if(deleteFlag){--%>
        <%--                    var deptname = $("#searchCon").val().toString();--%>
        <%--                    table.reload('testReload', {--%>
        <%--                        url: '${pageContext.request.contextPath}/notice/search.do'--%>
        <%--                        ,where: { //设定异步数据接口的额外参数，任意设--%>
        <%--                            searchName: deptname--%>
        <%--                        }--%>
        <%--                        , page: {--%>
        <%--                            curr: 1 //重新从第 1 页开始--%>
        <%--                        },--%>
        <%--                    })--%>
        <%--                }else{--%>
        <%--                    layer.msg("删除失败",{icon:2})--%>
        <%--                }--%>
        <%--            })--%>
        <%--        });--%>
        <%--    }--%>
        <%--});--%>

        //执行一个轮播实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,height: 200
            ,arrow: 'none' //不显示箭头
            ,anim: 'fade' //切换动画方式
        });

        //分页
        laypage.render({
            elem: 'pageDemo' //分页容器的id
            ,count: 100 //总页数
            ,skin: '#1E9FFF' //自定义选中色值
            //,skip: true //开启跳页
            ,jump: function(obj, first){
                if(!first){
                    layer.msg('第'+ obj.curr +'页', {offset: 'b'});
                }
            }
        });

    });


</script>

</body>
</html>

