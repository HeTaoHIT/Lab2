/**
 * 
 */

function openWindow(author){
	if(author.value=="")	alert("输入不能为空！");
	else{
		$.post('AuthorIsExist',
				$("#myform").serializeArray() 
    			,function(data){
    			if(data["result"]=="作者不存在!"){
    				var r=confirm("作者不存在!是否新建作者字条？");
    				if(r){
    					location.href="addAuthor.jsp";
    				}
    			}
    			else if(data["result"]=="作者字条未添加作品！"){
    				var r=confirm("作者字条尚未添加作品！是否添加书籍？");
    				if(r){
    					location.href="addBook.jsp";
    				}
    			}
    			else {
    				myform.action="queryByAuthor.action";
                	myform.submit();
    			}
    		})
    }
}