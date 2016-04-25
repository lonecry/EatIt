$(document).ready(function(){
	 
	/* 中文字符转换 */
	function utf16to8(str) {
	    var out, i, len, c;
	    out = "";
	    len = str.length;
	    for (i = 0; i < len; i++) {
	        c = str.charCodeAt(i);
	        if ((c >= 0x0001) && (c <= 0x007F)) {
	            out += str.charAt(i);
	        } else if (c > 0x07FF) {
	            out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
	            out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));
	            out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
	        } else {
	            out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));
	            out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
	        }
	    }
	    return out;
	}
	/* 生成我二维码 */
		var name    =$('#s_name').html();
		var count   =$('#s_count').html();
		var address =$('#s_address').html();
		var tell    =$('#s_tell').html();
		var all     =name+' '+count+' '+address+' '+tell
		jQuery('.code').qrcode({
		        text:utf16to8(all),//二维码包含的内容，默认只支持英文内容,中文会乱码，通过utf16to8转码可支持中文
		        render: "canvas",//渲染方式可选择canvas或table，默认是canvas，canvas方式还支持右键图片下载
		        width: 256,//宽度，默认是256
		        height: 256,//高度，默认是256，建议宽度和高度保持一致，否则不容易被识别
		        typeNumber: -1,//计算模式，默认是-1
		        //correctLevel: QRErrorCorrectLevel.H,//纠错等级，默认是QRErrorCorrectLevel.H，但是加上correctLevel这一行后无法渲染出二维码
		        background: "#ffffff",//背景颜色，默认是白色
		        foreground: "#000000"//前景颜色，默认是黑色
		    });
	
});