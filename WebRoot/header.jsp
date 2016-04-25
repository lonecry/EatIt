<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8" import="entity.*"%>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/header.css" />
	<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery.qrcode.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery.base64.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/search.js" type="text/javascript" charset="utf-8"></script>
</head>
<% User  user = (User)session.getAttribute("user");
   Saler saler=(Saler)session.getAttribute("saler");
%>

<div class="top">
	<div class="topCenter">
		<div class="logo">
			<img width="170px" height="60px" src="images/logo/EatIt.png">
		</div>
		<div class="search">
			<input class="searchinput" id="searchinput" name="search"
				placeholder="请输入关键词" value="" type="text"
				onkeypress="EnterPress(event)" onkeydown="EnterPress()"> <a
				href="search.jsp" id="searchbtn"> <img
				src="img/iconfont-sousuo.png" class="searchicon">
			</a>
		</div>

		<div class="handle">
			<%  
				if(user!=null ){
         	%>
			<img width="20px" height="21px" src="images/otherImg/aim.png" class="logico"> 
			<a href="view.do?name=<%=user.getName()%>"
				class="login"><%=user.getName()%>
			</a> 
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
			<a href='logout.do' class='logout'>退出</a>
			<% 
				}else if(saler!=null){
         	%>
         	<img width="20px" height="21px" src="images/otherImg/aim.png">
			<a href="salerzone.jsp" class="login">
				<%=saler.getName()%>
			</a> 
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
			<a href='logout.do' class='logout'>退出</a>
			<%
	     		}else{
	     	%>
			<img width="20px" height="21px" src="images/otherImg/aim.png">
			<a href="login.jsp" class="login">登录</a>
			
			<% } %>

			<img width="20px" height="21px" src="images/otherImg/flickr.png">
			<a href="record.jsp" class="record">记录</a>
		</div>
	</div>
</div>

</html>