<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>用户登录</title>
<link rel="stylesheet" href="css/login.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
</head>
<body>
	<%
   String email = (String)request.getAttribute("email");
   if(email==null){  
             email="";
             }
   String password = (String)request.getAttribute("password");   
   if(password==null){  
             password="";
             }  
  %>
	<div id="title">吃 点 吧</div>
	<form method="post" action="check_login.do" class="login">
		<p>
			<label for="login">邮箱:</label> <input type="text" name="login"
				id="login" value=<%=email %>>
		</p>

		<p>
			<label for="password">密码:</label> <input type="password"
				name="password" id="password" value=<%=password %>>
		</p>

		<p class="login-submit">
			<button type="submit" class="login-button">登录</button>
		</p>

		<p class="role">
			<input type="radio" checked="checked" name="role" value="user"
				id="user">用户 <input type="radio" name="role" value="saler"
				id="saler">商家 <span class="to-register">
				<a href="javascript:;" onclick="register_in();" >注册</a></span>
		</p>
	</form>
	<div class="wicket"></div>
	<div id="tt"></div>
	<div id="register">
		<h1>注 册</h1>
		<form method="get" action="check_regist.do" class="regist"
			onsubmit="return beforesubmit();">
			<p class="role">
				<input type="radio" checked="checked" name="role" value="user" id="user" class="radiouser">用户 
				<input type="radio" name="role" value="saler" id="saler" class="radiosaler">商家
			</p>
			<fieldset>
				<legend>账号信息>>></legend>
				<p>
					<label for="at">邮箱:</label> <input type="text" name="at" id="at"
						value=""> <span id="email_msg" class="email_msg"></span>
				</p>

				<p>
					<label for="password1">密码:</label> <input type="password"
						name="password1" id="password1" value=""> <span
						id="pwd_msg1" class="pwd_msg1"></span>
				</p>
				<p>
					<label for="password2">确认密码:</label> <input type="password"
						name="password2" id="password2" value=""> <span
						id="pwd_msg2" class="pwd_msg2"></span>
				</p>

			</fieldset>

			<fieldset>
				<legend>个人信息>>></legend>
				<p>
					<label for="name">姓名:</label> <input type="text" name="name"
						id="name" value=""> <span id="name_msg" class="name_msg"></span>
				</p>
				<p class="address">
					<label for="address hide">地址:</label> <input type="text" name="address"
						id="address" value="">
				</p>
				<p class="discount hide" >
					<label for="discount">折扣:</label> <input type="text"
						name="discount" id="discount" value="">
				</p>
				<p>
					<label for="phone">电话:</label> <input type="text" name="phone"
						id="phone" value="">
				</p>
				<p class="type hide">
					<label for="type">类型:</label> 
					<input type="radio" name="type" value="eat" checked="checked" class="pofix">吃 
					<input type="radio" name="type" value="drink" class="pofix">喝 
					<input type="radio" name="type" value="play" class="pofix">玩 
					<input type="radio" name="type" value="fun" class="pofix">乐
				</p>
			</fieldset>

			<p class="regist-submit">
				<button type="submit" class="regist-button">注册</button>
			</p>

		</form>
	</div>
</body>
</html>
