<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String books=request.getAttribute("result").toString();
	String Info=request.getAttribute("authorInfo").toString();
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
<title>书籍信息</title>
<style type="text/css">
       body{
            margin-top:0;
            padding:0;
            background:cover;
            background-color:grey;
        }
       .jumbotron{
           padding-top: 10px;
           padding-bottom: 30px;
           margin-top:0;
           margin-bottom: 30px;
           color: inherit;
           background-color: #eee;
           background-position:top left;
       }
       /* .page-header{
               padding-bottom: 9px;
               margin: 40px 0 20px;
               border-bottom: 1px solid #eee;
        }*/
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
    </style>
</head>
	<%
		String[] items=books.split("~"); String bookTitle=items[1];
		LinkedList<String> list=new LinkedList<String>();
		for(String item:items)
			if(!"".equals(item))
				list.add(item);
	%>
    <body>
    <div class="jumbotron">
       <div class="page-header">
            <h1 align="center">图书信息 <small></small></h1>
        </div>
        <script type="text/javascript">
				function loadXMLDoc()
				{
					var r=confirm("确定从数据库中删除该图书!");
					if (r==true){
					var xmlhttp;
					if (window.XMLHttpRequest)
					{
						//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
						xmlhttp=new XMLHttpRequest();
					}
					else
					{
						// IE6, IE5 浏览器执行代码
						xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
					}
					xmlhttp.onreadystatechange=function()
					{
						if (xmlhttp.readyState==4 && xmlhttp.status==200)
						{
							document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
						}
					}
					xmlhttp.open("GET","deleteBook.action?ISBN=<%=items[0] %>",true);
					xmlhttp.send();
					}
				}
    		</script>
    		
        <table class="table table-striped table-hover">
        	<caption>Details for 《 <%=bookTitle%> 》</caption>
        	<tr>
        		<th>ISBN</th><th>title</th><th>AuthorID</th><th>Publisher</th><th>PublishDate</th><th>price/¥</th>
        		<th style="padding-left:40px">操作</th>
        	</tr>
        	<tr>
        		<%
        			String ISBN=list.get(0);
        			String title=list.get(1);
        			String authorID=list.get(2);
        			String publisher=list.get(3);
        			String publishDate=list.get(4);
        			String price=list.get(5);
        			String utftitle=URLEncoder.encode(title,"utf-8");
        		%>
        			<td style="padding:10px"><%=ISBN%></td>
        			<td style="padding:10px"><%=title%></td>
        			<td style="padding:10px"><%=authorID%></td>
        			<td style="padding:10px"><%=publisher%></td>
        			<td style="padding:10px"><%=publishDate%></td>
        			<td style="padding:10px"><%=price%></td>
        			<td>
        				<input type="button" name="Submit2" value="删除" class="btn btn-default" onClick="loadXMLDoc()" >
        				<a class="btn btn-default" href="modify.jsp?ISBN=<%=ISBN %>&title=<%=utftitle %>" role="button">更新</a>
        			</td>
        	</tr>
        </table>
        <table class="table table-striped table-hover">
        	<caption>Author Information</caption>
        	<tr>
        		<th>作者ID</th><th>作者姓名</th><th>年龄</th><th>国籍</th>
        	</tr>
        		<%
        			String[] authorInfo=Info.split("~");
        			String AuthorID=authorInfo[0];
        			String Name=authorInfo[1];
        			String Age=authorInfo[2];
        			String Country=authorInfo[3];
        		%>
        	<tr>
        		<td style="padding:5px"><%=AuthorID%></td>
        		<td style="padding:5px"><%=Name%></td>
        		<td style="padding:5px"><%=Age%></td>
        		<td style="padding:5px"><%=Country%></td>
        	</tr>
        </table>
    </div>

    </body>
</html>