/**
 * 
 */

var check_addAuthor=function(){
	$.post('addAuthor',
		$("#info").serializeArray()
		,function(data){
		alert(data["result"]);
	});
	return false;
}