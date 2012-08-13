<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./js/jquery/jquery-1.8.0.min.js"></script>
<title>Login</title>
<style type="text/css">
body {
	background: url("./image/allBackground.png") repeat;
	font-size: 12px;
	font-family: "Microsoft Yahei", "微软雅黑", Tahoma, Arial, STHeiti,
		sans-serif;
}

.content {
	width: 300px;
	margin-left: auto;
	margin-right: auto;
}

.logo {
	background: url("./image/logo.png") no-repeat;
	width: 300px;
	height: 90px;
}

.inputText {
	font-family: "Microsoft Yahei", "微软雅黑", Tahoma, Arial, Helvetica,
		STHeiti;
	color: #8F8F8F;
	padding: 10px;
	line-height: 32px;
	width: 234px;
	border: 0;
	outline: none;
	font-size: 16px;
	z-index: 20;
	background: transparent url("/image/blank.png") repeat;
}

.passwordInput,.emailInput {
	background: url("./image/back.png") no-repeat -210px -52px;
	height: 52px;
	margin-bottom: 3px;
}

.loginButton {
	border: 1px solid #327E04;
	background: #459E00;
	font-weight: bold;
	color: white;
	cursor: pointer;
	width: 100px;
	height: 30px;
	-moz-border-radius: 6px;
	-webkit-border-radius: 6px;
	-khtml-border-radius: 6px;
	border-radius: 6px;
}

.buttonAndRemember {
	margin-top: 10px;
}
.forgotPassDiv{
	margin-top:10px;
	margin-left:65px;
}
.link{
	text-decoration: none;
	font-size: 13px;
	color: #9EA0A3;
}
</style>
<script type="text/javascript">
	$(function() {
		verticalMiddle();
		$(window).resize(function() {
			verticalMiddle();
		});
		$(".inputText").on("focus", function() {
			$($(this).parent()).css("background-position", "-210px 0");
		});
		$(".inputText").on("blur", function() {
			$($(this).parent()).css("background-position", "-210px -52px");
		});
		$(".loginButton").on("mouseover", function() {
			$(this).css("background-color", "#67B021");
		});
		$(".loginButton").on("mouseout", function() {
			$(this).css("background-color", "#459E00");
		});
		$(".link").on("mouseover",function(){
			$(this).css("color","#7F7F7F");
		});
		$(".link").on("mouseout",function(){
			$(this).css("color","#9EA0A3");
		});
	});

	function verticalMiddle() {
		var window_height = $(window).height();
		var padding = (window_height - $(".content").height()) / 2;
		$(".logo").css("margin-top", padding);
	}
</script>
</head>
<body>
	<div class="content">
		<div class="logo"></div>
		<div class="loginFormDiv">
			<form action="" method="post">
				<div class="emailInput ">
					<input type="text" value="Email" class="inputText" />
				</div>
				<div class="passwordInput ">
					<input type="text" value="Password" class="inputText" />
				</div>
				<div class="buttonAndRemember ">
					<input type="button" value="Login" class="loginButton" /> <input
						type="checkbox" style="margin-left:82px;vertical-align:middle"/><span style="font-size: 13px; color:#7F7F7F">remember me</span>
				</div>
			</form>
			<div class="forgotPassDiv">
				<a href="" class="link">Forgot your password?</a>
			</div>
		</div>
	</div>
</body>
</html>