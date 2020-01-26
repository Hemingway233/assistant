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
  <link rel="stylesheet" href="<c:url value="/layui/css/layui.css"></c:url>">
</head>
<body>
<div class="layui-inline" style="padding-top: 10px;">
  <label class="layui-form-label">搜索ID：</label>
  <div class="layui-input-inline">
    <input type="text" class="layui-input" name="id" id="demoReload" placeholder="ID" autocomplete="off">
  </div>
  <button class="layui-btn" data-type="reload">搜索</button>
</div>
<table id="demo" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
  </div>
</script>

<script type="text/html" id="barDemo">
  {{#  if(d.status == 0){ }}
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
  {{#  } else { }}
  {{#  } }}
</script>

<div class="login-main" style="display: none;margin-top: 20px;margin-left: 20px;margin-right: 20px" id="saveOrUpdate">
  <form class="layui-form layui-form-pane" action="" method="post" lay-filter="recruitForm" id="recruitForm">
    <div style="display: none">
      <div class="layui-form-item layui-row">
        <div class="layui-col-xs12">
          <label class="layui-form-label">招聘名称</label>
          <div class="layui-input-block">
            <input type="text" name="recruitName" lay-verify="required" placeholder="招聘计划名称" autocomplete="off" class="layui-input">
          </div>
        </div>
      </div>

      <div class="layui-form-item layui-form-text layui-row">
        <div class="layui-col-xs12">
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
            <input type="text" name="" placeholder="招聘数量" autocomplete="off" class="layui-input">
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
            <input type="text" name="applyTime" id="date" lay-verify="required|date" placeholder="申请时间" autocomplete="off" class="layui-input">
          </div>
        </div>

        <div class="layui-inline">
          <label class="layui-form-label">招聘计划编号</label>
          <div class="layui-input-inline">
            <input type="text" name="recruitId" placeholder="招聘计划编号" autocomplete="off" class="layui-input">
          </div>
        </div>

        <div class="layui-inline">
          <label class="layui-form-label">ID</label>
          <div class="layui-input-inline">
            <input type="text" name="rid" placeholder="ID" autocomplete="off" class="layui-input">
          </div>
        </div>

        <div class="layui-inline">
          <label class="layui-form-label">申请人编号</label>
          <div class="layui-input-inline">
            <input type="text" name="user.userId" id="userId" placeholder="申请人编号" autocomplete="off" class="layui-input">
          </div>
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
        <label class="layui-form-label">审核：</label>
        <div class="layui-input-block">
          <input type="radio" name="status" value="2" title="不通过">
          <input type="radio" name="status" value="1" title="通过">
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
            trigger: 'click', //采用click弹出
        });

        //数据表格
        var tableIns = table.render({
            elem: '#demo',
            text: {
                none: '暂无相关数据' //自定义文本，如空数据时的异常提示等。
            },
            url: 'recruitAction_findPageList.action', //数据接口
            page: true, //开启分页
            limit: 5,  //每页显示记录数
            limits: [5, 10, 15, 20, 25],
            toolbar: '#toolbarDemo',  //开启表格头部工具栏区域
            defaultToolbar: ['filter', 'print', 'exports', {
                title: '提示' //标题
                , layEvent: 'LAYTABLE_TIPS' //事件名，用于 toolbar 事件中使用
                , icon: 'layui-icon-tips' //图标类名
            }],
            skin: '',  //边框风格
            even: true,  //开启隔行背景
            size: '',  //大小尺寸的表格
            // totalRow: true,  //开启合计
            cols: [[ //表头
                {type: 'checkbox', fixed: 'left'},  //开启左边复选框
                //type:'radio'},  //开启左边单选框
                {field: 'rid', title: 'ID', width: 80, sort: true, align: 'center', fixed: 'left'},
                {field: 'recruitId', title: '招聘计划编号', sort: true, align: 'center'},
                {field: 'recruitName', title: '招聘计划名称', sort: true, align: 'center'},
                {field: 'jobRequire', title: '工作要求', sort: true, align: 'center'},
                {field: 'amount', title: '招聘数量', sort: true, align: 'center'},
                {field: 'department', title: '申请部门', sort: true, align: 'center'},
                {field: 'applicant', title: '申请人', sort: true, align: 'center'},
                {field: 'applyTime', title: '申请时间', sort: true, align: 'center'},
                {field: 'userId', title: '申请人编号', sort: true, align: 'center', templet: '<div>{{d.user.userId}}</div>'},
                {field: 'status', title: '审核状态', sort: true, align: 'center',  //edit: 'text' 单元格编辑
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
                {field: 'right', title: '操作', width: 120, toolbar: '#barDemo', align: 'center'}
            ]]
        });

        //头工具栏事件
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    break;

                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            console.log(data);
            if (obj.event === 'del') {
                layer.confirm('删除真的行么', function (index) {
                    //向服务器发送删除指令
                    $.post('recruitAction_del.action', {rid: data.rid}, function (result) {
                        layer.msg("删除成功！");
                        tableIns.reload();  //刷新数据表格
                    });
                    layer.close(index); //关闭弹出框
                });
            } else if (obj.event === 'edit') {
                if (data.status == '0') {
                    openEditPage(data);
                } else if (data.status == '1' || data.status == '2') {
                    layer.msg('已审核，不可以修改！');
                }
            }
        });

        //打开添加页面
        function openAddPage() {
            layer.open({
                type: 1,    //类型
                title: '添加招聘计划信息',    //标题
                area: ['700px', '500px'],    //宽高
                content: $("#saveOrUpdate"),    //内容
                skin: 'layui-layer-lan',    //框框皮肤
                anim: 2,    //动画
                success: function (index) {    //打开页面成功的回调
                    $("#recruitForm")[0].reset();    //清空表单数据
                }
            });
        };

        //打开修改页面
        function openEditPage(data) {
            layer.open({
                type: 1,    //类型
                title: '审核',    //标题
                area: ['700px', '500px'],    //宽高
                content: $("#saveOrUpdate"),    //内容
                skin: 'layui-layer-lan',    //框框皮肤
                anim: 2,    //动画
                success: function (index) {    //打开页面成功的回调
                    form.val("recruitForm", data);    //给表单赋值
                    $('#userId').attr("value", data.user.userId);  //给input标签的申请人编号赋值
                    // console.log(data.user.userId);
                }
            });
        };

        //修改信息
        form.on('submit(demo)', function () {
            //序列化表单数据
            var serialize = $("#recruitForm").serialize();
            $.ajax({
                url: 'recruitAction_edit.action',
                type: 'post',
                dataType: 'json',
                data: serialize,
                success: function (data) {
                    if (data == 'true') {
                        layer.msg('修改成功');
                        layer.closeAll('page'); //关闭所有页面层
                        tableIns.reload();  //刷新数据表格
                    } else {
                        layer.msg('修改失败，因为你还没有登录！');
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
