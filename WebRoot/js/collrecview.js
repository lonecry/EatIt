$(document).ready(function(){
	var coll= $.cookie("collrecview");
	
	var detail=coll.split("|");
	var leng=detail.length;
	
	var li_content = document.getElementById("view");   
	li_content.innerHTML = li_content.innerHTML +
	'<li >'
		+' <span  class=" salerviewname headbg">姓名</span>'
		+' <span  class=" salerviewemail headbg">邮箱</span>'
		+' <span  class=" salerviewtime headbg">领取时间</span>'
	+'</li>'; 
	for(var i=0;i<leng-1;i++){
		var all=detail[i].split(",");
		li_content.innerHTML=li_content.innerHTML + 
		'<li >'
			+' <span  class=" salerviewname">'+all[0]+'</span>'
			+' <span  class=" salerviewemail">'+all[1]+'</span>'
			+' <span  class=" salerviewtime">'+all[2]+'</span>'
		+'</li>';
		 
	}
});   
                
 
