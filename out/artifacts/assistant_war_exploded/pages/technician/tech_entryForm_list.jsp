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

  {{#  if(d.status == 0){ }}
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  {{#  } else if(d.status == 1){ }}
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  {{#  } else if(d.status == 2){ }}
  <a class="layui-btn layui-btn-danger layui-btn-xs">未进入面试环节</a>
  {{#  } else if(d.status == 3 && d.student.laboratory == ""){ }}
  <a class="layui-btn layui-btn-xs" lay-event="employ">录入人员档案信息</a>
  {{#  } else if(d.status == 3 && d.student.laboratory != ""){ }}
  <a class="layui-btn layui-btn-danger layui-btn-xs">已录入档案信息</a>
  {{#  } else if(d.status == 4){ }}

  {{#  } }}

</script>

<div class="login-main" style="display: none;margin-top: 20px;margin-left: 20px;margin-right: 20px" id="edit">
  <form class="layui-form layui-form-pane" action="" method="post" lay-filter="entryForm" id="entryForm">
    <div class="layui-form-item">
      <label class="layui-form-label">审核环节：</label>
      <div class="layui-input-block">
        <select name="status">
          <option value="" selected=""></option>
          <option value="1">进入面试环节</option>
          <option value="2">面试环节不通过</option>
          <option value="3">录用</option>
          <option value="4">不录用</option>
        </select>
      </div>
    </div>
    <div style="display: none">
      <div class="layui-form-item layui-row">
        <div class="layui-col-xs12">
          <label class="layui-form-label">岗位名称</label>
          <div class="layui-input-block">
            <input type="text" name="recruitName" readonly lay-verify="required" placeholder="岗位名称" autocomplete="off" class="layui-input">
          </div>
        </div>
      </div>
      <div class="layui-form-item layui-form-text layui-row">
        <div class="layui-col-xs12">
          <label class="layui-form-label">技能描述</label>
          <div class="layui-input-block">
            <textarea name="describes" readonly lay-verify="required" placeholder="请输入内容" autocomplete="off" class="layui-textarea"></textarea>
          </div>
        </div>
      </div>
      <div class="layui-form-item">
        <div class="layui-inline">
          <label class="layui-form-label">申请人</label>
          <div class="layui-input-inline">
            <input type="text" name="" value="${user.userName}" readonly lay-verify="required" placeholder="申请人" autocomplete="off" class="layui-input">
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
        <div class="layui-inline">
          <label class="layui-form-label">报名编号</label>
          <div class="layui-input-inline">
            <input type="text" name="entryId" readonly lay-verify="required" placeholder="报名编号" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-inline">
          <label class="layui-form-label">招聘计划主键</label>
          <div class="layui-input-inline">
            <input type="text" name="recruit.rid" id="rid" readonly lay-verify="required" placeholder="招聘计划主键" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-inline">
          <label class="layui-form-label">学号</label>
          <div class="layui-input-inline">
            <input type="text" name="student.stuId" id="stuId" readonly lay-verify="required" placeholder="学号" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-inline">
          <label class="layui-form-label">报名表主键</label>
          <div class="layui-input-inline">
            <input type="text" name="eid" readonly lay-verify="required" placeholder="报名表主键" autocomplete="off" class="layui-input">
          </div>
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

<div class="login-main" style="display: none;margin-top: 20px;margin-left: 20px;margin-right: 20px" id="add">
  <form class="layui-form layui-form-pane" action="" method="post" lay-filter="studentForm" id="studentForm">
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">学号</label>
        <div class="layui-input-inline">
          <input type="text" name="stuId" id="stuId1" readonly lay-verify="required" placeholder="学号" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-inline">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
          <input type="text" name="stuName" id="stuName" readonly lay-verify="required" placeholder="姓名" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-inline">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
          <input type="password" name="password" id="password" readonly lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input">
        </div>
      </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">专业</label>
        <div class="layui-input-inline">
          <input type="text" name="major" id="major" readonly lay-verify="required" placeholder="专业" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-inline">
        <label class="layui-form-label">学院</label>
        <div class="layui-input-inline">
          <input type="text" name="department" id="department" readonly lay-verify="required" placeholder="学院" autocomplete="off" class="layui-input">
        </div>
      </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">班级</label>
        <div class="layui-input-inline">
          <input type="text" name="className" id="className" readonly lay-verify="required" placeholder="班级" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-inline">
        <label class="layui-form-label">年级</label>
        <div class="layui-input-inline">
          <input type="text" name="grade" id="grade" readonly lay-verify="required" placeholder="年级" autocomplete="off" class="layui-input">
        </div>
      </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-inline">
          <input type="text" name="phone" id="phone" readonly lay-verify="required" placeholder="手机号" autocomplete="off" class="layui-input">
        </div>
      </div>
      <div class="layui-inline">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-inline">
          <input type="text" name="email" id="email" readonly lay-verify="required" placeholder="邮箱" autocomplete="off" class="layui-input">
        </div>
      </div>
    </div>
    <div class="layui-form-item">
      <div class="layui-inline">
        <label class="layui-form-label">所属实验室</label>
        <div class="layui-input-inline">
          <select name="laboratory">
            <option value="" selected=""></option>
            <option value="公共基础实验室">公共基础实验室</option>
            <option value="专业技术实验室">专业技术实验室</option>
          </select>
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
            url: 'entryFormAction_toRidEntryPage.action?result=${result}', //数据接口
            page: true, //开启分页
            limit: 5,  //每页显示记录数
            limits: [5, 10, 15, 20, 25],
            even: true,  //开启隔行背景
            cols: [[ //表头
                {type: 'checkbox', fixed: 'left'},  //开启左边复选框
                {field: 'eid', title: 'ID', width: 80, align: 'center', sort: true, align: 'center', fixed: 'left'},
                {field: 'student.stuId', title: '学号', align: 'center', sort: true, align: 'center', templet: '<div>{{ d.student.stuId }}</div>'},
                {field: 'student.stuName', title: '申请人', align: 'center', sort: true, align: 'center', templet: '<div>{{ d.student.stuName }}</div>'},
                {field: 'recruitName', title: '申请的岗位', align: 'center', sort: true, align: 'center'},
                {field: 'describes', title: '技能描述', align: 'center', sort: true, align: 'center'},
                {field: 'applyTime', title: '申请时间', align: 'center', sort: true, align: 'center'},
                {field: 'department', title: '应聘部门', align: 'center', sort: true, align: 'center', templet: '<div>{{ d.recruit.department }}</div>'},
                {field: 'status', title: '审核状态', align: 'center', sort: true, align: 'center',   //edit: 'text' 单元格编辑
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
                {field: 'right', title: '操作', width: 150, toolbar: '#barDemo', align: 'center'}
            ]]
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            if (obj.event === 'edit') {
                //打开修改页面
                openEditPage(data);
            } else if (obj.event === 'employ') {
                //打开人员档案信息录入页面
                openAddPage(data);
            }
        });

        //打开修改页面
        function openEditPage(data) {
            layer.open({
                type: 1,    //类型
                title: '审核',    //标题
                area: ['700px', '500px'],    //宽高
                content: $("#edit"),    //内容
                skin: 'layui-layer-lan',    //框框皮肤
                anim: 2,    //动画
                success: function (index) {    //打开页面成功的回调
                    form.val("entryForm", data);    //给表单赋值
                    $('#rid').attr("value", data.recruit.rid);  //给input标签的报名信息主键rid赋值
                    $('#stuId').attr("value", data.student.stuId);  //给input标签的学号stuId赋值
                }
            });
        };

        //打开人员档案信息录入页面
        function openAddPage(data) {
            layer.open({
                type: 1,    //类型
                title: '人员档案信息录入页面',    //标题
                area: ['700px', '500px'],    //宽高
                content: $("#add"),    //内容
                skin: 'layui-layer-lan',    //框框皮肤
                anim: 2,    //动画
                success: function (index) {    //打开页面成功的回调
                    form.val("entryForm", data);    //给表单赋值
                    $('#stuId1').attr("value", data.student.stuId);
                    $('#stuName').attr("value", data.student.stuName);
                    $('#password').attr("value", data.student.password);
                    $('#major').attr("value", data.student.major);
                    $('#department').attr("value", data.student.department);
                    $('#className').attr("value", data.student.className);
                    $('#grade').attr("value", data.student.grade);
                    $('#phone').attr("value", data.student.phone);
                    $('#email').attr("value", data.student.email);
                }
            });
        };

        //修改审核状态
        form.on('submit(demo)', function () {
            //序列化表单数据
            var serialize = $("#entryForm").serialize();
            $.ajax({
                url: 'entryFormAction_entryFormEdit.action',
                type: 'post',
                dataType: 'json',
                data: serialize,
                success: function (data) {
                    if (data == 'true') {
                        layer.msg('修改成功');
                        layer.closeAll('page'); //关闭所有页面层
                        tableIns.reload();  //刷新数据表格
                    } else {
                        layer.msg('修改失败！');
                    }
                    location.reload();  //刷新整个页面
                }
            });
            //防止页面跳转
            return false;
        });

        //录入人员档案信息（修改学生信息）
        form.on('submit(demo2)', function () {
            var serialize = $("#studentForm").serialize();  //序列化表单数据
            $.ajax({
                url: 'studentAction_edit.action',
                type: 'post',
                dataType: 'json',
                data: serialize,
                success: function (data) {
                    layer.msg('录入成功');
                    layer.closeAll('page'); //关闭所有页面层
                    tableIns.reload();  //刷新数据表格
                }
            });
            return false;  //防止页面跳转
        });

    });
</script>
</body>
</html>
