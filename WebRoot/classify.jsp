<%@page import="dao.*,entity.*,java.util.*" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>更多</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css" href="css/classify.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
	<div class="logo">
		<%@include file="header.jsp"%>
	</div>
	<div class="navigate">
		<%@include file="trimble.jsp"%>
	</div>
	<div id="content">
		<div class="list">
			<div class="salerlist">
				<ul style="padding: 0;">
					<c:forEach items="${salers}" var="saler" varStatus="s">
						<li id="${saler.id}"><a target="_blank"
							href="brief.do?name=${saler.name}"> <img
								src="images/${saler.imgName}.jpg" />
						</a>
							<div class="salertext">
								<p>
									<a target="_blank" href="brief.do?name=${saler.name}">${saler.name}</a>
								</p>
								<p>
									折扣: <a href="brief.do?name=${saler.name}">${saler.discount}</a>
								</p>
							</div></li>
					</c:forEach>
				</ul>
				<div style="clear: both"></div>
			</div>
			<div class="classify">
				<div class="wordclassify">
					<div style="clear: both"></div>
					<span class="c" id="type">按类型</span>
					<p>
						<a class="afix" href="classify.do?type=eat"><img
							src="images/logo/eat.png"
							style="vertical-align: middle; line-height: auto;"><span>吃</span></a>
					</p>
					<p>
						<a class="afix" href="classify.do?type=drink"><img
							src="images/logo/drink.png"
							style="vertical-align: middle; line-height: auto;"><span>喝</span></a>
					</p>
					<p>
						<a class="afix" href="classify.do?type=play"><img
							src="images/logo/play.png"
							style="vertical-align: middle; line-height: auto;"><span>玩</span></a>
					</p>
					<p>
						<a class="afix" href="classify.do?type=fun"><img
							src="images/logo/fun.png"
							style="vertical-align: middle; line-height: auto;"><span>乐</span></a>
					</p>
					<div style="clear: both"></div>
				</div>
			</div>
		</div>
		<div style="clear: both"></div>
	</div>
	<div style="margin: 18px 0 0 0; padding: 0;">
		<%@include file="footer.jsp"%>
	</div>
	<div style="clear: both"></div>
</body>
</html>