<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh">
 <%
 	String title = request.getParameter("title").trim();
   	String ISBN=request.getParameter("ISBN");
 %>
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
       .jumbotron{
           padding-top: 80px;
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
    		padding-left: 15%;
    		margin: 40px 0 20px;
    		border-bottom: 1px solid #eee;
		}
        .row{
            margin-right: -15px;
            margin-left: 33%;
            margin-top:40px;
            margin-bottom:0;
        }
    </style>
</head>
    <body>
    <div class="jumbotron">
       <div class="page-header">
            <h2>更新图书信息 <small></small></h2>
       </div>
        
        <s:form name="myform" id="info" class="form-horizontal">
        <div class="form-group">
        	<label for="ISBN" class="col-sm-2 control-label">ISBN</label>
        	<div class="col-sm-5">
        		<input class="form-control" type="text" id="ISBN" name="ISBN" value="<%=ISBN %>">
        	</div>
    	</div>
    	<div class="form-group">
        	<label for="title" class="col-sm-2 control-label">title</label>
        	<div class="col-sm-5">
        		<input class="form-control" type="text" id="title" name="title" value="<%=title %>">
        	</div>
    	</div>
        <div class="form-group">
        	<label for="author" class="col-sm-2 control-label">Author</label>
        	<div class="col-sm-5">
      			<input type="text" class="form-control" id="author" name="author" placeholder="author">
    		</div>
    	</div>
    	<div class="form-group">
    		<label for="publisher" class="col-sm-2 control-label">Publisher</label>
    		<div class="col-sm-5">
      			<input type="text" class="form-control" id="publisher" name="publisher" placeholder="publisher">
    		</div>
    	</div>
    	<div class="form-group">
    		<label for="publishDate" class="col-sm-2 control-label">PublishDate</label>
    		<div class="col-sm-5">
      			<input type="text" class="form-control" id="publishDate" name="publishDate" placeholder="example: 2017-01-01">
    		</div>
    	</div>
    	<div class="form-group">
    		<label for="price" class="col-sm-2 control-label">price/¥</label>
    		<div class="col-sm-5">
      			<input type="text" class="form-control" id="price" name="price" placeholder="price">
    		</div>
    	</div>
    	
        <script type="text/javascript">
        	var check_modify=function(){
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
        		})
        	}
        
    	</script>
    		<div class="col-sm-offset-2 col-sm-10">
      			<!-- check_modify(myform.author,myform.publisher,myform.publishDate,myform.price)">更新</button>-->
      			<input type="button" name="Submit2" value="更新" class="btn btn-default" onClick="check_modify()" >
		    </div>
        </s:form>
    </div>

    </body>
</html>