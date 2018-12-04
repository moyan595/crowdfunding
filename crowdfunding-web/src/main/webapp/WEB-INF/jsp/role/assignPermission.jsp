<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/ztree/zTreeStyle.css">
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
           <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹网 - 许可维护</a></div>
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

			<div class="panel panel-default">
              <div class="panel-heading"><i class="glyphicon glyphicon-th-list"></i> 权限菜单列表 <div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
			  	  <button onclick="doAssignPermission()" class="btn btn-success">分配许可</button>
                  <br><br>
                  <ul id="permissionTree" class="ztree"></ul>
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
				<h4>没有默认类</h4>
				<p>警告框没有默认类，只有基类和修饰类。默认的灰色警告框并没有多少意义。所以您要使用一种有意义的警告类。目前提供了成功、消息、警告或危险。</p>
			  </div>
			<div class="bs-callout bs-callout-info">
				<h4>没有默认类</h4>
				<p>警告框没有默认类，只有基类和修饰类。默认的灰色警告框并没有多少意义。所以您要使用一种有意义的警告类。目前提供了成功、消息、警告或危险。</p>
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
	<script src="${pageContext.request.contextPath }/ztree/jquery.ztree.all-3.5.min.js"></script>
        <script type="text/javascript">
        	var treeObj;
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
			    
				
			    //zTree setting 设置
				var setting = {
					view: {
						//不支持同时选择多个节点
						selectedMulti: false,
						addDiyDom: function(treeId, treeNode){
							//自定义图标
							var icoObj = $("#" + treeNode.tId + "_ico"); // tId = permissionTree_1, $("#permissionTree_1_ico")
							if ( treeNode.icon ) {
								icoObj.removeClass("button ico_docu ico_open").addClass(treeNode.icon).css("background","");
							}
						}
					},
					//显示复选框
					check: {
						enable: true
					},
					//异步加载数据
					async: {
						enable: true,
						url: "${pageContext.request.contextPath }/role/goAssignPermission?id=${param.id}"
					},
					data: {
						//支持json简单数据
						simpleData: {
							enable: true,
							idKey: "id",
							pIdKey: "pId",
							rootPId: 0
						}
					}
				};
			    
			    //初始化树
				treeObj = $.fn.zTree.init($("#permissionTree"), setting); //异步访问数据
				
            });
        	
        	//分配许可
            function doAssignPermission(){
        		var layerLoad;
        		//获取勾选的所有节点
            	var nodes = treeObj.getCheckedNodes(true);
        		if(nodes.length == 0){
        			layer.msg("请选择许可后再进行分配！", {time:2000, icon:5});
        		}else{
        			var vdata = "roleId=${param.id}";
        			$(nodes).each(function(){
        				vdata += "&permissionIds=" + this.id;
        			});

        			$.ajax({
        				type: "POST",
        				url: "${pageContext.request.contextPath }/role/doAssignPermission",
        				data: vdata,
        				dataType: "json",
        				beforeSend: function(){
        					layerLoad = layer.load();
        				},
        				success: function(data){
        					layer.close(layerLoad);
        					if(data.success){
        						layer.msg(data.content, {time: 2000, icon:6}, function(cindex){
        							layer.close(cindex);
        							window.location.href = "${pageContext.request.contextPath }/role/assignPermission?id=${param.id}";
        						});
        						
        					}else{
        						layer.msg(data.content, {time: 2000, icon:5}, function(cindex){
        							layer.close(cindex);
        						});
        					}
        				}
        			});
        		}
        	}
        </script>
  </body>
</html>