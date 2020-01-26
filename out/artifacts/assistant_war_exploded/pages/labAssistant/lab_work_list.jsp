<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 王海明
  Date: 2019/12/13
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>登录页</title>
  <link rel="stylesheet" href="<c:url value="/layui/css/layui.css"/>">
</head>
<body>

<table id="demo" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
  <div class="layui-form-item">
    <div class="layui-inline">
      <div class="layui-input-inline">
        <button class="layui-btn" lay-event="addWork">记录工作内容</button>
      </div>
    </div>
    <div class="layui-inline">
      <div class="layui-input-inline">
        <button class="layui-btn" lay-event="addDevice">填写设备维修申请</button>
      </div>
    </div>
    <div class="layui-inline">
      <div class="layui-input-inline">
        <input type="text" class="layui-input" name="id" placeholder="请输入ID" autocomplete="off">
      </div>
    </div>
    <div class="layui-inline">
      <div class="layui-input-inline">
        <button class="layui-btn" data-type="reload">搜索</button>
      </div>
    </div>
  </div>
</script>

<div class="login-main" style="display: none;margin-top: 20px;margin-left: 20px;margin-right: 20px" id="add">
  <form class="layui-form layui-form-pane" action="" method="post" lay-filter="workForm" id="workForm">
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">周次</label>
        <div class="layui-input-inline">
          <select name="weekTime" lay-verify="required">
            <option value="" selected=""></option>
            <option value="第1周">第1周</option>
            <option value="第2周">第2周</option>
            <option value="第3周">第3周</option>
            <option value="第4周">第4周</option>
            <option value="第5周">第5周</option>
            <option value="第6周">第6周</option>
            <option value="第7周">第7周</option>
            <option value="第8周">第8周</option>
            <option value="第9周">第9周</option>
            <option value="第10周">第10周</option>
            <option value="第11周">第11周</option>
            <option value="第12周">第12周</option>
            <option value="第13周">第13周</option>
            <option value="第14周">第14周</option>
            <option value="第15周">第15周</option>
            <option value="第16周">第16周</option>
            <option value="第17周">第17周</option>
            <option value="第18周">第18周</option>
          </select>
        </div>
      </div>
      <div class="layui-inline">
        <label class="layui-form-label">星期</label>
        <div class="layui-input-inline">
          <select name="week" lay-verify="required">
            <option value="" selected=""></option>
            <option value="星期一">星期一</option>
            <option value="星期二">星期二</option>
            <option value="星期三">星期三</option>
            <option value="星期四">星期四</option>
            <option value="星期五">星期五</option>
            <option value="星期六">星期六</option>
            <option value="星期日">星期日</option>
          </select>
        </div>
      </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">日期</label>
        <div class="layui-input-inline">
          <input type="text" name="workTime" id="date" lay-verify="required|date" placeholder="日期" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-inline">
        <label class="layui-form-label">系统时间</label>
        <div class="layui-input-inline">
          <input type="text" name="sysTime" id="dateTime" lay-verify="required|time" placeholder="系统时间" autocomplete="off" class="layui-input">
        </div>
      </div>
    </div>
    <div class="layui-form-item layui-form-text layui-row">
      <div class="layui-col-xs12">
        <label class="layui-form-label">工作内容</label>
        <div class="layui-input-block">
          <textarea name="jobContent" lay-verify="required" placeholder="请输入工作内容" autocomplete="off" class="layui-textarea"></textarea>
        </div>
      </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">助理编号</label>
        <div class="layui-input-inline">
          <input type="text" name="student.stuId" value="${user.userId}" readonly lay-verify="required" placeholder="人员编号" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-inline">
        <label class="layui-form-label">技术员编号</label>
        <div class="layui-input-inline">
          <input type="text" name="user.userId" value="${userId}" readonly lay-verify="required" placeholder="实验室技术员编号" autocomplete="off" class="layui-input">
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
</div>

<div class="login-main" style="display: none;margin-top: 20px;margin-left: 20px;margin-right: 20px" id="addDevice">
  <form class="layui-form layui-form-pane" action="" method="post" lay-filter="deviceForm" id="deviceForm">
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">设备编号</label>
        <div class="layui-input-inline">
          <input type="text" name="deviceId" lay-verify="required" placeholder="设备编号" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-inline">
        <label class="layui-form-label">设备名称</label>
        <div class="layui-input-inline">
          <input type="text" name="deviceName" lay-verify="required" placeholder="设备名称" autocomplete="off" class="layui-input">
        </div>
      </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">型号</label>
        <div class="layui-input-inline">
          <input type="text" name="model" lay-verify="required" placeholder="型号" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-inline">
        <label class="layui-form-label">报修时间</label>
        <div class="layui-input-inline">
          <input type="text" name="repairTime" lay-verify="required|date" id="date2" placeholder="报修时间" autocomplete="off" class="layui-input">
        </div>
      </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">报修人编号</label>
        <div class="layui-input-inline">
          <input type="text" name="student.stuId" value="${user.userId}" readonly lay-verify="required" placeholder="报修人" autocomplete="off" class="layui-input">
        </div>
      </div>
    </div>
    <div class="layui-form-item layui-form-text layui-row">
      <div class="layui-col-xs12">
        <label class="layui-form-label">故障现象描述</label>
        <div class="layui-input-block">
          <textarea name="describes" lay-verify="required" placeholder="故障现象描述" autocomplete="off" class="layui-textarea"></textarea>
        </div>
      </div>
    </div>

    <div class="layui-form-item">
      <div class="layui-input-block">
        <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo2">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
      </div>
    </div>
  </form>
