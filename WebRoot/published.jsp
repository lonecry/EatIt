<%@page language="java" import="dao.*,entity.*,java.util.*"
	pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Map.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/briefStyle.css">
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.qrcode.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.base64.js" type="text/javascript" charset="utf-8"></script>
<script src="js/myqrcode.js" type="text/javascript" charset="utf-8"></script>
<script src="js/record.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	window.onload = function () {
		check = function (){
			var disc=document.getElementById("disc");
			var reg=/^\d(\.\d)?折$/;
			var flag=reg.test(disc.value);
			if(flag){
				return true;
			}else{
				alert("折扣格式不对，请重新输入！例如9.5折");
				return false;
			}
		}
		
		
	}
</script>
<title>发布管理</title>
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
		<div class="picture"><!-- style="border: 1px solid green" -->
			<img class="imgs" src="images/${saler.imgName}.jpg"  /><br> 
			<% 
				if(saler!=null){
         	%>
				<form name="myform" action="imgupload.action?name=<%=saler.getName()%>" method="post" enctype="multipart/form-data"  class="myform"> 
					<br>
					<span>上传或修改图片，2M以内！</span>
					<input type="file" name="myfile"><br>
					<input type="submit" name="submit" value="   确  定   "  /> 
				</form>
			<%} %>
		</div>
		<div class="ifo"  >
			<span class="s" id="s_name">${saler.name}</span><br> 
			<span class="s s_count" id="s_count">${saler.discount}</span> 
 			<% 
				if(saler!=null){
        	%>
 				<form name="myform2" action="discountcg.do?name=<%=saler.getName()%>" method="post"  class="discform">
 					<input type="text" name="disc" id="disc" class="s_count"  value="${saler.discount}"> <!-- placeholder="请输入修改后折扣。" -->
 					<input type="submit" name="submit" value="  确  定   " onclick="return check()"/> 
 				</form>
 			 <%} %>
			<br />
			<br> <span class="c" id="s_address">地址:${saler.address} </span>
			<br>
			<br /> <span class="c" id="s_tell">电话:${saler.tel}</span><br>
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