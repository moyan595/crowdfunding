<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
    <title>众筹网</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap-validator/css/bootstrapValidator.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/login.css">
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <div><a class="navbar-brand" href="index.html" style="font-size:32px;">众筹网</a></div>
        </div>
      </div>
    </nav>

    <div class="container">

      <form id="loginForm" class="form-signin" role="form">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-user"></i> 用户登录 </h2>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="account" name="account" placeholder="请输入登录账号" autofocus>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="password" class="form-control" id="password" name="password" placeholder="请输入登录密码">
		  </div>
		  <div class="form-group has-success has-feedback">
			<select class="form-control" >
                <option value="member">会员</option>
                <option value="user">管理</option>
            </select>
		  </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 记住我
          </label>
          <label style="float:right">
            <a href="reg.html">我要注册</a>
          </label>
        </div>
        <a class="btn btn-lg btn-success btn-block" onclick="dologin()"> 登录  </a>
      </form>
    </div>
    <script src="${pageContext.request.contextPath }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/bootstrap-validator/js/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath }/bootstrap-validator/js/language/zh_CN.js"></script>
    <script src="${pageContext.request.contextPath }/layer/layer.js"></script>
    <script>
    	$(function(){
    		$('#loginForm').bootstrapValidator({
    			//根据验证结果显示的各种图标
    			feedbackIcons: {
    	            valid: 'glyphicon glyphicon-ok',
    	            invalid: 'glyphicon glyphicon-remove',
    	            validating: 'glyphicon glyphicon-refresh'
    	        },
    	        fields: {
    	        	//表单字段
    	        	account: {
    	        		validators:{
    	        			notEmpty: {
    	                        message: '账号不能为空'
    	                    }
    	        		}
    	        	},
    	        	password: {
    	        		validators:{
    	        			notEmpty: {
    	                        message: '密码不能为空'
    	                    }
    	        		}
    	        	}
    	        }
    		});
    	})
    
	    function dologin() {
    		//提交表单验证
    		$("#loginForm").bootstrapValidator('validate');
    		//获取验证结果，如果成功，执行下面代码
            if ($("#loginForm").data('bootstrapValidator').isValid()) {
                //验证成功后的操作
            	 var layerLoad;
     	        //ajax 提交登录
     	        $.ajax({
     	        	type: "POST",
     	        	url: "${pageContext.request.contextPath }/doLogin",
     	        	data: $("#loginForm").serialize(),
     	        	dataType: "json",
     	        	beforeSend: function(){
     	        		layerLoad = layer.load(1);
     	        	},
     	        	success: function(data){
     	        		layer.close(layerLoad);
     	        		if(data.success){
     	        			layer.msg(data.content, {time:2000, icon:6});
     	        			//进入到后台管理首页
     	        			window.location.href = "${pageContext.request.contextPath }/main";
     	        		}else{
     	        			layer.msg(data.content, {time:2000, icon:5});
     	        		}
     	        	}
     	        });
            }
	    }
    </script>
  </body>
</html>