<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--添加jstl标签库指令--%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>登录页</title>
  <link rel="stylesheet" href="layui/css/layui.css">
</head>
<body>
<div class="login-main" style="margin:auto;margin-top:10%;border:1px solid #000;padding:50px;width: 500px;">
  <header class="layui-elip">登录</header>
  <form class="layui-form" action="" id="loginForm" method="post">
    <div class="layui-form-item">
      <label class="layui-form-label">用户名：</label>
      <div class="layui-input-inline">
        <input id="userId" type="text" name="userId" required lay-verify="required" placeholder="用户名" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">密码：</label>
      <div class="layui-input-inline">
        <input id="password" type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">用户类型：</label>
      <div class="layui-input-inline">
        <select name="userType" id="userType" lay-filter="aihao">
          <option value=""></option>
          <option value="0" selected="">实验室技术员</option>
          <option value="1">实验室助理</option>
          <option value="2">学生工作处</option>
          <option value="3">学生</option>
        </select>
      </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-input-block">
        <button class="layui-btn" lay-submit lay-filter="login">登录</button>
        <button type="reset" class="layui-btn layui-btn-primary layui-icon layui-icon-refresh">重置</button>
      </div>
    </div>
    <hr/>
  </form>
  <button class="layui-btn layui-btn-normal" style="float:right" id="register">学生注册</button>
</div>
<div class="login-main" style="display: none" id="regForm">
  <form id="reg" class="layui-form" action="" method="post">
    <div class="layui-form-item">
      <label class="layui-form-label">学号：</label>
      <div class="layui-input-inline">
        <input id="stuId" type="text" name="stuId" required lay-verify="required" placeholder="学号" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">密码：</label>
      <div class="layui-input-inline">
        <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">姓名：</label>
      <div class="layui-input-inline">
        <input type="text" name="stuName" required lay-verify="required" placeholder="姓名" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">专业：</label>
      <div class="layui-input-inline">
        <input type="text" name="major" required lay-verify="required" placeholder="专业" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">学院：</label>
      <div class="layui-input-inline">
        <input type="text" name="department" required lay-verify="required" placeholder="学院" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">班级：</label>
      <div class="layui-input-inline">
        <input type="text" name="className" required lay-verify="required" placeholder="班级" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">年级：</label>
      <div class="layui-input-inline">
        <input type="text" name="grade" required lay-verify="required" placeholder="年级" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">手机号：</label>
      <div class="layui-input-inline">
        <input type="text" name="phone" required lay-verify="required" placeholder="手机号" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-form-item">
      <label class="layui-form-label">邮箱：</label>
      <div class="layui-input-inline">
        <input type="text" name="email" required lay-verify="required" placeholder="邮箱" autocomplete="off" class="layui-input">
      </div>
    </div>
    <hr/>
    <div class="layui-form-item">
      <div class="layui-input-block">
        <button class="layui-btn" lay-submit="" lay-filter="register">注册</button>
        <button type="reset" class="layui-btn layui-btn-primary layui-icon layui-icon-refresh">重置</button>
      </div>
    </div>
  </form>
</div>

<script src="layui/layui.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

    layui.use(['form', 'layer', 'jquery'], function () {

        // 操作对象
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;
        //重新渲染表单
        //form.render();
        form.on('submit(login)', function (data) {
            //序列化表单数据
            var serialize = $("#loginForm").serialize();
            $.post("userAction_login.action", serialize, function (data) {
                if (data == 'false') {
                    layer.msg('登录失败');
                } else {
                    layer.msg('登录成功');
                    window.location.href = "index.jsp";
                }
            }, 'json');
            return false;    //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        //学生注册
        $("#register").click(function () {
            layer.open({
                type: 1,    //类型
                title: '注册',    //标题
                //area :  ['700px', '300px'],    //宽高
                content: $("#regForm"),    //内容
                //btn: ['注册','<div class="layui-icon layui-icon-refresh">重置</div>','返回'],    //按钮
                skin: 'layui-layer-lan',    //框框皮肤
                anim: 2,    //动画
                shade: '#000',    //遮罩
                shadeClose: true,    //遮罩是否可以关闭
                yes: function (index, layero) {
                    //按钮【按钮一】的回调
                    //序列化表单数据
                    var serialize = $("#reg").serialize();
                    $.post("studentAction_register.action", serialize, function (data, status) {
                        if (data == 'true') {
                            layer.msg('注册成功');
                        } else {
                            layer.msg('注册失败');
                        }
                        layer.closeAll('page'); //关闭所有页面层
                    }, 'json');
                }
            });
            return false;
        });

        //监听表单注册
        form.on('submit(register)', function () {
            //序列化表单数据
            var serialize = $("#reg").serialize();
            $.post("studentAction_register.action", serialize, function (data, status) {
                if (data == 'true') {
                    layer.msg('注册成功');
                } else {
                    layer.msg('注册失败');
                }
                layer.closeAll('page'); //关闭所有页面层
            }, 'json');
            return false;    //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        //焦点离开时，验证学号是否存在
        $("#stuId").blur(function () {
            //序列化表单数据
            var serialize = $("#reg").serialize();
            $.post("studentAction_verify.action", serialize, function (data, status) {
                if (data == 'true') {
                    layer.msg("学号已注册！");
                }
            }, 'json');
        });
    });
</script>
</body>
</html>