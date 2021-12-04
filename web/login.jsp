<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/loginstyle/css/supersized.css">
    <script src="${pageContext.request.contextPath}/loginstyle/js/jquery-1.8.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/loginstyle/js/supersized.3.2.7.min.js"></script>
    <script src="${pageContext.request.contextPath}/loginstyle/js/supersized-init.js"></script>
</head>
<body>
    <div style="background-color: #FFFFFF;width: 500px;height: 400px;position: absolute;top: 150px;right: 540px;text-align: center;border-radius: 10px;">
      <form class="layui-form" action="login.do" method="post" id="demo1" style="text-align: center;margin-top: 10px;">
        <h1>用户登录</h1>
        <div class="layui-form-item" style="margin-top: 10px;margin-left: 30px;">
          <label class="layui-form-label  layui-icon layui-icon-username"></label>
          <div class="layui-input-block">
            <input type="text" name="id" lay-verify="required" autocomplete="off" placeholder="请输入账号或手机号" class="layui-input" style="width: 250px;">
          </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10px;margin-left: 30px;">
          <label class="layui-form-label  layui-icon layui-icon-password"></label>
          <div class="layui-input-block">
            <input type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" style="width: 250px;">
          </div>
        </div>
        <div class="layui-form-item" style="margin-top: 10px;margin-left: 30px;">
          <label class="layui-form-label  layui-icon layui-icon-vercode"></label>
          <div class="layui-input-block">
            <input type="text"  id="checkcode" name="checkcode" lay-verify="required" autocomplete="off" placeholder="请输入验证码" class="layui-input" style="width: 250px;">
          </div>
        </div>
        <a href="javascript:void(0);" id="change"><img src="CheckCodeUtil" id="codeImg" style="border:1px solid #000;width: 80px;height: 40px;"></a>
        <div class="layui-form-item" style="margin-top: 20px;margin-right: 120px;">
          <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1" style="width: 200px;">登录</button>
          </div>
        </div>
<%--        <div class="layui-form-item" style="margin-top: 20px;margin-right: 120px;">--%>
<%--          <div class="layui-input-block">--%>
<%--            <a href="${pageContext.request.contextPath}/register.jsp" style="color: #0000FF">现在注册</a>--%>
<%--          </div>--%>
<%--        </div>--%>
      </form>
      <div class="layui-form-item" id="layerDemo" style="margin-top: 20px;margin-right: 120px;">
        <div class="layui-input-block">
          <button data-method="notice" class="layui-btn" style="width: 200px;">注册</button>
        </div>
      </div>
    </div>
</body>
<script>
    //刷新验证码
    $(function () {
      //点击事件
      $("#change").click(function () {
        //修改图片的src属性
        $("#codeImg").attr("src","CheckCodeUtil?time="+new Date().getTime());
      })
    })
</script>
<script>
    layui.use(['form', 'layedit', 'layer', 'jquery'],function () {
      var form = layui.form
        ,layer = layui.layer
        ,layedit = layui.layedit
        ,$ = layui.jquery;

      var loginMsg = "${loginMsg}";
      console.log(loginMsg);
      if(loginMsg != ""){
          layer.msg(loginMsg,{"icon":2,"time":2000});
          loginMsg = "";
      }

      var active = {
        notice: function (){
          layer.open({
            type:2
            ,
            title:"<h1>用户注册</h1>"
            ,
            closeBtn:false
            ,
            area: ['700px','500px']
            ,
            shade:0.5
            ,
            id: 'LAY_layuipro'
            ,
            btn: ['取消']
            ,
            btnAlign:'c'
            ,
            moveType:1
            ,
            content:'${pageContext.request.contextPath}/register.jsp'
          });
        }
      };

      $('#layerDemo .layui-btn').on('click',function () {
          var othis = $(this), method = othis.data('method');
          active[method] ? active[method].call(this, othis): '';
      });

      form.verify({
        title: function (value) {
           if (value.length < 5){
             return '标题至少5个字符';
           }
        }
        ,pass: [
            /^[/S]{6,12}$/
            ,'密码必须6到12位，且不能出现空格'
        ]
        ,content: function (value) {
            layedit.sync(editIndex);
        }
      })
    })
</script>
</html>
