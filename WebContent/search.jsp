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
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/searchStyle.css">
	<!-- <script type="text/javascript" src="${pageContext.request.contextPath }/js/search.js"></script>-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/searchByBook.js"></script>
<title>书籍信息</title>
</head>
	<%
		ArrayList<String[]> rs=(ArrayList<String[]>)request.getAttribute("result");
		String check=rs.get(rs.size()-1)[0];
	%>
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
				          		</ul>
			        		</li>
			      		</ul>
		    		</div>
		  		</div>
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
		        		for(int i=0;i<rs.size()-1;i++){
		        			String[] items=rs.get(i);
		        			String ISBN=items[0];
		        			String title=items[1];
		        			String authorID=items[2];
		        			String Publisher=items[3];
		        			String author=items[6];
		        	%>
	        		<tr>
	        			<td>
	        				<input type="button" name="detail" value="删除" class="btn btn-default" onClick="deleteBook('<%=ISBN %>','<%=title %>','<%=author %>')" />
	        			</td>
	        			<td id="td2"><a href="detailOfBook.action?ISBN=<%=items[0] %>&AuthorID=<%=items[2] %>&check=<%=check %>"><%=items[1] %></a></td>
	        			<td id="td3"><%=authorID %></td>
	        		</tr>
		        	<%
		        		}
		        	%>
		        </table>        
	        </div>
	        
	        <script type="text/javascript">
	    		function deleteBook(ISBN,title,author){
					var r=confirm("确定从数据库中删除该图书!");
					if (r==true){
						$.post('deleteBook',
							{ISBN:String(ISBN)}
								,function(data){
								alert(data["result"]);
								if(data["result"]=="删除成功！"){
									if('<%=check %>'=="true"){
										location.href="queryByAuthor.action?author="+author;
									}
									else if('<%=check %>'=="false"){
										location.href="queryByBook?title="+title;
									}
								}
						});
					}
				}
    		</script>
	        
	    </div>
    </body>
</html>