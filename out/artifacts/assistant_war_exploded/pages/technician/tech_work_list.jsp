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
        <input type="text" class="layui-input" name="workTime" id="workTime" placeholder="日期" autocomplete="off">
      </div>
    </div>
    <div class="layui-inline">
      <div class="layui-input-inline">
        <button class="layui-btn" data-type="reload" lay-event="search">搜索</button>
      </div>
    </div>
  </div>
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
            id: 'reload',
            elem: '#date',  //绑定id
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
            url: 'workAction_userIdPage.action?result=${result}', //数据接口
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
            ]]
        });
        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            switch (obj.event) {
                case 'search':
                    search();
                    break;
            };
        });

        //模糊查询
        function search() {
            var value = $("#workTime").val();
            if (value == "") {
                layer.msg("请输入条件！");
            } else {
                //表格重载
                table.reload('reload', {
                    url: '',
                    where: {
                        weekTime: value,
                        result: ${result},
                    } //设定异步数据接口的额外参数
                });
            }
        };

    });
</script>
</body>
</html>
