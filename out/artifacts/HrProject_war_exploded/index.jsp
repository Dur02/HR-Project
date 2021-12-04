<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>员工管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header layui-bg-cyan">
        <i class="layui-icon layui-icon-face-cry " style="font-size: 50px;color: #01AAED;margin-left: 20px;"></i>
        <div class="layui-logo" style="margin-left: 20px;">人事管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-icon layui-icon-time" id="ptime"></li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="image/hp.png" class="layui-nav-img">
                </a>
                <dl class="layui-nav-child">
                    <dd><a id="userInfo" href="javascript:;">基本资料</a></dd>
                    <dd><a href="${pageContext.request.contextPath}/logout.do">退出登录</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    <!-- 左侧导航区域-->
    <div class="layui-side layui-bg-cyan">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree layui-bg-cyan"  lay-filter="test">
                <li class="layui-nav-item">
                    <a class="site-demo-active" href="javascript:;" data-url="welcome" data-title="欢迎" data-id="0"><i class="layui-icon layui-icon-home"></i>主页</a>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;"><i class="layui-icon layui-icon-group"></i>  用户管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="site-demo-active" data-url="user-list" data-title="用户查询" data-id="1"><i class="layui-icon layui-icon-search"></i> 用户查询</a></dd>
                        <dd><a href="javascript:;" class="site-demo-active" data-url="user-add" data-title="添加用户" data-id="2"><i class="layui-icon layui-icon-add-1"></i>  添加用户</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-chart-screen"></i>  部门管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="site-demo-active" data-url="dept-list" data-title="部门查询" data-id="3"><i class="layui-icon layui-icon-search"></i>  部门查询</a></dd>
                        <dd><a href="javascript:;" class="site-demo-active" data-url="dept-add" data-title="添加部门" data-id="4"><i class="layui-icon layui-icon-add-1"></i>  添加部门</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-read"></i>职位管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="site-demo-active" data-url="job-list" data-title="职位查询" data-id="5"><i class="layui-icon layui-icon-search"></i>  职位查询</a></dd>
                        <dd><a href="javascript:;" class="site-demo-active" data-url="job-add" data-title="添加职位" data-id="6"><i class="layui-icon layui-icon-add-1"></i> 添加职位</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-dollar"></i>员工管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="site-demo-active" data-url="employee-list" data-title="员工查询" data-id="7"><i class="layui-icon layui-icon-search"></i>员工查询</a></dd>
                        <dd><a href="javascript:;" class="site-demo-active" data-url="employee-add" data-title="添加员工" data-id="8"><i class="layui-icon layui-icon-add-1"></i> 添加员工</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-auz"></i>角色管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="site-demo-active" data-url="role-list" data-title="角色查询" data-id="9"><i class="layui-icon layui-icon-search"></i>角色查询</a></dd>
                        <dd><a href="javascript:;" class="site-demo-active" data-url="role-add" data-title="添加角色" data-id="10"><i class="layui-icon layui-icon-add-1"></i> 添加角色</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-notice"></i>公告管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="site-demo-active" data-url="notice-list" data-title="公告查询" data-id="11"><i class="layui-icon layui-icon-search"></i>公告查询</a></dd>
                        <dd><a href="javascript:;" class="site-demo-active" data-url="notice-add" data-title="添加公告" data-id="12"><i class="layui-icon layui-icon-add-1"></i> 添加公告</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon layui-icon-file-b"></i>文件中心</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" class="site-demo-active" data-url="uploadfile" data-title="上传文件" data-id="13"><i class="layui-icon layui-icon-upload-drag"></i>上传文件</a></dd>
                        <dd><a href="javascript:;" class="site-demo-active" data-url="downloadfile" data-title="下载文件" data-id="14"><i class="layui-icon layui-icon-download-circle"></i>下载文件</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div class="layui-tab layui-tab-brief" lay-allowClose="true" lay-filter="demo">
            <ul class="layui-tab-title">
            </ul>
            <div class="layui-tab-content"></div>
        </div>
