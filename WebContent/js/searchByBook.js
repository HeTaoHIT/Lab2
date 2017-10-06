/**
 * 
 */

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