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
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/modifyStyle.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/addAuthor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/searchByBook.js"></script>
    <meta charset="utf-8">
</head>
    <body>
	    <div class="jumbotron">
	    	
	    	<nav class="navbar navbar-default">
		  		<div class="container-fluid">
		    		<div class="navbar-header">
			      		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        		<span class="sr-only">Toggle navigation</span>
			        		<span class="icon-bar"></span>
			        		<span class="icon-bar"></span>
			        		<span class="icon-bar"></span>
			      		</button>
			      		<p>Books Management System</p>
		    		</div>

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
				          		</ul>
			        		</li>
			      		</ul>
		    		</div>
		  		</div>
			</nav>
	    
	       	<div class="page-header">
	            <h2>新建作者字条 <small></small></h2>
	        </div>
	        
	        <s:form name="myform" id="info" class="form-horizontal" onSubmit="return check_addAuthor()">
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
		    	<div class="col-sm-offset-2 col-sm-10">
		      			<!-- check_modify(myform.author,myform.publisher,myform.publishDate,myform.price)">更新</button>-->
		      			<input type="submit" name="Submit" id="submit" value="新建" class="btn btn-default" />
		      			<button id="back" name="back" style="vertical-align:middle" class="btn btn-default" onclick="javascript:history.back(-1)"><span>返回</span></button>
				</div>
	    	</s:form>
	    	
	    </div>
    </body>
</html>