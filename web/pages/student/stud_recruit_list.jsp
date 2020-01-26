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
  <title></title>
  <link rel="stylesheet" href="<c:url value="/layui/css/layui.css"/>">
</head>
<body>

<table id="demo" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
  <div class="layui-form-item">
    <div class="layui-inline">
      <div class="layui-input-inline">
        <a class="layui-btn" lay-event="selectEntryForm" href="<c:url value="/pages/student/stud_entryForm_list.jsp"/>">查看报名结果情况</a>
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

<script type="text/html" id="barDemo">

  {{#  if(${count} >= 1){ }}
  <a class="layui-btn layui-btn-danger layui-btn-xs">报名成功，只能应聘一个岗位</a>
  {{#  } else if(${count} == -1){ }}
  <span>请登录后再报名</span>
  {{#  } else { }}
  <a class="layui-btn layui-btn-xs" lay-event="join">报名</a>
  {{#  } }}

</script>

<div class="login-main" style="display: none;margin-top: 20px;margin-left: 20px;margin-right: 20px" id="add">
  <form class="layui-form layui-form-pane" action="" method="post" lay-filter="entryForm" id="entryForm">
    <div class="layui-form-item layui-row">
      <div class="layui-col-xs12">
        <label class="layui-form-label">岗位名称</label>
        <div class="layui-input-block">
          <input type="text" name="recruitName" lay-verify="required" placeholder="岗位名称" autocomplete="off" class="layui-input">
        </div>
      </div>
    </div>

    <div class="layui-form-item layui-form-text layui-row">
      <div class="layui-col-xs12">
        <label class="layui-form-label">技能描述</label>
        <div class="layui-input-block">
          <textarea name="describes" lay-verify="required" placeholder="请输入内容" autocomplete="off" class="layui-textarea"></textarea>
        </div>
      </div>
    </div>

    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">申请人</label>
        <div class="layui-input-inline">
          <input type="text" name="student.userName" value="${user.userName}" readonly lay-verify="required" placeholder="申请人" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-inline">
        <label class="layui-form-label">申请时间</label>
        <div class="layui-input-inline">
          <input type="text" name="applyTime" id="date" lay-verify="required|date" placeholder="申请时间" autocomplete="off" class="layui-input">
        </div>
      </div>
    </div>

    <div class="layui-form-item">
      <div class="layui-inline" style="display: none">
        <label class="layui-form-label">招聘计划编号</label>
        <div class="layui-input-inline">
          <input type="text" name="recruit.rid" id="rid" lay-verify="required" placeholder="招聘计划编号" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-inline">
        <label class="layui-form-label">学号</label>
        <div class="layui-input-inline">
          <input type="text" name="student.stuId" value="${user.userId}" readonly lay-verify="required" placeholder="申请部门" autocomplete="off" class="layui-input">
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

<script type="text/javascript" src="<c:url value="/layui/layui.js"/>"></script>
<script type="text/javascript">

    layui.use(['table', 'layer', 'form', 'jquery', 'laydate'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.jquery;
        var laydate = layui.laydate;

        var result;  //定义全局变量：结果集
        var data;  //定义全局变量：表格数据

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
                none: '暂不招聘实验室助理！' //自定义文本，如空数据时的异常提示等。
            },
            url: 'studentAction_studPageList.action', //数据接口
            page: true, //开启分页
            limit: 5,  //每页显示记录数
            limits: [5, 10, 15, 20, 25],
            toolbar: '#toolbarDemo',  //开启表格头部工具栏区域
            defaultToolbar: [],  //禁用表格头部工具栏区域
            even: true,  //开启隔行背景
            cols: [[ //表头
                {type: 'checkbox', fixed: 'left'},  //开启左边复选框
                {field: 'rid', title: 'ID', width: 80, align: 'center', sort: true, align: 'center', fixed: 'left'},
                {field: 'recruitName', title: '招聘计划名称', align: 'center', sort: true, align: 'center'},
                {field: 'jobRequire', title: '工作要求', align: 'center', sort: true, align: 'center'},
                {field: 'amount', title: '招聘数量', align: 'center', sort: true, align: 'center'},
                {field: 'department', title: '所属部门', align: 'center', sort: true, align: 'center'},
                {field: 'status', title: '审核状态', align: 'center', sort: true, align: 'center',  //edit: 'text' 单元格编辑
                    templet: function (d) {  //注意：回调函数d的类型为Object类型
                        if (d.status == '0') {
                            return '<span>未审核</span>';
                        } else if (d.status == '1') {
                            return '<span style="color:#04ff1f;">审核已通过</span>';
                        } else if (d.status == '2') {
                            return '<span style="color:#F00;">审核未通过</span>';
                        }
                    }
                },
                {field: 'right', title: '操作', width: 250, toolbar: '#barDemo', align: 'center'}
            ]]
        });

        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'selectEntryForm':
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            data = obj.data;
            if (obj.event === 'join') {
                //验证报名人数是否超过应聘数量
                studAmount(data);
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
            //验证报名人数是否超过应聘数量
            studAmount2(data);
            //判断
            if (result == false) {
                layer.msg("报名失败，招聘人数已上限。");
                layer.closeAll('page'); //关闭所有页面层
                tableIns.reload();  //刷新数据表格
            } else if (result == true) {
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
                        } else {
                            layer.msg('报名失败！');
                        }
                        layer.closeAll('page'); //关闭所有页面层
                        tableIns.reload();  //刷新数据表格
                        //location.reload();  //刷新整个页面
                    }
                });
            }
            //防止页面跳转
            return false;
        });

        //报名前的验证：每个学生只能应聘一个岗位，如果应聘的人数超过岗位招聘人数，系统拒绝报名请求。
        function studAmount(data) {
            $.post('entryFormAction_studAmount.action', {"amount": data.amount, "rid": data.rid}, function (d) {
                if (d == 'false') {
                    layer.msg("报名失败，招聘人数已上限。");
                } else if (d == 'true') {
                    //打开报名页面
                    openJoinPage(data);
                }
            });
        }

        //报名时的验证：每个学生只能应聘一个岗位，如果应聘的人数超过岗位招聘人数，系统拒绝报名请求。
        function studAmount2(data) {
            $.post('entryFormAction_studAmount.action', {"amount": data.amount, "rid": data.rid}, function (d) {
                if (d == 'false') {
                    result = false;
                } else if (d == 'true') {
                    result = true;
                }
            });
        }

    });
</script>
</body>
</html>
