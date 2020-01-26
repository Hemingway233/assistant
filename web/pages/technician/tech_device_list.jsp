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
        <input type="text" class="layui-input" name="id" placeholder="请输入ID" autocomplete="off">
      </div>
    </div>
    <div class="layui-inline">
      <div class="layui-input-inline">
        <button class="layui-btn" data-type="reload" lay-event="search">搜索</button>
      </div>
    </div>
  </div>
</script>

<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="export" href="">导出</a>
</script>

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
            url: 'deviceAction_page.action', //数据接口
            page: true, //开启分页
            limit: 3,  //每页显示记录数
            limits: [5, 10, 15, 20, 25],
            toolbar: '#toolbarDemo',  //开启表格头部工具栏区域
            defaultToolbar: ['filter', 'print', 'exports'],
            skin: '',  //边框风格
            even: true,  //开启隔行背景
            size: '',  //大小尺寸的表格
            // totalRow: true,  //开启合计
            cols: [[ //表头
                {type: 'checkbox', fixed: 'left'},  //开启左边复选框
                {field: 'did', title: 'ID', width: 80, sort: true, align: 'center', fixed: 'left'},
                {field: 'deviceId', title: '设备编号', sort: true, align: 'center'},
                {field: 'deviceName', title: '设备名称', sort: true, align: 'center'},
                {field: 'model', title: '型号', sort: true, align: 'center'},
                {field: 'describes', title: '故障现象描述', sort: true, align: 'center'},
                {field: 'repairTime', title: '报修时间', sort: true, align: 'center'},
                {field: 'student.stuName', title: '报修人', sort: true, align: 'center', templet: '<div>{{d.student.stuName}}</div>'},
                {field: 'right', title: '操作', width: 120, toolbar: '#barDemo', align: 'center'}
            ]]
        });
        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            switch (obj.event) {
                case 'search':
            };
        });
        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event === 'export') {
            }
        });

    });
</script>
</body>
</html>