</div>

<script type="text/javascript" src="<c:url value="/layui/layui.js"/>"></script>
<script type="text/javascript">

    layui.use(['table', 'layer', 'form', 'jquery', 'laydate', 'laytpl'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.jquery;
        var laydate = layui.laydate;
        var laytpl = layui.laytpl;
        //日期
        laydate.render({
            elem: '#date',  //绑定id
            type: 'date',  //时间类型
            value: new Date(),  //设定初始值
            trigger: 'click', //采用click弹出
            min: '0',  //设定有限范围内的日期或时间值，不在范围内的将不可选中
            max: '0'   //设定有限范围内的日期或时间值，不在范围内的将不可选中
        });
        //日期
        laydate.render({
            elem: '#date2',  //绑定id
            type: 'date',  //时间类型
            value: new Date(),  //设定初始值
            trigger: 'click', //采用click弹出
            min: '0',  //设定有限范围内的日期或时间值，不在范围内的将不可选中
            max: '0'   //设定有限范围内的日期或时间值，不在范围内的将不可选中
        });
        //时间
        laydate.render({
            elem: '#dateTime',  //绑定id
            type: 'time',  //时间类型
            value: new Date(),  //设定初始值
            trigger: 'click', //采用click弹出
            min: '0',  //设定有限范围内的日期或时间值，不在范围内的将不可选中
            max: '0'   //设定有限范围内的日期或时间值，不在范围内的将不可选中
        });
        //数据表格
        var tableIns = table.render({
            elem: '#demo',
            text: {
                none: '暂无相关数据/请登录后查看' //自定义文本，如空数据时的异常提示等。
            },
            url: 'workAction_stuIdPage.action?result=${user.userId}', //数据接口
            page: true, //开启分页
            limit: 3,  //每页显示记录数
            limits: [5, 10, 15, 20, 25],
            toolbar: '#toolbarDemo',  //开启表格头部工具栏区域
            defaultToolbar: [],
            skin: '',  //边框风格
            even: true,  //开启隔行背景
            size: '',  //大小尺寸的表格
            // totalRow: true,  //开启合计
            cols: [[ //表头
                {type: 'checkbox', fixed: 'left'},  //开启左边复选框
                {field: 'wid', title: 'ID', width: 80, sort: true, align: 'center', fixed: 'left'},
                {field: 'weekTime', title: '周次', sort: true, align: 'center'},
                {field: 'week', title: '星期', sort: true, align: 'center'},
                {field: 'workTime', title: '日期', sort: true, align: 'center'},
                {field: 'sysTime', title: '填写时间', sort: true, align: 'center'},
                {field: 'jobContent', title: '工作内容', sort: true, align: 'center'},
                {field: 'student.stuName', title: '姓名', sort: true, align: 'center', templet: '<div>{{d.student.stuName}}</div>'},
                {field: 'right', title: '操作', width: 120, toolbar: '#barDemo', align: 'center'}
            ]]
        });
        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            switch (obj.event) {
                case 'addWork':
                    //打开添加页面
                    openAddPage();
                    break;
                case 'addDevice':
                    //打开填写维修申请页面
                    openAddDevicePage();
                    break;
            }
            ;
        });

        //打开添加页面
        function openAddPage() {
            layer.open({
                type: 1,    //类型
                title: '填写工作内容信息',    //标题
                area: ['700px', '500px'],    //宽高
                content: $("#add"),    //内容
                skin: 'layui-layer-lan',    //框框皮肤
                anim: 2,    //动画
                success: function (index) {    //打开页面成功的回调
                }
            });
        };

        //打开填写维修申请页面
        function openAddDevicePage() {
            //序列化表单数据
            var serialize = $("#workForm").serialize();
            layer.open({
                type: 1,    //类型
                title: '填写实验教学仪器设备维修申报表',    //标题
                area: ['700px', '500px'],    //宽高
                content: $("#addDevice"),    //内容
                skin: 'layui-layer-lan',    //框框皮肤
                anim: 2,    //动画
                success: function (index) {    //打开页面成功的回调
                }
            });
        };
        //保存工作内容信息
        form.on('submit(demo)', function () {
            //序列化表单数据
            var serialize = $("#workForm").serialize();
            $.ajax({
                url: 'workAction_add.action',
                type: 'post',
                dataType: 'json',
                data: serialize,
                success: function (data) {
                    layer.msg('提交成功');
                    layer.closeAll('page'); //关闭所有页面层
                    tableIns.reload();  //刷新数据表格
                }
            });
            //防止页面跳转
            return false;
        });
        //保存设备维修申请信息
        form.on('submit(demo2)', function () {
            //序列化表单数据
            var serialize = $("#deviceForm").serialize();
            $.ajax({
                url: 'deviceAction_add.action',
                type: 'post',
                dataType: 'json',
                data: serialize,
                success: function (data) {
                    layer.msg('提交成功');
                    layer.closeAll('page'); //关闭所有页面层
                    tableIns.reload();  //刷新数据表格
                }
            });
            //防止页面跳转
            return false;
        });

    });
</script>
</body>
</html>
