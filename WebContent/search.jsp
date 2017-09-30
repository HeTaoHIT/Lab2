<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/style.css">
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
       .jumbotron{
           padding-top: 0px;
           padding-bottom: 50px;
           margin-top:0;
           margin-bottom: 30px;
           color: inherit;
           background-color: #eee;
           background-position:top left;
       }
       .container-fluid {
    		padding-right: 10px;
    		padding-left: 0px;
    		margin-right: auto;
    		margin-left: auto;
    		background-color: dimgray;
		}
        .row{
            margin-right: -15px;
            margin-left: 31%;
        }
        #list{
        	align:center;
        	margin-left:10%;
        }
        
        #td2{
        	padding-top:15px;
        }
        #td3{
        	padding-top:15px;
        }
		div.polaroid {
  			width: 30%;
  			border-radius: 4px;
  			background-color: white;
  			box-shadow: 0 8px 8px 0 rgba(0, 0, 0, 0.4), 0 6px 20px 0 rgba(0, 0, 0, 0.4);
  			margin-bottom: 25px;
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
		div.container {
  			text-align: center;
  			padding: 10px 20px;
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
		a:link{color:blue;}
       	a:visited{color:blue;}
       	a:hover{color:purple;}
    </style>
</head>
	<%
		ArrayList<String[]> rs=(ArrayList<String[]>)request.getAttribute("result");
		String author=rs.get(0)[6];
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
          		<input type="text" name="title" class="form-control" placeholder="Search by bookname">
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
            <h1 align="center"> <small></small></h1>
        </div>
        
        <div id="list">
        <table class="table table-hover">
        	<caption><h2>查询结果：</h2></caption>
        	<tr>
        		<th>操作</th>
        		<th>title</th>
        		<th>AuthorID</th>
        	</tr>
        	<%
        		for(String[] items:rs){
        			String ISBN=items[0];
        			String title=items[1];
        			String authorID=items[2];
        			String Publisher=items[3];
        	%>
			<script type="text/javascript">
				function deleteBook()
				{
					var r=confirm("确定从数据库中删除该图书!");
					if (r==true){
						$.post('deleteBook',
    	    				{ISBN:"<%=ISBN%>"}
        						,function(data){
        						alert(data["result"]);
        						if(data["result"]=="删除成功！"){
        							location.href="book.action?author='<%=author %>'"
        						}
        				});
					}
				}
			</script>
			
        		<tr>
        			<td>
        			<input type="button" name="Submit2" value="删除" class="btn btn-default" onClick="deleteBook()" />
        			</td>
        			<td id="td2"><a href="detailOfBook.action?ISBN=<%=items[0] %>&AuthorID=<%=items[2] %>"><%=items[1] %></a></td>
        			<td id="td3"><%=authorID %></td>
        		</tr>
        	<%
        		}
        	%>
        </table>        
        </div>
       <!-- <div style=" width:50px; height:50px; background-color:#F00; border-radius:30px;">
         	<a><h1><font color="white">+</font></h3></a>
    	</div>-->
    </div>
    </body>
</html>