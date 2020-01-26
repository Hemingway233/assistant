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

<script type="text/html" id="barDemo">

  {{#  if(${count} >= 1){ }}
  <a class="layui-btn layui-btn-danger layui-btn-xs">只能应聘一个岗位</a>
  {{#  } else { }}
  <a class="layui-btn layui-btn-xs" lay-event="join">报名</a>
  {{#  } }}

</script>

<script type="text/javascript" src="<c:url value="/layui/layui.js"/>"></script>
<script type="text/javascript">

    layui.use(['table', 'layer', 'form', 'jquery', 'laydate'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.jquery;
        var laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date',  //绑定id
            type: 'date',  //时间类型
            value: new Date(),  //设定初始值
            trigger: 'click', //采用click弹出
            min: '0',  //设定有限范围内的日期或时间值，不在范围内的将不可选中
            max: '0'   //设定有限范围内的日期或时间值，不在范围内的将不可选中
        });

        var tableIns = table.render({
            elem: '#demo',
            text: {
                none: '请登陆后再查看自己的报名信息！' //自定义文本，如空数据时的异常提示等。
            },
            url: 'entryFormAction_toEntryPage.action?result=${user.userId}', //数据接口
            page: true, //开启分页
            limit: 5,  //每页显示记录数
            limits: [5, 10, 15, 20, 25],
            even: true,  //开启隔行背景
            cols: [[ //表头
                {type: 'checkbox', fixed: 'left'},  //开启左边复选框
                {field: 'eid', title: 'ID', width: 80, align: 'center', sort: true, align: 'center', fixed: 'left'},
                {field: 'recruitName', title: '岗位名称', align: 'center', sort: true, align: 'center'},
                {field: 'describes', title: '技能描述', align: 'center', sort: true, align: 'center'},
                {field: 'applyTime', title: '申请时间', align: 'center', sort: true, align: 'center'},
                {field: 'department', title: '应聘部门', align: 'center', sort: true, templet: '<div>{{ d.recruit.department }}</div>'},
                {field: 'status', title: '审核状态', align: 'center', sort: true, align: 'center',  //edit: 'text' 单元格编辑
                    templet: function (d) {  //注意：回调函数d的类型为Object类型
                        if (d.status == '0') {
                            return '<span>未审核</span>';
                        } else if (d.status == '1') {
                            return '<span style="color:#04ff1f;">已进入面试环节</span>';
                        } else if (d.status == '2') {
                            return '<span style="color:#F00;">未进入面试环节</span>';
                        } else if (d.status == '3') {
                            return '<span style="color:#04ff1f;">面试已通过</span>';
                        } else if (d.status == '4') {
                            return '<span style="color:#F00;">面试未通过</span>';
                        }
                    }
                },
                {field: 'right', title: '备注', width: 150, toolbar: '#barDemo', align: 'center'}
            ]]
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event === 'join') {
                //打开报名页面
                openJoinPage(data);
            }
        });

        //打开报名页面
        function openJoinPage(data) {
            layer.open({
                type: 1,    //类型
                title: '填写报名信息',    //标题
                area: ['700px', '500px'],    //宽高
                content: $("#add"),    //内容
                skin: 'layui-layer-lan',    //框框皮肤
                anim: 2,    //动画
                success: function (index) {    //打开页面成功的回调
                    //$("#recruitForm")[0].reset();    //清空表单数据
                    $('#rid').attr("value", data.rid);  //给input标签的招聘计划编号赋值
                }
            });
        };

        //修改信息
        form.on('submit(demo)', function () {
            //序列化表单数据
            var serialize = $("#entryForm").serialize();
            $.ajax({
                url: 'entryFormAction_entryFormAdd.action',
                type: 'post',
                dataType: 'json',
                data: serialize,
                success: function (data) {
                    if (data == 'true') {
                        layer.msg('报名成功');
                        layer.closeAll('page'); //关闭所有页面层
                        tableIns.reload();  //刷新数据表格
                    } else {
                        layer.msg('报名失败！');
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
