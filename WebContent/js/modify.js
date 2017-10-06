/**
 * 
 */

function check_modify(){
	if(myform.AuthorID.value==""
			&&myform.publisher.value==""
			&&myform.publishDate.value==""
			&&myform.price.value=="")	alert("未输入任何信息！")
	else{
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
		});
	}
	return false;
}