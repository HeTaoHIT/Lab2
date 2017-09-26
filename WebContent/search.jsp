<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.LinkedList" %>
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
        .row{
            margin-right: -15px;
            margin-left: 31%;
        }
        #list{
        	align:center;
        	margin-left:10%;
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

		div.container {
  			text-align: center;
  			padding: 10px 20px;
		}
		#img1{
			border-radius:4px;
		}
       a:hover{color:purple;}
       a:visited{color:purple;}
    </style>
</head>
	<%
		String rs=request.getAttribute("result").toString();
		String[] works=rs.split("!");
		LinkedList<String> lst=new LinkedList<String>();
		for(String work:works)
			if(!"".equals(work)){
				String[] items=work.split("~");
				lst.add(items[2]);
			}
	%>
    <body>
    
    <div class="jumbotron">
       	<div class="page-header">
            <h1 align="center"> <small></small></h1>
        </div>
        
        <div id="list">
        <table class="table table-hover">
        	<caption><h2>查找结果：</h2></caption>
        	<%
        		for(String work:works){
        			String[] items=work.split("~");
        		String author=items[6];
        		String ISBN=items[0];
        		String title=items[1];
        		String AuthorID=items[2];
        		String Publisher=items[3];
        	%>
        	
        			<div class="single-member effect-3">
                        <div class="member-image">
                            <img src="黄金时代.jpg" alt="Member">
                        </div>
                        <div class="member-info">
                            <h3><%=title %></h3>
                            <h5><%=author %></h5>
                            <p>ISBN:<%=ISBN %></p>
                            <p>Publisher:<%=Publisher %></p>
                            <div class="social-touch">
                                <a class="fb-touch" href="detailOfBook.action?ISBN=<%=items[0] %>&AuthorID=<%=items[2] %>">Detail...</a>
                                <a class="tweet-touch" href="#"></a>
                                <a class="linkedin-touch" href="#"></a>
                            </div>
                        </div>
                    </div>
			
        		<tr>
        			<td>
        			<input type="button" name="Submit2" value="删除" class="btn btn-default" onClick="loadXMLDoc()" >&nbsp;&nbsp;&nbsp;&nbsp;
        			<a class="btn btn-default" href="modify.jsp?ISBN=<%=items[0] %>&title=<%=title %>" role="button">更新</a>
        			</td>
        			<td id="td3"><a href="detailOfBook.action?ISBN=<%=items[0] %>&AuthorID=<%=items[2] %>"><%=items[1] %></a></td>
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