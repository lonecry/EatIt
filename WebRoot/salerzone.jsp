<%@ page language="java" import="java.util.*" import="java.sql.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/classify.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.base64.js" type="text/javascript" charset="utf-8"></script>
<script src="js/search.js" type="text/javascript" charset="utf-8"></script>
<title>个人中心</title>
</head>
<body>
	<div class="logo">
		<%@include file="header.jsp"%>
	</div>
	 
	<div class="navigate">
		<%@include file="trimble2.jsp"%>
	</div>
	<div id="content2" >
		<a href="published.do?name=<%=saler.getName()%>"><img class="icons" src=images/logo/fabu.png><br>发布管理</a>
		<a href="collrecciew.do?name=<%=saler.getName()%>"><img class="icons" src=images/logo/jilu.png><br>领取记录</a>
	
	
	
	
	</div>
	<div style="margin: 18px 0 0 0; padding: 0;">
		<%@include file="footer.jsp"%>
	</div>
	<div style="clear: both"></div>
</body>
 
</html>