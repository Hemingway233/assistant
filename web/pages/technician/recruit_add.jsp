<%--
  Created by IntelliJ IDEA.
  User: 王海明
  Date: 2019/11/5
  Time: 22:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--添加jstl标签库指令--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>登录页</title>
  <link rel="stylesheet" href="<c:url value="/layui/css/layui.css"/>">
</head>
<body>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>填写实验室助理招聘计划</legend>
</fieldset>

<form class="layui-form layui-form-pane" action="" method="post" id="recruit">

  <div class="layui-form-item layui-row">
    <div class="layui-col-xs4">
      <label class="layui-form-label">招聘名称</label>
      <div class="layui-input-block">
        <input type="text" name="recruitName" lay-verify="required" placeholder="招聘计划名称" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>

  <div class="layui-form-item layui-form-text layui-row">
    <div class="layui-col-xs4">
      <label class="layui-form-label">工作要求</label>
      <div class="layui-input-block">
        <textarea name="jobRequire" lay-verify="required" placeholder="请输入内容" autocomplete="off" class="layui-textarea"></textarea>
      </div>
    </div>
  </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">招聘数量</label>
      <div class="layui-input-inline">
        <input type="text" name="amount" lay-verify="required|number" placeholder="招聘数量" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">申请部门</label>
      <div class="layui-input-inline">
        <input type="text" name="department" lay-verify="required" placeholder="申请部门" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">申请人</label>
      <div class="layui-input-inline">
        <input type="text" name="applicant" lay-verify="required" placeholder="申请人" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">申请时间</label>
      <div class="layui-input-inline">
        <input type="text" name="applyTime" id="date" lay-verify="required|date" placeholder="申请时间" readonly autocomplete="off" class="layui-input">
      </div>
    </div>

    <div class="layui-inline" style="display: none">
      <label class="layui-form-label">申请人编号</label>
      <div class="layui-input-inline">
        <input type="text" name="user.userId" value="${user.userId}" placeholder="申请人编号" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>

  <div class="layui-form-item">
    <div class="layui-input-block">
      <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>

<script type="text/javascript" src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/layui/layui.js"/>"></script>
<script type="text/javascript">

  layui.use(['form','laydate','jquery','layer'],function () {

    var form = layui.form;
    var laydate = layui.laydate;
    var $ = layui.jquery;
    var layer = layui.layer;

    //日期
    laydate.render({
      elem: '#date',  //绑定id
      type: 'date',  //时间类型
      value: new Date(),  //设置初始值
      trigger: 'click', //采用click弹出
      min: '0',  //设定过去有限范围内的日期
      max: '0',  //设定未来有限范围内的日期
    });

    form.on('submit(demo)',function () {
      //序列化表单数据
      var serialize = $("#recruit").serialize();
      $.ajax({
        url:'recruitAction_add.action',
        type:'post',
        dataType:'json',
        data:serialize,
        success:function(data){
          if (data == 'true') {
            layer.msg('添加成功');
            window.location.href = "<c:url value="/index.jsp"/>";
          }else {
            layer.msg('添加失败，因为你还没有登录！');
          }
        }
      });
      //防止页面跳转
      return false;
    });

  });

</script>
</body>
</html>
