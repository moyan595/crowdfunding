<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<title>众筹网</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/main.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/doc.min.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	</style>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="user.html">众筹平台 - 用户维护</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li style="padding-top:8px;">
				<div class="btn-group">
				  <button type="button" class="btn btn-default btn-success dropdown-toggle" data-toggle="dropdown">
					<i class="glyphicon glyphicon-user"></i> ${sessionScope.user.userName} <span class="caret"></span>
				  </button>
					  <ul class="dropdown-menu" role="menu">
						<li><a href="#"><i class="glyphicon glyphicon-cog"></i> 个人设置</a></li>
						<li><a href="#"><i class="glyphicon glyphicon-comment"></i> 消息</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath }/logout"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
					  </ul>
			    </div>
			</li>
            <li style="margin-left:10px;padding-top:8px;">
				<button type="button" class="btn btn-default btn-danger">
				  <span class="glyphicon glyphicon-question-sign"></span> 帮助
				</button>
			</li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
			<div class="tree">
				<%@ include file="/WEB-INF/jsp/common/menu.jsp" %>
			</div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
				  <li><a href="#">首页</a></li>
				  <li><a href="#">数据列表</a></li>
				  <li class="active">新增</li>
				</ol>
			<div class="panel panel-default">
              <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
				<form role="form" id="permissionForm">
				  <c:if test="${not empty param.pId}">
				  	<input type="hidden" name="pId" value="${param.pId }" />
				  </c:if>
				  <c:if test="${not empty param.id}">
				  	<input type="hidden" name="id" value="${param.id }" />
				  </c:if>
				  <div class="form-group">
					<label for="permissionNameLabel">许可名</label>
					<input type="text" class="form-control" name="name" id="pname" value="${permission.name}" placeholder="请输入许可名">
				  </div>
				  
				  <div class="form-group">
					<label for="permissionUrlLabel">URL</label>
					<input type="text" class="form-control" name="url" id="url" value="${permission.url}" placeholder="请输入许可URL">
				  </div>
				  
				  <div class="form-group has-feedback">
					<label for="permissionIconLabel">图标</label>
					<p>
					<input type="radio" name="icon" value="fa fa-fw fa-sitemap"> <i class="fa fa-fw fa-sitemap"></i>
					<input type="radio" name="icon" value="fa fa-fw fa-desktop"> <i class="fa fa-fw fa-desktop"></i>
					<input type="radio" name="icon" value="fa fa-fw fa-cogs"> <i class="fa fa-fw fa-cogs"></i>
					<input type="radio" name="icon" value="fa fa-fw fa-user"> <i class="fa fa-fw fa-user"></i>
					<input type="radio" name="icon" value="fa fa-fw fa-graduation-cap"> <i class="fa fa-fw fa-graduation-cap"></i>
					<input type="radio" name="icon" value="fa fa-fw fa-check-square-o"> <i class="fa fa-fw fa-check-square-o"></i>
					<input type="radio" name="icon" value="glyphicon glyphicon-lock"> <i class="glyphicon glyphicon-lock"></i>
				  	</p>
				  </div>
				  
				  <button type="button" onclick="savePermission()" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> 保存</button>
				  <button type="button" onclick="resetPermission()" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
				</form>
			  </div>
			</div>
        </div>
      </div>
    </div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">帮助</h4>
		  </div>
		  <div class="modal-body">
			<div class="bs-callout bs-callout-info">
				<h4>测试标题1</h4>
				<p>测试内容1，测试内容1，测试内容1，测试内容1，测试内容1，测试内容1</p>
			  </div>
			<div class="bs-callout bs-callout-info">
				<h4>测试标题2</h4>
				<p>测试内容2，测试内容2，测试内容2，测试内容2，测试内容2，测试内容2</p>
			  </div>
		  </div>
		  <!--
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary">Save changes</button>
		  </div>
		  -->
		</div>
	  </div>
	</div>
    <script src="${pageContext.request.contextPath }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/script/docs.min.js"></script>
	<script src="${pageContext.request.contextPath }/layer/layer.js"></script>
        <script type="text/javascript">
            $(function () {
			    $(".list-group-item").click(function(){
				    if ( $(this).find("ul") ) {
						$(this).toggleClass("tree-closed");
						if ( $(this).hasClass("tree-closed") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
						}
					}
				});
            });
            
            var layerLoad;
            //新增角色
            function savePermission(){
            	var url = '';
            	var id = '${param.id}';
            	if(id != ""){
            		url = '${pageContext.request.contextPath }/permission/doUpdate';
            	}else{
            		url = '${pageContext.request.contextPath }/permission/doAdd';
            	}
            	console.log(url);
            	$.ajax({
            		type: "POST",
            		url: url,
            		data: $("#permissionForm").serialize(),
            		dataType: "json",
            		beforSend: function(){
            			layerLoad = layer.load();
            		},
            		success: function(data){
            			layer.close(layerLoad);
            			if(data.success){
            				layer.msg(data.content, {time: 1000, icon: 6}, function(cindex){
            					layer.close(cindex);
            					window.location.href = "${pageContext.request.contextPath }/permission";
            				});
            			}else{
            				layer.msg(data.content, {time: 2000, icon:5}, function(cindex){
            					layer.close(cindex);
            				})
            			}
            		}
            	});
            }
            
            //重置表单
            function resetPermisssion(){
            	$("#permissionForm")[0].reset();
            }
        </script>
  </body>
</html>