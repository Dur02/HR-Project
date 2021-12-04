<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script  src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>layui在线调试</title>
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <style>
        body{margin: 10px;}
        .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    </style>
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <div class="layui-inline" style="margin-left: -70px;">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline">
                <input type="text" name="id" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="margin-left: -70px;">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="text" name="phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="margin-left: -70px;">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="username" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="margin-left: -70px;">
            <label class="layui-form-label">角色</label>
            <div class="layui-input-inline">
                <select name="roleId">
                    <option value="0">请选择角色</option>
                    <option value="1">普通用户</option>
                    <option value="2">管理员</option>
                    <option value="3">超级管理员</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <button type="submit" class="layui-btn layui-btn-normal" lay-submit="" lay-filter="demo1">搜索</button>
        </div>
    </div>
</form>

<table class="layui-hide" id="demo" lay-filter="demo"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</div>
</body>
<script>
    layui.config({
        version: '1598935358940' //为了更新 js 缓存，可忽略
    });

    layui.use(['form','laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider','jquery'], function(){
        var laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,carousel = layui.carousel //轮播
            ,element = layui.element //元素操作
            ,$ =layui.jquery
            ,form =layui.form;
        var table = layui.table; //表格
        var laydate = layui.laydate;

        //
        // form.on('submit(demo1)',function (data) {
        //     layer.alert(JSON.stringify(data.field),{
        //         title: '最终提交的信息'
        //     })
        //     return false;
        // })
        //
        // //监听Tab切换
        // element.on('tab(demo)', function(data){
        //     layer.tips('切换了 '+ data.index +'：'+ this.innerHTML, this, {
        //         tips: 1
        //     });
        // });

        //执行一个 table 实例  （需要修改）
        table.render({
            elem: '#demo'
            ,id:'testReload'
            ,height: 620
            ,url: '${pageContext.request.contextPath}/selectUser.do' //数据接口
            ,title: '用户表'
            ,method: 'post'
            ,page: true //开启分页
            ,toolbar: true //开启工具栏，此处显示默认图标，可以自定义模板，详见文档  //'default'才是默认，此处已改
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left',align:'center'}
                ,{field: 'id', title: '账号', width:'10%',align:'center', sort: true}
                ,{field: 'password', title: '密码', width: '10%',  totalRow: true,align:'center',edit: true}
                ,{field: 'roleId', title: '角色', width:'12%', align:'center'}
                ,{field: 'phone', title: '手机', width: '15%', totalRow: true,align:'center'}
                ,{field: 'createdate', title: '注册时间', width: '13%',align:'center',templet : "<div>{{layui.util.toDateString(d.createdate, 'yyyy-MM-dd HH:mm:ss')}}</div>"}  //格式化时间
                ,{field: 'username', title: '用户名', width: '10%',edit:true, totalRow: true,align:'center'}
                ,{field: 'remark', title: '备注', width: '10%',align:'center',edit:true}
                ,{fixed: 'right',width: 165,align:'center',toolbar:'#barDemo'}
            ]]
            // ,done: function(res, curr, count){
            //     //如果是异步请求数据方式，res即为你接口返回的信息。
            //     //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
            //     console.log(res);
            //
            //     //得到当前页码
            //     console.log(curr);
            //
            //     //得到数据总量
            //     console.log(count);
            // }
        });

        <%--/*监听搜索按钮 (需要修改) */--%>
        <%--$('#search').click(function () {--%>
        <%--    var username = $("#searchCon").val().toString();--%>
        <%--    console.log(searchCon);--%>
        <%--    //表格重载--%>
        <%--    table.reload('testReload', {--%>
        <%--        url: '${pageContext.request.contextPath}/search.do'--%>
        <%--        ,where: { //设定异步数据接口的额外参数，任意设--%>
        <%--            searchName: username--%>
        <%--        }--%>
        <%--        , page: {--%>
        <%--            curr: 1 //重新从第 1 页开始--%>
        <%--        }--%>
        <%--    })--%>
        <%--});--%>


        //监听头工具栏事件
        table.on('toolbar(demo)', function(obj){
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
                    var json = {"id":data.id};
                    $.post("deleteById.do",json,function (data) {
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
                    $.post("updateUser.do",json,function (data) {
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
            layer.alert("账号："+data.id+"<br/>密码："+data.password+"<br/>角色："+data.roleId+"<br/>手机："+data.phone+"<br/>创建日期："+data.createdate+"<br/>用户名："+data.username+"<br/>备注："+data.remark,{
                title: '当前行数据'
            })
        })


        //监听提交
        form.on('submit(demo1)', function(data){
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
            table.reload('testReload',{
                url:"selectByWhereUsers.do"
                ,where:{
                    id:data.field.id,
                    phone:data.field.phone,
                    username:data.field.username,
                    roleId:data.field.roleId
                }
                ,page:{
                    curr:1
                }
            })
            return false;
        });


        <%--//监听行工具事件  (需要修改)--%>
        <%--table.on('tool(demo)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"--%>
        <%--    var data = obj.data //获得当前行数据--%>
        <%--        ,layEvent = obj.event; //获得 lay-event 对应的值--%>
        <%--    if(layEvent === 'edit'){--%>
        <%--        layer.confirm('是否确定修改姓名：'+data.username+' 的数据', function(index) {--%>
        <%--            $("#loginId").val(data.loginId)--%>
        <%--            $("#username").val(data.username);--%>
        <%--            $("#password").val(data.password);--%>
        <%--            $("#phone").val(data.phone);--%>
        <%--            $("#remark").val(data.remark);--%>
        <%--            $.ajax({--%>
        <%--                url: '/find.do',--%>
        <%--                dataType: 'json',--%>
        <%--                type: 'post',--%>
        <%--                success: function (result) {--%>
        <%--                    if (result !== null) {--%>
        <%--                        console.log(result)--%>
        <%--                        $("#role_id").empty();--%>
        <%--                        $("#role_id").append(new Option(data.role_idStr, data.role_id));--%>
        <%--                        $.each(result, function (index, item) {--%>
        <%--                            console.log("index:" + item.rid)--%>
        <%--                            console.log("item:" + item.rname)--%>
        <%--                            if (item.rid != data.role_id) {--%>
        <%--                                $('#role_id').append(new Option(item.rname, item.rid));--%>
        <%--                            }--%>
        <%--                        });--%>

        <%--                    } else {--%>
        <%--                        $("#role_id").append(new Option("暂无数据", ""));--%>
        <%--                    }--%>
        <%--                    //重新渲染--%>
        <%--                    form.render("select");--%>
        <%--                }--%>
        <%--            });--%>
        <%--        });--%>

        <%--        layer.open({--%>
        <%--            type: 1--%>
        <%--            ,title: ['修改信息','font-size:20px'] //不显示标题栏--%>
        <%--            ,area: ['700px','500px']--%>
        <%--            ,shadeClose:true--%>
        <%--            ,content:$("#div1")--%>
        <%--            ,btn:['提交']--%>
        <%--            ,btn1:function () {--%>
        <%--                var loginId = data.loginId;--%>
        <%--                var username = $("#username").val();--%>
        <%--                var password = $("#password").val();--%>
        <%--                var phone =    $("#phone").val();--%>
        <%--                var role_id = $("#role_id").val();--%>
        <%--                var remark =   $("#remark").val();--%>
        <%--                var json = {'loginId':loginId,'username':username,'password':password,'phone':phone,'role_id':role_id,'remark':remark};--%>
        <%--                //编辑--%>
        <%--                $.ajax({--%>
        <%--                    url:"${pageContext.request.contextPath}/edit.do",--%>
        <%--                    type:"post",--%>
        <%--                    async : true,--%>
        <%--                    contentType: "application/json; charset=utf-8",--%>
        <%--                    data : JSON.stringify(json),--%>
        <%--                    dataType : 'json',--%>
        <%--                    success : function(exitFlag) {--%>
        <%--                        if(exitFlag==true){--%>
        <%--                            layer.closeAll();--%>
        <%--                            var username = $("#searchCon").val().toString();--%>
        <%--                            //表格重载--%>
        <%--                            table.reload('testReload', {--%>
        <%--                                url: '${pageContext.request.contextPath}/search.do'--%>
        <%--                                ,where: { //设定异步数据接口的额外参数，任意设--%>
        <%--                                    searchName: username--%>
        <%--                                }--%>
        <%--                                , page: {--%>
        <%--                                    curr: 1 //重新从第 1 页开始--%>
        <%--                                }--%>
        <%--                            })--%>

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
        <%--        layer.confirm('是否确定删除姓名：'+data.username+' 的数据', function(index){--%>
        <%--            obj.del(); //删除对应行（tr）的DOM结构--%>
        <%--            layer.close(index);--%>
        <%--            //向服务端发送删除指令--%>
        <%--            var json={'loginId':data.loginId}--%>
        <%--            $.post("${pageContext.request.contextPath}/delete.do",json,function (deleteFlag,textStatus) {--%>
        <%--                if(deleteFlag=="true"){--%>
        <%--                    layer.msg("删除成功",{icon:1})--%>
        <%--                    var username = $("#searchCon").val().toString();--%>
        <%--                    //表格重载--%>
        <%--                    table.reload('testReload', {--%>
        <%--                        url: '${pageContext.request.contextPath}/user/search.do'--%>
        <%--                        ,where: { //设定异步数据接口的额外参数，任意设--%>
        <%--                            searchName: username--%>
        <%--                        }--%>
        <%--                        , page: {--%>
        <%--                            curr: 1 //重新从第 1 页开始--%>
        <%--                        }--%>
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

</html>
