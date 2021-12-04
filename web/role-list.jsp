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
    </style>
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <div class="layui-inline" style="margin-left: -70px;">
            <label class="layui-form-label">ID</label>
            <div class="layui-input-inline">
                <input type="text" id="rid" name="rid" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="margin-left: -50px;">
            <label class="layui-form-label">角色名称</label>
            <div class="layui-input-inline">
                <input type="text" id="rname" name="rname" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <button type="submit" class="layui-btn layui-btn-normal" lay-submit="" lay-filter="demo2">搜索</button>
        </div>
    </div>
</form>
<%--<div id="div1" style="display: none">--%>
<%--    <form class="layui-form layui-form-pane" >--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i> 角色名称</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="text" name="roleName" id="roleName" required lay-verify="required" placeholder="请输入角色名称" autocomplete="off" class="layui-input">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i>备注</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="text" name="roleRemark" id="roleRemark" required lay-verify="required" placeholder="请输入备注" autocomplete="off" class="layui-input">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>
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

    layui.use(['laydate','form', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider','jquery'], function(){
        var laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,element = layui.element //元素操作
            ,form = layui.form
            ,$ =layui.jquery

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
            ,url: '${pageContext.request.contextPath}/selectRole.do' //数据接口
            ,title: '角色表'
            ,page: true //开启分页
            ,method: 'post'
            ,toolbar: true //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'rid', title: 'ID', width:'20%'}
                ,{field: 'rname', title: '角色名', width:'30%'}
                ,{field: 'rremark', title: '备注', width: '30%',edit:true}
                ,{fixed: 'right',align:'center',toolbar:'#barDemo'}
            ]]
        });


        <%--/*监听搜索按钮*/--%>
        <%--$('#search').click(function () {--%>
        <%--    var deptname = $("#searchCon").val().toString();--%>
        <%--    table.reload('testReload', {--%>
        <%--        url: '${pageContext.request.contextPath}/role/search.do'--%>
        <%--        ,where: { //设定异步数据接口的额外参数，任意设--%>
        <%--            searchName: deptname--%>
        <%--        }--%>
        <%--        , page: {--%>
        <%--            curr: 1 //重新从第 1 页开始--%>
        <%--        },--%>
        <%--    })--%>
        <%--});--%>

        //监听提交
        form.on('submit(demo2)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            table.reload('testReload',{
                url:"selectByWhereRole.do"
                ,where:{
                    rid:data.field.rid,
                    rname:data.field.rname
                }
                ,page:{
                    curr:1
                }
            })
            return false;
        });

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

        table.on('tool(demo)',function (obj) {
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('确定删除吗', function(index) {
                    obj.del();
                    var json = {"rid":data.rid};
                    $.post("deleteByrid.do",json,function (data) {
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
                    $.post("updateRole.do",json,function (data) {
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

        table.on('rowDouble(demo)',function (obj) {
            var data = obj.data;
            layer.alert("ID："+data.rid+"<br/>角色名："+data.rname+"<br/>备注："+data.rremark,{
                title: '当前行数据'
            })
        })

        <%--//监听行工具事件--%>
        <%--table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"--%>
        <%--    var data = obj.data //获得当前行数据--%>
        <%--        ,layEvent = obj.event; //获得 lay-event 对应的值--%>
        <%--    if(layEvent === 'edit'){--%>
        <%--        $("#roleName").val(data.rname);--%>
        <%--        $("#roleRemark").val(data.rremark);--%>
        <%--        layer.open({--%>
        <%--            type: 1--%>
        <%--            ,title: ['修改信息','font-size:20px'] //不显示标题栏--%>
        <%--            ,area: ['700px','500px']--%>
        <%--            ,shadeClose:true--%>
        <%--            ,content:$("#div1")--%>
        <%--            ,btn:['提交']--%>
        <%--            ,btn1:function () {--%>
        <%--                var rid = data.rid;--%>
        <%--                var rname =   $("#roleName").val();--%>
        <%--                var rremark = $("#roleRemark").val();--%>
        <%--                var json = {'rid':rid,'rname':rname,'rremark':rremark};--%>
        <%--                //修改功能--%>
        <%--                $.ajax({--%>
        <%--                    url:"${pageContext.request.contextPath}/role/edit.do",--%>
        <%--                    type:"post",--%>
        <%--                    async : true,--%>
        <%--                    contentType: "application/json; charset=utf-8",--%>
        <%--                    data : JSON.stringify(json),--%>
        <%--                    dataType : 'json',--%>
        <%--                    success : function(exitFlag) {--%>
        <%--                        if(exitFlag){--%>

        <%--                            var deptname = $("#searchCon").val().toString();--%>
        <%--                            table.reload('testReload', {--%>
        <%--                                url: '${pageContext.request.contextPath}/role/search.do'--%>
        <%--                                ,where: { //设定异步数据接口的额外参数，任意设--%>
        <%--                                    searchName: deptname--%>
        <%--                                }--%>
        <%--                                , page: {--%>
        <%--                                    curr: 1 //重新从第 1 页开始--%>
        <%--                                },--%>
        <%--                            })--%>
        <%--                            layer.closeAll()--%>
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
        <%--        layer.confirm('是否确定删除角色：'+data.rname+' 的数据', function(index){--%>
        <%--            obj.del(); //删除对应行（tr）的DOM结构--%>
        <%--            layer.close(index);--%>
        <%--            //向服务端发送删除指令--%>
        <%--            var json={'rid':data.rid}--%>
        <%--            $.post("${pageContext.request.contextPath}/role/delete.do",json,function (deleteFlag,textStatus) {--%>
        <%--                if(deleteFlag=="true"){--%>
        <%--                    var deptname = $("#searchCon").val().toString();--%>
        <%--                    table.reload('testReload', {--%>
        <%--                        url: '${pageContext.request.contextPath}/role/search.do'--%>
        <%--                        ,where: { //设定异步数据接口的额外参数，任意设--%>
        <%--                            searchName: deptname--%>
        <%--                        }--%>
        <%--                        , page: {--%>
        <%--                            curr: 1 //重新从第 1 页开始--%>
        <%--                        },--%>
        <%--                    })--%>
        <%--                    layer.closeAll()--%>
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

