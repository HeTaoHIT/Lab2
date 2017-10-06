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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/detailOfBookStyle.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/searchByBook.js"></script>
<title>书籍信息</title>

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
				            		<li><a href="addAuthor.jsp">添加作者</a></li>
				          		</ul>
			        		</li>
			      		</ul>
		    		</div>
		  		</div>
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
	    </div>
    </body>
</html>