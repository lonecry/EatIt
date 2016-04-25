$(document).ready(function(){
	//搜索按钮事件
	$("#searchbtn").click(function(){
		var searchcontent=$(".searchinput").val();
		$.cookie("searchcontent",searchcontent,{ expires:1, });
	});
});
//绑定回车事件
function EnterPress(e){ 
	//传入 event
	var e = e || window.event;
	if(e.keyCode == 13){
		var searchcontent=$(".searchinput").val();
		$.cookie("searchcontent",searchcontent,{ expires:1, });
		self.location='search.jsp';
	}
} 