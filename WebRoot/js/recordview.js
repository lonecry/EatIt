

/*从cookie取出字符串*/
var img1= $.cookie("img");
var name1= $.cookie("name");
var count1= $.cookie("count");

/*转化成数组，然后数组去重复项,然后根据索引值删掉相应的其他两个数组的对应的值，顺序不能颠倒*/
var img2=img1.split("|");
var name2=name1.split("|");
var count2=count1.split("|");


/*去掉重复数组，就是复制一个一样的数组，然后遍历比对*/

/*获取数组的长度 DOM修改HTML*/
var length=img2.length;
if(length!=0){
	var li_content = document.getElementById("record");   
	li_content.innerHTML = ""; 
 
	for( var i=0;i<length;i++){
		 li_content.innerHTML=li_content.innerHTML + 
		'<li>'
			+'<a'+' '+'target="_blank"'+' '+'href="'+'brief.do?name='+name2[i]+'"'+'>'
			+'<img'+' '+'src="'+img2[i]+'"/></a>'
			+'<div'+' '+'class="salertext">'
			+'<p>'
				+'<a'+' '+'target="_blank"'+' '+'href="brief.do?name='+name2[i]+'">'+name2[i]+'</a>'
			+'</p>'
			+'<p>'
				+'折扣:<a'+' '+'href="brief.do?name='+name2[i]+'">'+count2[i]+'</a>'
			+'</p>'
			+'</div>'
		+'</li>';   
	}
}
		 
		 
 
