$(document).ready(function(){
	var coll= $.cookie("collection");
	var detail=coll.split(",");
	var leng=detail.length;
	
	var li_content = document.getElementById("view");   
	li_content.innerHTML = ""; 
	for(var i=leng-2;i>-1;i--){
		var arr=detail[i].split("|");
		li_content.innerHTML=li_content.innerHTML + 
		'<li style=\"background-image: url(\'images/logo/coupon.jpg\');\">'
		+' <span  class="name1">'+arr[0]+'</span><br/>'
		+' <span  class="discount1">'+arr[1]+'</span>'
	+'</li>'
	}
	$.cookie("collection",null);//释放cookie

});   
                
 
