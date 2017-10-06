/**
 * 
 */

function check_addBook(){
	var r=confirm("确认新建书籍字条？");
	if(r){
		$.post('addBook',
			$("#info").serializeArray()
			,function(data){
			if(data["result"]=="作者字条不存在！是否新建作者信息？"){
				var r=confirm(data["result"]);
				if(r){
					location.href="addAuthor.jsp";
				}
			}
			else alert(data["result"]);
		});
	}
	return false;
}S
	        