<%--        <div class="layui-footer">--%>
<%--            @Copy right by N1varna--%>
<%--        </div>--%>
    </div>

</div>

<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    var time=setInterval(function () { //定义定时器
        getTime();
    },1000);
    function getTime() {
        //1.得到当前时间
        var d = new Date();
        var M =(d.getMonth()+1)<10?('0'+(d.getMonth()+1)):(d.getMonth()+1);
        var D =(d.getDate())<10?('0'+d.getDate()):(d.getDate());
        var h =(d.getHours())<10?('0'+(d.getHours())):(d.getHours());
        var s =(d.getSeconds())<10?('0'+d.getSeconds()):(d.getSeconds());
        var m =(d.getMinutes())<10?('0'+d.getMinutes()):(d.getMinutes());
        var t =d.getFullYear()+"年"+M+"月"+D+"日&nbsp;&nbsp;&nbsp;&nbsp;"+h+"时"+m+"分"+s+"秒"+"&nbsp;&nbsp;星期"+"日一二三四五六".charAt(d.getDay());
        //得到控件
        var ptime =document.getElementById("ptime");
        ptime.innerHTML=t;
    }
</script>
<script>
    layui.use(['element','layer','jquery'], function() {
        var element = layui.element;
        var $=layui.jquery;
        var layer =layui.layer;; //Tab的切换功能，切换事件监听等，需要依赖element模块 <iframe data-frameid="'+id+'" scrolling="auto" frameborder="0" src="pages/welcome.jsp" style="width:100%;height:99%;"></iframe>
        $.post('')
        element.tabAdd('demo', {
            title: '欢迎',
            content: '<iframe id="iframeMain" scrolling="auto" frameborder="0"  src="${pageContext.request.contextPath}/welcome.jsp" style="width:100%;height:800px;"></iframe>',
            id: '0' //规定好的id
        })
        element.tabChange('demo', 0)
        //触发事件
        var active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function(url,id,name) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: name,
                    content: '<iframe data-frameid="'+id+'" scrolling="auto" frameborder="0" src="${pageContext.request.contextPath}/'+url+'.jsp" style="width:100%;height:800px;"></iframe>',
                    id: id, //规定好的id
                })
            },
            tabChange: function(id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            }

        };

        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('.site-demo-active').on('click', function() {
            var dataid = $(this);

            //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
            if ($(".layui-tab-title li[lay-id]").length <= 0) {
                //如果比零小，则直接打开新的tab项
                active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
            } else {
                //否则判断该tab项是否以及存在

                var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                $.each($(".layui-tab-title li[lay-id]"), function () {
                    //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                    if ($(this).attr("lay-id") == dataid.attr("data-id")) {
                        isData = true;
                    }
                })
                if (isData == false) {
                    //标志为false 新增一个tab项
                    active.tabAdd(dataid.attr("data-url"), dataid.attr("data-id"),dataid.attr("data-title"));
                }
            }
            //最后不管是否新增tab，最后都转到要打开的选项页面上
            active.tabChange(dataid.attr("data-id"));
        });
        $("#userInfo").on('click',function () {
            layer.open({
                type: 2
                ,title: false //不显示标题栏
                ,closeBtn: true
                ,area: ['700px','500px']
                ,shade: 0.3
                ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                // ,btn: ['火速围观', '残忍拒绝']
                // ,btnAlign: 'c'
                // ,moveType: 1 //拖拽模式，0或者1
                ,content:'${pageContext.request.contextPath}/user-info.jsp'

            });
        });
    });

</script>


<script type="text/javascript">
    //禁用iframed滚动条，只保留自带的滚动条
    function SetWinHeight(obj)
    {
        var win=obj;
        if (document.getElementById)
        {
            if (win && !window.opera)
            {
                if (win.contentDocument && win.contentDocument.body.offsetHeight)
                    win.height = win.contentDocument.body.offsetHeight;
                else if(win.Document && win.Document.body.scrollHeight)
                    win.height = win.Document.body.scrollHeight;
            }
        }
    }
</script>
</body>
</html>