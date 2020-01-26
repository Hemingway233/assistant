<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--添加jstl标签库指令--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>实验室助理工作管理系统</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="format-detection" content="telephone=no">

  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
</head>
<body class="layui-layout-body" style='overflow: scroll;overflow-y:hidden'>
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">实验室助理工作管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
          ${user.userName}
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="userAction_logout.action">退出</a></li>
    </ul>
  </div>

  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <c:if test="${user.userType == 0}">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">实验室技术员</a>
          <dl class="layui-nav-child">
            <dd><a href="recruitAction_toPage.action" target="right">招聘计划</a></dd>
            <dd><a href="workAction_toTechWorkPage.action?result=${user.userId}" target="right">查询助理工作内容</a></dd>
            <dd><a href="/assistant/pages/technician/tech_device_list.jsp" target="right">设备维修申请表</a></dd>
          </dl>
        </li>
        </c:if>
        <c:if test="${user.userType == 2}">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">学生工作处</a>
          <dl class="layui-nav-child">
            <dd><a href="pages/studentwork/recruit_list.jsp" target="right">审核招聘计划</a></dd>
          </dl>
        </li>
        </c:if>
        <c:if test="${user.userType == 3}">
        <li class="layui-nav-item layui-nav-itemed">
          <a href="javascript:;">学生</a>
          <dl class="layui-nav-child">
            <dd><a href="studentAction_toRecruitPage.action?result=${user.userId}" target="right">实验室助理招聘计划</a></dd>
          </dl>
        </li>
        </c:if>
        <c:if test="${user.userType == 1}">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">实验室助理</a>
          <dl class="layui-nav-child">
            <dd><a href="workAction_toWorkPage.action" target="right">日常工作</a></dd>
          </dl>
        </li>
        </c:if>
      </ul>
    </div>
  </div>

  <div class="layui-body">

    <iframe scrolling="auto" rameborder="0" src="" name="right" width="100%" height="99%"></iframe>

  </div>

  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © assistant.com - 实验室助理工作管理系统
  </div>
</div>
<script src="layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
    //JavaScript代码区域
    layui.use(['element'], function(){
        var element = layui.element;
    });
</script>
</body>
</html>