
 
$(function(){
  $('#name').blur(check_name);
  $('#at').blur(check_email);
  $('#password1').blur(check_password);
  $('#password2').blur(check_repassword);
  $('#tt').click(leave);
  $('.radiosaler').click(change)
  $('.radiouser').click(change2)
});
  
function register_in(){
	var $rg=$("#register");
	var $tt=$("#tt");
	$tt.css("display","block");
	$rg.css("display","block");
	setTimeout(function(){ 
		$rg.css("transform","translate( 0, 103%)");
    },100);
}   
function leave(){
    var $rg=$("#register");
	var $tt=$("#tt");
	setTimeout(function(){ 
	  $rg.css("transform","translate( 0, -103%)");
	},100);
	$tt.css("display","none");
	$rg.css("display","none");
 }
function check_email(){
   var flag = false;
   var reg = /^(\w+)@(\w{2,3})(\.)com$/;
   console.log('lal');
   if($('#at').val()==""){
	   $('#email_msg').html('登录邮箱不能为空');
	   flag = false;
}else{
 
	$('#email_msg').empty();
	if($('#at').val().match(reg)){
		flag = true;
  
	$.ajax({
	  'url':'check_01.do',
	  'type':'post',
	  'data':{'email':$('#at').val()},
	  'dataType':'text',
	  'success':function(data){
	      if(data=="no"){
	      $('#email_msg').empty();
	        flag = true;                   
	      }else{
	      $('#email_msg').html('该邮箱已被占用');
	        flag = false;
	      }
	  },
	  'async':false
	});
	}else{
		flag = false;
		$('#email_msg').html('邮箱不符合规范');
     } 
    }
    return flag;
    }
function check_name(){
	var flag1 = false;
    console.log('lal');
    if($('#name').val()==""){
    	$('#name_msg').html('用户名不能为空');
    	flag = false;
    }else{
    	$('#name_msg').empty();
          flag = true;
     }
        return flag;
}
function check_password(){
    var flag1 = false;
    console.log('lal');
    if($('#password1').val()==""){
    	$('#pwd_msg1').html('密码不能为空');
    	$('#password2').attr("value","");
    	flag = false;
    }else{
    	$('#pwd_msg1').empty();
    	flag = true;
    }
    return flag;
}
function check_repassword(){
	var flag1 = false;
	console.log('lal');
	if($('#password2').val()==""){
		$('#pwd_msg2').html('请确认密码');
		flag = false;
	}else{
		$('#pwd_msg2').empty();
		if($('#password2').val()==$('#password1').val()){
			flag = true;
		}else{
			$('#password2').attr("value","");
			$('#password1').attr("value","");
			$('#pwd_msg2').html("密码校对错误");
			flag= false;
		}
	}
    return flag;
    }
function beforesubmit(){
    var flag = check_name()&&check_email()&&check_password();
    return flag;
}Functionfun
function change(){
	$('.discount').removeClass('hide');
	$('.type').removeClass('hide');
	$('.address').removeClass('hide');
	
}
function change2(){
	
	$('.discount').addClass('hide');
	$('.type').addClass('hide');
	$('.address').addClass('hide');
}