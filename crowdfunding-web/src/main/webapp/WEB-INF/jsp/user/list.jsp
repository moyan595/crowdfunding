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
	<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-table/bootstrap-table.min.css">
	<style>
		.tree li {
	        list-style-type: none;
			cursor:pointer;
		}
		table tbody tr:nth-child(odd){background:#F4F4F4;}
		table tbody td:nth-child(even){color:#C00;}
	</style>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹网 - 用户维护</a></div>
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
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
			  <form class="form-inline" role="form">
			  	<div class="input-group">
			      <input type="text" id="account" name="account" class="form-control" placeholder="账号模糊查询">
			      <span class="input-group-btn">
			        <button class="btn btn-default" type="button" onclick="queryUser()">
			        	<span class="glyphicon glyphicon-search"></span>
			        </button>
			      </span>
			    </div>
				</form>
				
			    <br>
		          <div>
			          <table id="userTable"></table>
		          </div>
		          <div id="userTableToolbar" class="btn-group">
		          	<button id="btn_add" type="button" class="btn btn-default" onclick="addUser()">
			            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新增
			        </button>
			        <button id="btn_delete" type="button" class="btn btn-default" onclick="batchDeleteUser()">
			            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> 批量删除
			        </button>
				  </div>
			  </div>
			</div>
        </div>
      </div>
    </div>

    <script src="${pageContext.request.contextPath }/jquery/jquery-2.1.1.min.js"></script>
	<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/script/docs.min.js"></script>
	<script src="${pageContext.request.contextPath }/layer/layer.js"></script>
	<script src="${pageContext.request.contextPath }/bootstrap-table/bootstrap-table.min.js"></script>
	<script src="${pageContext.request.contextPath }/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript">
        $(function () {
        	$(".list-group-item a").each(function(){
        		var reg = /user/i;
        		if(this.href.search(reg) != -1){
        			//字体红色
        			$(this).css("color", "red");
        			//父节点展开
        			$(this).parent().parent().slideDown("fast");
        			//$(this).parent().parent().css("display", "block");
        		}
        	});
        	
        	/*
		   $(".list-group-item").click(function(){
			    if ( $(this).find("ul") ) {
					$(this).toggleClass("tree-closed");
					if ( $(this).hasClass("tree-closed") ) {
						$("ul", this).hide("fast");
					} else {
						$("ul", this).show("fast");
					}
				}
			});*/
	        
	        var layerObj;
	        //初始化表格
        	$("#userTable").bootstrapTable({
        		//请求后台的url
        		url: "${pageContext.request.contextPath }/user/users",
        		//请求方式
        		method: "get",
        		//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
        		cache: false,
        		//是否隔行换色
        		striped : true,
        		//是否显示分页
        		//注意：返回结果中必须包含total 和 rows 两个参数
        		//total：总记录数
        		//rows：集合对象，包含当前页数据
        		pagination: true,
        		//传递参数
        		queryParams: queryParams,
        		//分页方式：client客户端分页，server服务端分页
        		sidePagination: "server",
        		//初始化加载第一页，默认第一页
        		pageNumber:1,
        		//每页的记录行数
                pageSize: 10,
                //可供选择的每页的行数
                pageList: [10, 20, 30],
                //表格行的唯一索引，一般用主键值
                uniqueId : "id",
                //显示刷新按钮
                showRefresh: true,
                //是否显示全列按钮
                showColumns: true,
                //
                showToggle: false,
                //表格显示的列
                columns: [{
	                checkbox: true,
	                visible: true
	            }, {
	                field: 'account',
	                title: '账号',
	                align: 'center'
	            }, {
	                field: 'userName',
	                title: '姓名',
	                align: 'center'
	            }, {
	                field: 'email',
	                title: '邮箱地址',
	                align: 'center'
	            }, {
	            	title: '操作',
	            	align: 'center',
	            	//自定义操作列
	            	formatter : function(value, row, index) {
	            		var d = '<button onclick="assignRolePage('+row.id+')" type="button" data-toggle="tooltip" data-placement="bottom" title="分配角色" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>&nbsp;&nbsp;'
							+'<button onclick="updateUser('+row.id+')" type="button" data-toggle="tooltip" data-placement="bottom" title="修改用户" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>&nbsp;&nbsp;'
							+'<button onclick="deleteUser('+row.id+', \''+row.userName+'\')" type="button" data-toggle="tooltip" data-placement="bottom" title="删除用户" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button> ';
							
						return d;
	            	}
	            }],
	            //工具栏
	            toolbar: '#userTableToolbar',
	            //表格body渲染之前调用
	            onPreBody: function(){
	            	layerObj = layer.load(1);
	            },
	            //表格body渲染完成后调用
	            onPostBody: function(){
	            	layer.close(layerObj);
	            	//加载tooltip 插件
	            	$('[data-toggle="tooltip"]').tooltip();
	            }
        	});
      	});
        
        function queryParams(params){
			var temp = {
    				pageNo: this.pageNumber,
    				pageSize: this.pageSize,
    				account: $('#account').val()
    			}
    			return temp;
    		}
        
        //条件查询用户
        function queryUser(){
        	var q = queryParams(null);
        	console.log(q.account);
        	$("#userTable").bootstrapTable('refresh');
        }
        
        //添加用户
        function addUser(){
        	window.location.href = '${pageContext.request.contextPath }/user/add';
        }
      	
      	//修改用户
      	function updateUser(id){
      		window.location.href = "${pageContext.request.contextPath }/user/update?id=" + id;
      	}
      	
      	//去分配角色页面
      	function assignRolePage(id){
      		window.location.href = "${pageContext.request.contextPath }/user/assignRolePage?id=" + id;
      	}
      	
      	var layerLoad;
      	//删除用户
      	function deleteUser(id, userName){
      		layer.confirm("确认要删除 【" + userName + "】信息吗?", function(){
      			$.ajax({
            		type: "POST",
            		url: "${pageContext.request.contextPath }/user/delete",
            		data: {
            			"id": id
            		},
            		dataType: "json",
            		beforSend: function(){
            			layerLoad = layer.load();
            		},
            		success: function(data){
            			layer.close(layerLoad);
            			if(data.success){
            				layer.msg(data.content, {time: 1000, icon: 6}, function(cindex){
            					layer.close(cindex);
            					$("#userTable").bootstrapTable('refresh');
            				});
            			}else{
            				layer.msg(data.content, {time: 1000, icon:5}, function(cindex){
            					layer.close(cindex);
            				})
            			}
            		}
            	});
      		})
      	}
      	
      	//批量删除
      	function batchDeleteUser(){
			   var rows = $("#userTable").bootstrapTable('getSelections');
			   
			   if(rows.length > 0){
				   layer.confirm("确认删除？", function(){
					   var ids = '';
					   $(rows).each(function(index){
						   if(index == 0){
							   ids += 'ids=' + this.id;
						   }else{
							   ids += '&ids=' + this.id;
						   }
						   
						   
					   });
					   $.ajax({
		            		type: "POST",
		            		url: "${pageContext.request.contextPath }/user/batchDelete",
		            		data: ids,
		            		dataType: "json",
		            		beforSend: function(){
		            			layerLoad = layer.load();
		            		},
		            		success: function(data){
		            			layer.close(layerLoad);
		            			if(data.success){
		            				layer.msg(data.content, {time: 1000, icon: 6}, function(cindex){
		            					layer.close(cindex);
		            					$("#userTable").bootstrapTable('refresh');
		            				});
		            			}else{
		            				layer.msg(data.content, {time: 1000, icon:5}, function(cindex){
		            					layer.close(cindex);
		            				})
		            			}
		            		}
				   		});
				   })
			   }else{
				   layer.msg("至少选择一项删除！", {time:2000, icon:5});
			   }
      		}
    </script>
  </body>
</html>