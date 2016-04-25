$(document).ready(function(){
	    
		var newimg=$(".imgs").attr("src");
		var img= $.cookie("img");
		var newname=$('#s_name').html();
		var name= $.cookie("name");
		var newcount=$('#s_count').html();
		var count= $.cookie("count");
		
		if(img!=undefined)
		{	
			if(img.indexOf(newimg)>-1)//true
				{
				}else
				{	
					/*存放图片地址cookie*/
					var img=newimg+'|'+img;
					/*存放商家名称cookie*/
					var name=newname+'|'+name;
					/*存放折扣cookie*/
					var count=newcount+'|'+count;
				}
		}
		else 
		{
			var img=newimg;
			var name=newname;
			var count=newcount;
		}
		$.cookie("img",img,{ expires:1, });
		$.cookie("name",name,{ expires:1, });
		$.cookie("count",count,{ expires:1, });
		
		
		
		
		 
});   
                
 
