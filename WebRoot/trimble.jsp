<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/trimble.css" />
<script src="js/slider.js"></script>
<script type="text/javascript">
			$(function() {
				var bannerSlider = new Slider($('#banner_tabs'), {
					time: 5000,
					delay: 400,
					event: 'hover',
					auto: true,
					mode: 'fade',
					controller: $('#bannerCtrl'),
					activeControllerCls: 'active'
				});
				$('#banner_tabs .flex-prev').click(function() {
					bannerSlider.prev()
				});
				$('#banner_tabs .flex-next').click(function() {
					bannerSlider.next()
				});
			})
		</script>
</head>
<div class="trimble">
	<div id="container">
		<ul id="nav">
			<li><a href="in.do">首页</a></li>
			<li><a href="in.do#eat">吃</a></li>
			<li><a href="in.do#drink">喝</a></li>
			<li><a href="in.do#play">玩</a></li>
			<li><a href="in.do#fun">乐</a></li>
		</ul>
	</div>
	<div class="top_1">
		<div>
			<div id="banner_tabs" class="flexslider">
				<ul class="slides">
					<li><a title="" target="_blank" href="#"> <img
							width="1100" height="370" alt=""
							style="background: url(images/somePicture/banner1.jpg) no-repeat center;"
							src="images/somePicture/alpha.png">
					</a></li>
					<li><a title="" href="#"> <img width="1100" height="370"
							alt=""
							style="background: url(images/somePicture/banner2.jpg) no-repeat center;"
							src="images/somePicture/alpha.png">
					</a></li>
					<li><a title="" href="#"> <img width="1100" height="370"
							alt=""
							style="background: url(images/somePicture/banner3.jpg) no-repeat center;"
							src="images/somePicture/alpha.png">
					</a></li>
					<li><a title="" href="#"> <img width="1100" height="370"
							alt=""
							style="background: url(images/somePicture/banner4.jpg) no-repeat center;"
							src="images/somePicture/alpha.png">
					</a></li>
					<li><a title="" href="#"> <img width="1100" height="370"
							alt=""
							style="background: url(images/somePicture/banner5.jpg) no-repeat center;"
							src="images/somePicture/alpha.png">
					</a></li>
					<li><a title="" href="#"> <img width="1100" height="350"
							alt=""
							style="background: url(images/somePicture/banner6.jpg) no-repeat center;"
							src="images/somePicture/alpha.png">
					</a></li>
				</ul>
				<ul class="flex-direction-nav">
					<li><a class="flex-prev" href="javascript:;">Previous</a></li>
					<li><a class="flex-next" href="javascript:;">Next</a></li>
				</ul>
				<ol id="bannerCtrl" class="flex-control-nav flex-control-paging">
					<li><a>1</a></li>
					<li><a>2</a></li>
					<li><a>2</a></li>
					<li><a>2</a></li>
					<li><a>2</a></li>
					<li><a>2</a></li>
				</ol>
			</div>
		</div>
	</div>
</div>
</html>