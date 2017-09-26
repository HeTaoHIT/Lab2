<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
<head>
    <!--<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">-->
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <meta charset="utf-8">
    <style type="text/css">
       body{
            margin-top:0;
            margin-left:0;
            margin-rightz:0;
            padding:0;
            background:cover;
            margin:bottom:90px;
            background-color:grey;
        }
        .container-fluid {
    		padding-right: 15px;
    		padding-left: 15px;
    		margin-right: auto;
    		margin-left: auto;
    		background-color: dimgray;
		}
       .jumbotron{
           padding-top: 0px;
           padding-bottom:100px;
           margin-top:0;
           margin-bottom: 0px;
           margin-right:0px;
           margin-left:0px;
           color: inherit;
           background-color: #eee;
           background-position:top left;
       }
       .page-header {
    		padding-bottom: 9px;
   			padding-top: 8px;
    		margin: 40px 0 20px;
    		border-bottom: 1px solid #eee;
		}
        .row{
            margin-right: -15px;
            margin-left: 33%;
            margin-top:40px;
            margin-bottom:0;
        }
        .jumbotron p {
    		padding-top: 11px;
    		margin-bottom: 15px;
    		font-size: 16px;
    		font-weight: 200;
    		color: white;
		}
		.navbar-collapse, .navbar-default .navbar-form {
    		margin-left: 720px;
    		border-color: #e7e7e7;
		}
    </style>
</head>
    <body>
    <div class="jumbotron">
    
    	<nav class="navbar navbar-default">
  		<div class="container-fluid">
    		<!-- Brand and toggle get grouped for better mobile display -->
    		<div class="navbar-header">
      			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        		<span class="sr-only">Toggle navigation</span>
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>
      		</button>
      		<p>Books Management System</p>
    		</div>

   			 <!-- Collect the nav links, forms, and other content for toggling -->
    		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<form class="navbar-form navbar-left">
        			<div class="form-group">
          			<input type="text" class="form-control" placeholder="Search">
        			</div>
        			<button type="submit" class="btn btn-default">Submit</button>
      			</form>
    			</div><!-- /.navbar-collapse -->
  			</div><!-- /.container-fluid -->
		</nav>
    
       <div class="page-header">
            <h1 align="center">图书管理系统 <small></small></h1>
        </div>
        <script type="text/javascript">
            function openWindow(author){
            	if(author.value=="")	alert("输入不能为空！");
            	else{myform.action="book.action";
                	myform.submit();}
            }
        </script>
        
        <form role="form" name="myform">
        <div class="row">
            <div class="col-lg-6">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for author..." name="author">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button" onclick="openWindow(myform.author)">Go!</button>
                    </span>
                </div><!-- /input-group -->
            </div><!-- /.col-lg-6 -->
        </div><!-- /.row -->
        </form>
        
    </div>

    </body>
</html>