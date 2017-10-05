<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	LinkedList<String> book=(LinkedList<String>)request.getAttribute("result");
	LinkedList<String> Info=(LinkedList<String>)request.getAttribute("authorInfo");
	String check=request.getAttribute("check").toString();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://cdn.bootcss.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<title>书籍信息</title>
<style type="text/css">
       body{
            margin-top:0;
            padding:0;
            background:cover;
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
           padding-bottom: 30px;
           margin-top:0;
           margin-bottom: 30px;
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
        .jumbotron p {
    		padding-top: 11px;
    		margin-bottom: 15px;
    		font-size: 16px;
    		font-weight: 200;
    		color: white;
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
        #dropdownMenu1{
            box-shadow:0 0 4px 6px rgba(0,0,0,0.19),0 0 6px 20px rgba(0,0,0,0.2);
        }
        .row{
            margin-right: -15px;
            margin-left: 31%;
        }
        caption{
        	text-align:center;
        }
        #back {
  			display: inline-block;
  			margin-left:45%;
        	font-size:17px;
        	padding-left:20px;
        	padding-right:20px;
        	text-align: center;
        	width: 110px;
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
	 <%
       		String ISBN=book.get(0);
       		String title=book.get(1);
        	String authorID=book.get(2);
     		String publisher=book.get(3);
       		String publishDate=book.get(4);
       		String price=book.get(5);
       		String utftitle=URLEncoder.encode(title,"utf-8");
     %>
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
                		$.post('BookIsExist',
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
            <h1 align="center">图书信息 </h1>
        </div>
        <table class="table table-striped table-hover">
        	<caption>Details for 《 <%=title%> 》</caption>
        	<tr>
        		<th>ISBN</th><th>title</th><th>AuthorID</th><th>Publisher</th><th>PublishDate</th><th>price/¥</th>
        		<th style="padding-left:40px">操作</th>
        	</tr>
        	<tr>
        			<td style="padding:10px"><%=ISBN%></td>
        			<td style="padding:10px"><%=title%></td>
        			<td style="padding:10px"><%=authorID%></td>
        			<td style="padding:10px"><%=publisher%></td>
        			<td style="padding:10px"><%=publishDate%></td>
        			<td style="padding:10px"><%=price%></td>
        			<td>
        				<a class="btn btn-default" href="modify.jsp?ISBN=<%=ISBN %>&title=<%=utftitle %>&AuthorID=<%=authorID %>&check=<%=check %>" role="button">更新</a>
        			</td>
        	</tr>
        </table>
        <table class="table table-striped table-hover">
        	<caption>Author Information</caption>
        	<tr>
        		<th>作者ID</th><th>作者姓名</th><th>年龄</th><th>国籍</th>
        	</tr>
        		<%
        			String AuthorID=Info.get(0);
        			String Name=Info.get(1);
        			String Age=Info.get(2);
        			String Country=Info.get(3);
        		%>
        	<tr>
        		<td style="padding:5px"><%=AuthorID%></td>
        		<td style="padding:5px"><%=Name%></td>
        		<td style="padding:5px"><%=Age%></td>
        		<td style="padding:5px"><%=Country%></td>
        	</tr>
        </table>
        <div>
        	<button id="back" name="back" style="vertical-align:middle" class="btn btn-default" onClick="returnBack()"><span>返回</span></button>
        </div>
    </div>
	<script type="text/javascript">
		function returnBack(){
			if('<%=check %>'=="true"){
				location.href='queryByAuthor.action?author=<%=Name %>';
			}
			else if('<%=check %>'=="false"){
				location.href='queryByBook.action?title=<%=title%>';
			}
		}
	</script>
    </body>
</html>