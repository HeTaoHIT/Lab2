<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.net.*" %>
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
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
	</script>
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
   			padding-left:37%;
    		margin: 40px 0 20px;
    		border-bottom: 1px solid #eee;
		}
		 .jumbotron p {
    		padding-top: 11px;
    		margin-bottom: 15px;
    		font-size: 16px;
    		font-weight: 200;
    		color: white;
		}
        .row{
            margin-right: -15px;
            margin-left: 33%;
            margin-top:40px;
            margin-bottom:0;
        }
        #timeCounter{
        	margin-right:40%;
        	magin-left:40%;
        	margin-top:20px;
        	background-color:black;
        	
        }
         .navbar-default .navbar-nav>li>a {
    		color: white;
    		font-size:17px;
    		
		}
		.navbar-default .navbar-collapse, .navbar-default .navbar-form {
    		border-color: #e7e7e7;
    		margin-left: 43%;
		}
		
		.form-horizontal .control-label {
    		padding-top: 7px;
    		margin-bottom: 0;
    		text-align: right;
    		margin-left: 14%;
		}
		.col-sm-offset-2 {
    		margin-left: 16.66666667%;
    		padding-left: 20%;
		}
		#submit{
			width:80px;
			font-size:15px;
			-webkit-transition-duration: 0.4s; /* Safari */
    		transition-duration: 0.4s;
		}
		#submit:hover{
			box-shadow: 0 3px 5px 0 rgba(0,0,0,0.24),0 4px 10px 0 rgba(0,0,0,0.19);
		}
		#back {
  			display: inline-block;
  			margin-left:80px;
        	font-size:15px;
        	padding-left:20px;
        	padding-right:20px;
        	text-align: center;
        	width: 80px;
        	transition: all 0.5s;
  			cursor: pointer;
		}

		#back span {
  			cursor: pointer;
  			display: inline-block;
  			position: relative;
  			transition: 0.5s;
		}

		#back span:after {
  			content: '<<';
  			position: absolute;
  			opacity: 0;
  			top: 0;
  			left: -20px;
  			transition: 0.5s;
		}
		
		#back:hover span {
  			padding-left: 25px;
		}

		#back:hover span:after {
  			opacity: 1;
  			left: 0;
		}
		#search {
  			display: inline-block;
  			border-radius: 4px;
  			color: black;
  			text-align: center;
  			
  			padding-left: 10px;
  			padding-right:10px;
  			width:80px;
  			transition: all 0.5s;
  			cursor: pointer;
		}

		#search span {
  			cursor: pointer;
  			display: inline-block;
  			position: relative;
  			transition: 0.5s;
		}

		#search span:after {
  			content: '»';
  			position: absolute;
  			opacity: 0;
  			top: 0;
  			right: -20px;
  			transition: 0.5s;
		}
	
		#search:hover span {
  			padding-right: 25px;
		}

		#search:hover span:after {
  			opacity: 1;
  			right: 0;
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

			<script type="text/javascript">
    			function searchByBook(title){
    				if(title.value=="")	alert("输入不能为空！");
    				else{
                		$.post('BookIsExit',
                				$("#guide").serializeArray() 
                    			,function(data){
                    			if(data["result"]=="书籍不存在!"){
                    				var r=confirm("书籍不存在!是否新建书籍字条？");
                    				if(r){
                    					location.href="addBook.jsp";
                    				}
                    			}
                    			else {
                    				guide.action="queryByBook.action";
                                	guide.submit();
                    			}
                    		})
                    }
    			}
    		</script>

    		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      		<form name="guide" id="guide" class="navbar-form navbar-left">
        		<div class="form-group">
          		<input name="title" type="text" class="form-control" placeholder="Search by bookname">
        		</div>
        		<button class="btn btn-default" id="search" type="button" style="vertical-align:middle"
                 onclick="searchByBook(guide.title)"><span>search</span></button>
      		</form>
      		<ul class="nav navbar-nav navbar-right">
        		<li><a href="index.jsp">主页</a></li>
        		<li class="dropdown">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" 
          		aria-expanded="true">功能 <span class="caret"></span></a>
          		<ul class="dropdown-menu">
            		<li><a href="addBook.jsp">添加书籍</a></li>
            		<li class="disabled"><a href="addAuthor.jsp">添加作者</a></li>
            		<!-- <li><a href="#">Something else here</a></li>-->
          		</ul>
        		</li>
      		</ul>
    		</div><!-- /.navbar-collapse -->
  		</div><!-- /.container-fluid -->
	</nav>
    
       <div class="page-header">
            <h2>新建作者字条 <small></small></h2>
        </div>
        
        <s:form name="myform" id="info" class="form-horizontal" onSubmit="check_addAuthor()">
        <div class="form-group">
        	<label for="authorID" class="col-sm-2 control-label">AuthorID</label>
        	<div class="col-sm-4">
      			<input type="text" class="form-control" id="authorID" name="authorID" placeholder="example:00001" 
      			pattern="[0-9]{5}" title="xxxxx" required="true"/>
    		</div>
    	</div>
        <div class="form-group">
        	<label for="author" class="col-sm-2 control-label">Author</label>
        	<div class="col-sm-4">
      			<input type="text" class="form-control" id="author" name="author" placeholder="author" required="true"/>
    		</div>
    	</div>
    	<div class="form-group">
    		<label for="publisher" class="col-sm-2 control-label">Age</label>
    		<div class="col-sm-4">
      			<input type="text" class="form-control" id="age" name="age" placeholder="age" pattern="[1-9]|([1-9][0-9])|(1[0-9][0-9])" required="true"/>
    		</div>
    	</div>
    	<div class="form-group">
    		<label for="publishDate" class="col-sm-2 control-label">Country</label>
    		<div class="col-sm-4">
      			<input type="text" class="form-control" id="Country" name="Country" placeholder="Country" required="true"/>
    		</div>
    	</div>
    	<script type="text/javascript">
        	var check_addAuthor=function(){
        		$.post('addAuthor',
        			$("#info").serializeArray()
        			,function(data){
        			alert(data["result"]);
        			if(data["result"]=="建立作者成功"){
        				var secs = 3; //倒计时的秒数 
        				for(var i=secs;i>=0;i--) { 
        					window.setTimeout("doUpdate(" + i + ")", (secs-i) * 1000); 
        				} 
        				function doUpdate(num) { 
        					document.getElementById("#timeCounter").innerHTML = num ; 
        					if (num == 0){window.location="location.href='javascript:history.go(-1);'"}
        				}
        				
        			}
        		})
        		return false;
        	}
        
    	</script>
    	<div class="col-sm-offset-2 col-sm-10">
      			<!-- check_modify(myform.author,myform.publisher,myform.publishDate,myform.price)">更新</button>-->
      			<input type="submit" name="Submit" id="submit" value="新建" class="btn btn-default" />
      			<button id="back" name="back" style="vertical-align:middle" class="btn btn-default" onclick="javascript:history.back(-1)"><span>返回</span></button>
		</div>
    </s:form>
    </div>
    <div id="timeCounter"></div>
    </body>
</html>