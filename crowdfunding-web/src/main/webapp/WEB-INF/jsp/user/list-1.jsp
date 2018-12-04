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
<form class="form-inline" role="form" style="float:left;">
  <div class="form-group has-feedback">
    <div class="input-group">
      <div class="input-group-addon">查询条件</div>
      <input class="form-control has-success" type="text" id="account" name="account" placeholder="请输入查询条件">
    </div>
  </div>
  <button type="button" class="btn btn-warning" id="queryBtn"><i class="glyphicon glyphicon-search"></i> 查询</button>
</form>
<button id="deleteBtn" type="button" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
<button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='${pageContext.request.contextPath }/user/add'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
<br>
 <hr style="clear:both;">
          <div class="table-responsive">
          	<form id="userForm">
            <table class="table  table-bordered">
              <thead>
                <tr>
				  <th width="30"><input type="checkbox" id="checkAll"></th>
                  <th>账号</th>
                  <th>名称</th>
                  <th>邮箱地址</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody id="userTable">
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="6" align="center">
						<ul class="pagination">
								
						</ul>
					 </td>
				 </tr>

			  </tfoot>
            </table>
            </form>
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
    <script type="text/javascript">
    	var pageNo = 1; //当前页码
		var pageSize = 5; //每页记录数
	
		var layerLoad;
		
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
		   
		   queryUser(pageNo, pageSize, null);
		   
		   //全选和全不选
		   $("#checkAll").click(function(){
			   $(":checkbox[name=ids]").prop("checked", this.checked);
		   });
		   
		   //批量删除
		   $("#deleteBtn").click(function(){
			   var opts = $(":checkbox[name=ids]:checked");
			   console.log(opts);
			   console.log($("#userForm").serialize());
			   
			   if(opts.length > 0){
				   layer.confirm("确认删除？", function(){
					   $.ajax({
		            		type: "POST",
		            		url: "${pageContext.request.contextPath }/user/batchDelete",
		            		data: $("#userForm").serialize(),
		            		dataType: "json",
		            		beforSend: function(){
		            			layerLoad = layer.load();
		            		},
		            		success: function(data){
		            			layer.close(layerLoad);
		            			if(data.success){
		            				layer.msg(data.content, {time: 1000, icon: 6}, function(cindex){
		            					layer.close(cindex);
		            					queryUser(pageNo, pageSize, null);
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
		   })
        });
        
        $("tbody .btn-success").click(function(){
            window.location.href = "assignRole.html";
        });
        $("tbody .btn-primary").click(function(){
            window.location.href = "edit.html";
        });
        
      	//分页查询
		function queryUser (pageNo, pageSize, account){
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath }/user/users",
				data: {
					"pageNo": pageNo,
					"pageSize": pageSize,
					"account": account
				},
				dataType: "json",
				beforeSend: function(){
					layerLoad = layer.load();
				},
				success: function(data){
					layer.close(layerLoad);
					console.log(data);
					
					//清除表格原数据
					$("#userTable").html("");
					$(".pagination").html("");
					
					//用户数据表格部分
					var userData = '';
					
					$(data.list).each(function(){
						userData += '<tr><td><input type="checkbox" name="ids" value="'+this.id+'"></td>'
									+'<td>'+this.account+'</td>'
									+'<td>'+this.userName+'</td>'
									+'<td>'+this.email+'</td>'
									+'<td>'
									+'<button onclick="assignRolePage('+this.id+')" type="button" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button> '
									+'<button onclick="updateUser('+this.id+')" type="button" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button> '
									+'<button onclick="deleteUser('+this.id+', \''+this.userName+'\')" type="button" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button> '
									+'</td></tr>';
					});
					$("#userTable").append(userData);

					//分页部分
					var prePage = '';
					var page = '';
					var nextPage = '';
					
					if(data.isFirstPage){
						prePage = '<li class="disabled"><a href="#">上一页</a></li>';
					}else{
						prePage = '<li><a href="#" onclick="queryUser('+data.prePage+', '+pageSize+')">上一页</a></li>';
					}
					
					if(data.isLastPage){
						nextPage = '<li class="disabled"><a href="#">下一页</a></li>';
					}else{
						nextPage = '<li><a href="#" onclick="queryUser('+data.nextPage+', '+pageSize+')">下一页</a></li>';
					}
					
					for(var i = 1; i <= data.pages; i++){
						if(data.pageNum == i){
							page += '<li class="active"><a href="#" onclick="queryUser('+i+', '+pageSize+')">'+i+'</a></li>';
						}else{
							page += '<li><a href="#" onclick="queryUser('+i+', '+pageSize+')">'+i+'</a></li>';
						}
					}
					$(".pagination").append(prePage).append(page).append(nextPage);
				}
			});
		}
      	
      	//条件查询用户
      	$("#queryBtn").click(function(){
      		queryUser(pageNo, pageSize, $("#account").val());
      	});
      	
      	//修改用户
      	function updateUser(id){
      		window.location.href = "${pageContext.request.contextPath }/user/update?id=" + id;
      	}
      	
      	//去分配角色页面
      	function assignRolePage(id){
      		window.location.href = "${pageContext.request.contextPath }/user/assignRolePage?id=" + id;
      	}
      	
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
            					queryUser(pageNo, pageSize, null);
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
    </script>
  </body>
</html>