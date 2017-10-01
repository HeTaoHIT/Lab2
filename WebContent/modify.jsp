<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
 <%
 	String title = request.getParameter("title").trim();
   	String ISBN=request.getParameter("ISBN");
   	String AuthorID=request.getParameter("AuthorID");
   	String check=request.getParameter("check");
 %>
<head>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <meta charset="utf-8">
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
	</script>
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
    		padding-left: 40%;
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
        .navbar-default .navbar-nav>li>a {
    		color: white;
    		font-size:17px;
    		
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
		 	margin-left:80px;
  			width:80px;
			font-size:15px;
			-webkit-transition-duration: 0.4s; /* Safari */
    		transition-duration: 0.4s;
		}
		#back:hover{
			box-shadow: 0 3px 5px 0 rgba(0,0,0,0.24),0 4px 10px 0 rgba(0,0,0,0.19);
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
                    				guide.action="queryByBook.action?title="+title.value;
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
            		<li><a href="addAuthor.jsp">添加作者</a></li>
            		<!-- <li><a href="#">Something else here</a></li>-->
          		</ul>
        		</li>
      		</ul>
    		</div><!-- /.navbar-collapse -->
  		</div><!-- /.container-fluid -->
	</nav>
    
       <div class="page-header">
            <h2>更新图书信息 <small></small></h2>
       </div>
       
       <script type="text/javascript">
       		function check_modify(){
        		if(myform.AuthorID.value==""
        				&&myform.publisher.value==""
        				&&myform.publishDate.value==""
        				&&myform.price.value=="")	alert("未输入任何信息！")
        		else{
        			$.post('modify',
        				$("#info").serializeArray()
        				,function(data,status){
        				if(data["result"]=="作者字条不存在！是否新建作者信息？"){
        					var r=confirm(data["result"]);
        					if(r){
        						location.href="addAuthor.jsp";
        					}
        				}
        				else alert(data["result"]);
        			});
        		}
        		return false;
        	}
        
    	</script>
        
        <form name="myform" id="info" class="form-horizontal" onSubmit="return check_modify();">
        <div class="form-group">
        	<label for="ISBN" class="col-sm-2 control-label">ISBN</label>
        	<div class="col-sm-4">
        		<input class="form-control" type="text" id="ISBN" name="ISBN" readonly="true" value="<%=ISBN %>"/>
        	</div>
    	</div>
    	<div class="form-group">
        	<label for="title" class="col-sm-2 control-label">title</label>
        	<div class="col-sm-4">
        		<input class="form-control" type="text" id="title" name="title" readonly="true" value="<%=title %>"/>
        	</div>
    	</div>
        <div class="form-group">
        	<label for="author" class="col-sm-2 control-label">AuthorID</label>
        	<div class="col-sm-4">
      			<input type="text" class="form-control" id="AuthorID" name="AuthorID" placeholder="authorID" pattern="[0-9]{5}"/>
    		</div>
    	</div>
    	<div class="form-group">
    		<label for="publisher" class="col-sm-2 control-label">Publisher</label>
    		<div class="col-sm-4">
      			<input type="text" class="form-control" id="publisher" name="publisher" placeholder="publisher"/>
    		</div>
    	</div>
    	<div class="form-group">
    		<label for="publishDate" class="col-sm-2 control-label">PublishDate</label>
    		<div class="col-sm-4">
      			<input type="text" class="form-control" id="publishDate" name="publishDate" placeholder="example: 2017-01-01" 
      			pattern="[0-9]{4}-(1[0-2]|0[1-9])-(0[1-9]|[12][0-9]|3[01])" title="yyyy-mm-dd"/>
    		</div>
    	</div>
    	<div class="form-group">
    		<label for="price" class="col-sm-2 control-label">price/¥</label>
    		<div class="col-sm-4">
      			<input type="text" class="form-control" id="price" name="price" placeholder="price" 
      			pattern="[0-9]+(\.[0-9]*)?"/>
    		</div>
    	</div>
    	
    		<div class="col-sm-offset-2 col-sm-6">
      			<!-- check_modify(myform.author,myform.publisher,myform.publishDate,myform.price)">更新</button>-->
      			<input type="submit" name="Submit" id="submit" value="更新" class="btn btn-default"/>
      			<!-- <button id="back" name="back" class="btn btn-default" onClick="javascript:history.back(-1);"><span>返回</span></button>-->
      			<input name="back" type="button" id="back" class="btn btn-default" onclick="location.href='detailOfBook.action?ISBN=<%=ISBN %>&check=<%=check %>'" value="返 回" /><!-- javascript:history.back(-1); -->
		    </div>
        </form>
        
    </div>

	
    </body>
</html>