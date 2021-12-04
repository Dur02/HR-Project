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
                <input type="text" name="id" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="margin-left: -50px;">
            <label class="layui-form-label">员工名</label>
            <div class="layui-input-inline">
                <input type="text" name="name" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline" style="margin-left: -50px;">
            <label class="layui-form-label">卡片ID</label>
            <div class="layui-input-inline">
                <input type="text" name="cardId" autocomplete="off" class="layui-input">
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

    layui.use(['form','laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider','jquery'], function(){
        var laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,element = layui.element //元素操作
            ,$ =layui.jquery
            ,form = layui.form
        var laydate = layui.laydate;

        //执行一个laydate实例

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
            ,url: '${pageContext.request.contextPath}/selectEmployee.do' //数据接口
            ,title: '部门表'
            ,page: true //开启分页
            ,method: 'post'
            ,toolbar: true //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'id', title: '员工号', width:'15%'}
                ,{field: 'name', title: '姓名', width: '15%',edit:true}
                ,{field: 'deptId', title: '部门', width:'15%',edit:true}
                ,{field: 'jobId', title: '职位', width:'15%',edit:true}
                ,{field: 'cardId', title: '银行卡号', width:'15%',edit:true}
                ,{field: 'postCode', title: '邮政编码', width:'15%',edit:true}
                ,{field: 'address', title: '地址', width:'15%',edit:true}
                ,{field: 'tel', title: '家庭电话', width:'15%',edit:true}
                ,{field: 'phone', title: '手机号码', width:'15%',edit:true}
                ,{field: 'qqNum', title: 'QQ号', width:'15%',edit:true}
                ,{field: 'email', title: 'QQ邮箱', width:'15%',edit:true}
                ,{field: 'sex', title: '性别', width:'15%'}
                ,{field: 'party', title: '政治面貌', width:'15%',edit:true}
                ,{field: 'birthday',title: '出生日期', width:'15%',templet : "<div>{{layui.util.toDateString(d.birthday, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
                ,{field: 'race', title: '民族', width:'15%'}
                ,{field: 'education', title: '学历', width:'15%'}
                ,{field: 'speciality', title: '专业', width:'15%'}
                ,{field: 'hobby', title: '爱好', width:'15%',edit:true}
                ,{field: 'remark', title: '备注', width:'15%',edit:true}
                ,{field: 'createDate', title: '创建时间', width:'15%',templet : "<div>{{layui.util.toDateString(d.createDate, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
                ,{fixed: 'right',width:'10%',align:'center',toolbar:'#barDemo'}
            ]]
            ,done: function(res, curr, count){
                //如果是异步请求数据方式，res即为你接口返回的信息。
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                console.log(res);

                //得到当前页码
                console.log(curr);

                //得到数据总量
                console.log(count);
            }
        });


        table.on('tool(demo)',function (obj) {
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('确定删除吗', function(index) {
                    obj.del();
                    var json = {"id":data.id};
                    $.post("deleteByeid.do",json,function (data) {
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
                    $.post("updateEmployee.do",json,function (data) {
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
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
            table.reload('testReload',{
                url:"selectByWhereEmployee.do"
                ,where:{
                    id:data.field.id,
                    name:data.field.name,
                    cardId:data.field.cardId
                }
                ,page:{
                    curr:1
                }
            })
            return false;
        });

        table.on('rowDouble(demo)',function (obj) {
            var data = obj.data;
            layer.alert("员工号："+data.id+"<br/>姓名："+data.name+"<br/>部门号："+data.deptId+"<br/>职位号："+data.jobId+"<br/>银行卡号："+data.cardId+"<br/>邮政编码："+data.postCode+"<br/>地址："+data.address+"<br/>家庭电话："+data.tel+"<br/>手机号码："+data.phone+"<br/>QQ号："+data.qqNum+"<br/>QQ邮箱："+data.email+"<br/>性别："+data.sex+"<br/>政治面貌："+data.party+"<br/>出生日期："+data.birthday+"<br/>民族："+data.race+"<br/>学历："+data.education+"<br/>专业："+data.speciality+"<br/>爱好："+data.hobby+"<br/>爱好："+data.remark+"<br/>创建日期："+data.createDate,{
                title: '当前行数据'
            })
        })


        <%--/*监听搜索按钮*/--%>
        <%--$('#search').click(function () {--%>
        <%--    var deptname = $("#searchCon").val().toString();--%>
        <%--    table.reload('testReload', {--%>
        <%--        url: '${pageContext.request.contextPath}/employee/search.do'--%>
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
        <%--    console.log(data)--%>

        <%--    if(layEvent === 'edit'){--%>

        <%--        $("#name").val(data.name)--%>
        <%--        $("#deptName").val(data.deptName)--%>
        <%--        $("#jobName").val(data.jobName)--%>
        <%--        $("#card_id").val(data.card_id)--%>
        <%--        $("#post_code").val(data.post_code)--%>
        <%--        $("#address").val(data.address)--%>
        <%--        $("#tel").val(data.tel)--%>
        <%--        $("#phone").val(data.phone)--%>
        <%--        $("#qq_num").val(data.qq_num)--%>
        <%--        $("#email").val(data.email)--%>
        <%--        $("#sex").val(data.sex)--%>
        <%--        $("#party").val(data.party)--%>
        <%--        $("#birthday").val(data.birthday);--%>
        <%--        $("#race").val(data.race)--%>
        <%--        $("#education").val(data.education)--%>
        <%--        $("#speciality").val(data.speciality)--%>
        <%--        $("#hobby").val(data.hobby)--%>
        <%--        $("#remark").val(data.remark)--%>
        <%--        $.ajax({--%>
        <%--            url: '/job/find.do',--%>
        <%--            dataType: 'json',--%>
        <%--            type: 'post',--%>
        <%--            success: function(result) {--%>
        <%--                if (result!== null) {--%>
        <%--                    // console.log(result)--%>
        <%--                    $("#job_id").empty();--%>
        <%--                    $("#job_id").append(new Option(data.jobName, data.job_id));--%>
        <%--                    $.each(result, function(index, item) {--%>
        <%--                        // console.log("index:"+index)--%>
        <%--                        // console.log("item:"+item.jname)--%>

        <%--                        $('#job_id').append(new Option(item.jname,item.jid));--%>
        <%--                    });--%>
        <%--                } else {--%>
        <%--                    $("#job_id").append(new Option("暂无数据", ""));--%>
        <%--                }--%>
        <%--                //重新渲染--%>
        <%--                form.render("select");--%>
        <%--            }--%>
        <%--        });--%>

        <%--        $.ajax({--%>
        <%--            url: '/dept/find.do',--%>
        <%--            dataType: 'json',--%>
        <%--            type: 'post',--%>
        <%--            success: function(result) {--%>
        <%--                if (data!== null) {--%>
        <%--                    console.log(result)--%>
        <%--                    $("#dept_id").empty();--%>
        <%--                    $("#dept_id").append(new Option(data.deptName, data.dept_id));--%>
        <%--                    $.each(result, function(index, item) {--%>
        <%--                        console.log("index:"+index)--%>
        <%--                        console.log("item:"+item.did)--%>
        <%--                        console.log("item:"+item.dname)--%>

        <%--                        $('#dept_id').append(new Option(item.dname,item.did));--%>
        <%--                    });--%>
        <%--                } else {--%>
        <%--                    $("#dept_id").append(new Option("暂无数据", ""));--%>
        <%--                }--%>
        <%--                //重新渲染--%>
        <%--                form.render("select");--%>
        <%--            }--%>
        <%--        });--%>
        <%--        laydate.render({--%>
        <%--            elem: '#birthday' //指定元素--%>
        <%--            ,type: 'datetime'--%>
        <%--        });--%>

        <%--        layer.open({--%>
        <%--            type: 1--%>
        <%--            ,title: ['修改信息','font-size:20px'] //不显示标题栏--%>
        <%--            ,area: ['700px','500px']--%>
        <%--            ,shadeClose:true--%>
        <%--            ,content:$("#div1")--%>
        <%--            ,btn:['提交']--%>
        <%--            ,btn1:function () {--%>
        <%--                var id        = data.id--%>
        <%--                var name      = $("#name").val();--%>
        <%--                var dept_id  =  $("#dept_id").val();--%>
        <%--                var job_id   = $("#job_id").val();--%>
        <%--                var deptName  = $("#deptName").val();--%>
        <%--                var jobName   = $("#jobName").val();--%>
        <%--                var card_id   = $("#card_id").val();--%>
        <%--                var post_code = $("#post_code").val();--%>
        <%--                var address   = $("#address").val();--%>
        <%--                var tel       = $("#tel").val();--%>
        <%--                var phone     = $("#phone").val()--%>
        <%--                var qq_num    = $("#qq_num").val();--%>
        <%--                var email     = $("#email").val();--%>
        <%--                var sex       = $("#sex").val();--%>
        <%--                var party     = $("#party").val();--%>
        <%--                var race      = $("#race").val();--%>
        <%--                var education = $("#education").val();--%>
        <%--                var speciality= $("#speciality").val();--%>
        <%--                var hobby     = $("#hobby").val();--%>
        <%--                var remark    = $("#remark").val();--%>
        <%--                var birthday  = $("#birthday").val();--%>
        <%--                var json = {--%>
        <%--                    'id':id,--%>
        <%--                    'name': name,--%>
        <%--                    'dept_id':dept_id,--%>
        <%--                    'job_id':job_id,--%>
        <%--                    'deptName': deptName,--%>
        <%--                    'jobName': jobName,--%>
        <%--                    'card_id': card_id,--%>
        <%--                    'post_code': post_code,--%>
        <%--                    'address': address,--%>
        <%--                    'tel': tel,--%>
        <%--                    'phone':phone,--%>
        <%--                    'qq_num': qq_num,--%>
        <%--                    'email': email,--%>
        <%--                    'sex': sex,--%>
        <%--                    'party': party,--%>
        <%--                    'birthdayStr':birthday,--%>
        <%--                    'race': race,--%>
        <%--                    'education': education,--%>
        <%--                    'speciality': speciality,--%>
        <%--                    'hobby': hobby,--%>
        <%--                    'remark': remark--%>
        <%--                };--%>
        <%--                console.log(json)--%>

        <%--                //修改功能--%>
        <%--                $.ajax({--%>
        <%--                    url:"${pageContext.request.contextPath}/employee/edit.do",--%>
        <%--                    type:"post",--%>
        <%--                    async : true,--%>
        <%--                    contentType: "application/json; charset=utf-8",--%>
        <%--                    data : JSON.stringify(json),--%>
        <%--                    dataType : 'json',--%>
        <%--                    success : function(exitFlag) {--%>
        <%--                        if(exitFlag){--%>
        <%--                            var deptname = $("#searchCon").val().toString();--%>
        <%--                            table.reload('testReload', {--%>
        <%--                                url: '${pageContext.request.contextPath}/employee/search.do'--%>
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
        <%--        layer.confirm('是否确定删除部门：'+data.name+' 的数据', function(index){--%>
        <%--            obj.del(); //删除对应行（tr）的DOM结构--%>
        <%--            layer.close(index);--%>
        <%--            //向服务端发送删除指令--%>
        <%--            var json={'id':data.id}--%>
        <%--            $.post("${pageContext.request.contextPath}/employee/delete.do",json,function (deleteFlag,textStatus) {--%>
        <%--                if(deleteFlag){--%>
        <%--                    var deptname = $("#searchCon").val().toString();--%>
        <%--                    table.reload('testReload', {--%>
        <%--                        url: '${pageContext.request.contextPath}/employee/search.do'--%>
        <%--                        ,where: { //设定异步数据接口的额外参数，任意设--%>
        <%--                            searchName: deptname--%>
        <%--                        }--%>
        <%--                        , page: {--%>
        <%--                            curr: 1 //重新从第 1 页开始--%>
        <%--                        },--%>
        <%--                    })--%>
        <%--                    layer.closeAll();--%>
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

