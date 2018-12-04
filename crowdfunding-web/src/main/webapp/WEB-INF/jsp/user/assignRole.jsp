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
					<i class="glyphicon glyphicon-user"></i> ${sessionScope.user.userName }<span class="caret"></span>
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
				  <li class="active">分配角色</li>
				</ol>
			<div class="panel panel-default">
			  <div class="panel-body">
				<form role="form" class="form-inline">
				  <div class="form-group">
					<label for="exampleInputPassword1">未分配角色列表</label><br>
					<select id="leftList" class="form-control" multiple size="10" style="width:200px;overflow-y:auto;">
                        <c:forEach items="${requestScope.allRoles }" var="role">
                        <option value="${role.id}">${role.roleName}</option>
                        </c:forEach>
                    </select>
				  </div>
				  <div class="form-group">
                        <ul>
                            <li onclick="leftToRight()" class="btn btn-default glyphicon glyphicon-chevron-right" title="分配角色"></li>
                            <br>
                            <li onclick="rightToLeft()" class="btn btn-default glyphicon glyphicon-chevron-left" title="移除角色" style="margin-top:20px;"></li>
                        </ul>
				  </div>
				  <div class="form-group" style="margin-left:40px;">
					<label for="exampleInputPassword1">已分配角色列表</label><br>
					<select id="rightList" class="form-control" multiple size="10" style="width:200px;overflow-y:auto;">
                        <c:forEach items="${requestScope.userRoles }" var="role">
                        <option value="${role.id}">${role.roleName}</option>
                        </c:forEach>
                    </select>
				  </div>
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
            
            function leftToRight(){
            	console.log("${param.id}");
            	var layerLoad;
            	var opts = $("#leftList option:selected");
            	
            	if(opts.length == 0){
            		layer.msg("请至少选择一项操作！", {time:1000, icon:5});
            	}else{
                	var roleIds = [];
                	$.each(opts, function(){
                		roleIds.push(this.value);
                	})
                	//提交
                	$.ajax({
                		type: "POST",
                		url: "${pageContext.request.contextPath }/user/assignRole",
                		data: {
                			"roleIds": roleIds.join(","),
                			"id": "${param.id}"
                		},
                		dataType: "json",
                		beforeSend: function(){
                			layerLoad = layer.load();
                		},
                		success: function(data){
                			layer.close(layerLoad);
                			if(data.success){
                				$("#rightList").append(opts);
                				layer.msg(data.content, {time: 1000, icon:6});
                			}else{
                				layer.msg(data.content, {time: 1000, icon:5});
                			}
                		}
                	});
            	}
            }
            
            function rightToLeft(){
            	var layerLoad;
            	var opts = $("#rightList option:selected");
            	
            	//提交
            	if(opts.length == 0){
            		layer.msg("请至少选择一项操作！", {time:1000, icon:5});
            	}else{
                	var roleIds = [];
                	$.each(opts, function(){
                		roleIds.push(this.value);
                	});
                	//提交
                	$.ajax({
                		type: "POST",
                		url: "${pageContext.request.contextPath }/user/unAssignRole",
                		data: {
                			"roleIds": roleIds.join(","),
                			"id": "${param.id}"
                		},
                		dataType: "json",
                		beforeSend: function(){
                			layerLoad = layer.load();
                		},
                		success: function(data){
                			layer.close(layerLoad);
                			if(data.success){
                				$("#leftList").append(opts);
                				layer.msg(data.content, {time: 1000, icon:6});
                			}else{
                				layer.msg(data.content, {time: 1000, icon:5});
                			}
                		}
                	});
            	}
            }
        </script>
  </body>
</html>