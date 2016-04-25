<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"
	import="dao.*,entity.*,java.util.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>吃点吧</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
<script src="js/jquery.min.js"></script>
</head>
<body>
	<div class="login">
		<%@include file="header.jsp"%>
	</div>
	<div class="login_1">
		<%@include file="trimble.jsp"%>
	</div>
	<div class="content">
		<div class="list">
			<p>
				<span class="title" id="eat">吃</span><a href="classify.do?type=eat"
					class="more">更多&gt;&gt;</a>
			</p>
			<div class="picture">
				<!-- style="border: 1px solid green" -->
				<c:forEach items="${eat}" var="e" varStatus="">
					<div class="p1">
						<a href="brief.do?name=${e.name}"> <img
							src="images/${e.imgName}.jpg">
						</a> <a href="brief.do?name=${e.name}"> ${e.name} </a>
						<p>${e.discount }</p>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="list">
			<p>
				<span class="title" id="drink">喝</span><a
					href="classify.do?type=drink" class="more">更多&gt;&gt;</a>
			</p>
			<div class="picture">
				<c:forEach items="${drink}" var="e" varStatus="">
					<div class="p1">
						<a href="brief.do?name=${e.name}"> <img
							src="images/${e.imgName}.jpg">
						</a> <a href="brief.do?name=${e.name}"> ${e.name} </a>
						<p>${e.discount }</p>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="list">
			<p>
				<span class="title" id="play">玩</span><a
					href="classify.do?type=play" class="more">更多&gt;&gt;</a>
			</p>
			<div class="picture">
				<c:forEach items="${play}" var="e" varStatus="">
					<div class="p1">
						<a href="brief.do?name=${e.name}"><img
							src="images/${e.imgName}.jpg"></a> <a
							href="brief.do?name=${e.name}">${e.name}</a>
						<p>${e.discount }</p>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="list">
			<p>
				<span class="title" id="fun">乐</span><a href="classify.do?type=fun"
					class="more">更多&gt;&gt;</a>
			</p>
			<div class="picture">
				<c:forEach items="${fun}" var="e" varStatus="">
					<div class="p1">
						<a href="brief.do?name=${e.name}"><img
							src="images/${e.imgName}.jpg"></a> <a
							href="brief.do?name=${e.name}">${e.name}</a>
						<p>${e.discount }</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div>
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>