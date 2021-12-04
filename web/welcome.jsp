<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>轮播</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
    <style>
        html{
            overflow-x: hidden;
        }
        .mybtn{
            width: 30%;
            height:80px;
        }
        .myp{
            padding-top: 10px;
        }
    </style>
</head>
<body>
<div class="layui-bg-gray" style="padding: 30px;">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md6">
            <div class="layui-carousel" id="test1" lay-filter="test1" style="margin-left: 0px;">
                <div carousel-item="">
                    <div>
                        <img src="image/lbt1.png" width="99%" height="250px">
                    </div>
                    <div>
                        <img src="image/lbt2.png" width="99%" height="250px">
                    </div>
                    <div>
                        <img src="image/lbt3.png" width="99%" height="250px">
                    </div>
                    <div>
                        <img src="image/lbt4.png" width="99%" height="250px">
                    </div>
                    <div>
                        <img src="image/lbt5.png" width="99%" height="250px">
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-md6" style="height: 265px;">
            <div class="layui-card">
                <div class="layui-card-header">综合统计</div>
                <div class="layui-card-body">
                    <button class="layui-btn layui-btn-danger mybtn"><p class="myp"><i class="layui-icon layui-icon-group"></i>用户数量</p>${count.userCount}</button>
                    <button class="layui-btn layui-btn-warm mybtn"><p class="myp"><i class="layui-icon layui-icon-chart-screen"></i>部门数量</p>${count.deptCount}</button>
                    <button class="layui-btn layui-btn-normal mybtn"><p class="myp"><i class="layui-icon layui-icon-read"></i>职位数量</p>${count.jobCount}</button>
                </div>
                <div class="layui-card-body">
                    <button class="layui-btn layui-btn-danger mybtn"><p class="myp"><i class="layui-icon layui-icon-dollar"></i>员工数量</p>${count.employeeCount}</button>
                    <button class="layui-btn layui-btn-warm mybtn"><p class="myp"><i class="layui-icon layui-icon-auz"></i>文件数量</p>${count.uploadfileCount}</button>
                    <button class="layui-btn layui-btn-normal mybtn"><p class="myp"><i class="layui-icon layui-icon-notice"></i>公告数量</p>${count.noticeCount}</button>
                </div>
            </div>
        </div>
        <div class="layui-col-md6" style="margin-top: 20px;">
            <div class="layui-card">
                <div class="layui-card-header">最新公告</div>
                <div class="layui-card-body">
                    <table class="layui-hide" id="test" lay-filter="test"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    layui.use(['carousel', 'form', 'table'], function(){
        var carousel = layui.carousel
            ,form = layui.form
            ,table = layui.table;

        //常规轮播
        carousel.render({
            elem: '#test1'
            ,arrow: 'always'
            ,interval: 1800
            ,anim: 'fade'
            ,height: '250px'
            ,width:'99%'
        });

        var $ = layui.$, active = {
            set: function(othis){
                var THIS = 'layui-bg-normal'
                    ,key = othis.data('key')
                    ,options = {};

                othis.css('background-color', '#5FB878').siblings().removeAttr('style');
                options[key] = othis.data('value');
                ins3.reload(options);
            }
        };

        table.render({
            elem: '#test'
            ,url:'${pageContext.request.contextPath}/selectByTop5Notice.do'
            ,cols: [[
                {field:'title', title:'标题', width:'50%'}
                ,{field:'content', title:'内容', width:'50%'}
            ]]
            ,page: true
        });

        //监听行单击事件（双击事件为：rowDouble）
        table.on('rowDouble(test)', function(obj){
            var data = obj.data;

            layer.alert("ID："+data.id+"<br/>发布者："+data.userid+"<br/>内容："+data.content, {
                title: data.title
            });

            //标注选中样式
            obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
        });

        //监听开关
        form.on('switch(autoplay)', function(){
            ins3.reload({
                autoplay: this.checked
            });
        });

        $('.demoSet').on('keyup', function(){
            var value = this.value
                ,options = {};
            if(!/^\d+$/.test(value)) return;

            options[this.name] = value;
            ins3.reload(options);
        });

        //其它示例
        $('.demoTest .layui-btn').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });
    });
</script>
</html>
