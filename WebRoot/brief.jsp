<%@page language="java" import="dao.*,entity.*,java.util.*"
	pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Map.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/briefStyle.css">
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.qrcode.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.base64.js" type="text/javascript" charset="utf-8"></script>
<script src="js/myqrcode.js" type="text/javascript" charset="utf-8"></script>
<script src="js/record.js" type="text/javascript" charset="utf-8"></script>
<title>商家简介</title>
</head>
<body>
	<!-- 引用头文件 -->
	<div id="navi">
		<%@include file="header.jsp"%>
	</div>

	<!-- 引用分类 -->
	<div id="page">
		<%@include file="trimble2.jsp"%>
	</div>

	<!-- 正文pages生成 -->
	<div class="mid">
		<div class="picture">
			<br> <img class="imgs" src="images/${saler.imgName}.jpg" />
		</div>
		<div class="ifo">
			<span class="s" id="s_name">${saler.name}</span><br> <span
				class="s" id="s_count">${saler.discount}</span><br />
			<br />
			<br> <span class="c" id="s_address">地址:${saler.address} </span>
			<br>
			<br /> <span class="c" id="s_tell">电话:${saler.tel}</span><br>
			<% if(user!=null ){%>
			<a href="collection.do?name=${saler.name}&discount=${saler.discount}&logname=<%=user.getName()%>"  class="more" style="text-decoration: none"> 
				<input class="b" type="button" value="领取优惠券">
			</a>
			<%}%>
		</div>
		<!-- 存放二维码 -->
		<div class="code"></div>
	</div>
	<!-- 引用脚文件 -->
	<div class="bottom" style="float: left; width: 100%">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>