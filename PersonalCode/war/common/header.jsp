<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../js/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../js/lavalamp.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/menu.css" />
<style type="text/css">
	body {
		background: url("../image/allBackground.png") repeat;
		font-size: 12px;
		font-family: "Microsoft Yahei", "微软雅黑", Tahoma, Arial, STHeiti,
			sans-serif;
	}
	img{
		border:0;
	}
	.content{
		margin-left:auto;
		margin-right:auto;
		width:900px;
	}
	.slogan {
		display:block;
		float:left;
		font-size:17px;
		margin-top:45px;
		color:orange;
	}
	.logo{
		float:left;
	}
	.welcome{
		display:block;
		float:left;
		font-size:14px;
		margin-top:47px;
		margin-left:20px;
		color:#666;
	}
	.loginEmail{
		display:block;
		float:left;
		font-size:14px;
		margin-top:47px;
		margin-left:5px;
		color:green;
	}
	.logout{
		text-decoration: none;
		display:block;
		float:left;
		font-size:14px;
		margin-top:47px;
		margin-left:20px;
		color: #9EA0A3;
	}
	.topDiv{
		
		height:100px;
	}
</style>

<script type="text/javascript">
	$(function(){
		$(".logout").on("mouseover", function() {
			$(this).css("color", "#7F7F7F");
		});
		$(".logout").on("mouseout", function() {
			$(this).css("color", "#9EA0A3");
		});
		$(".lavaLamp").lavaLamp({ fx: "backout", speed: 700 });
	});
	
</script>

</head>
<body>
	<div class="content">
		<div class="topDiv">
			<img alt="logo" src="../image/logo.png" class="logo">
			<span class="slogan">Personal code and article platform</span>
			<span class="welcome">Welcome,</span><span class="loginEmail">angge3@gmail.com!</span>
			<a href="" class="logout">Logout</a>
		</div>
		<div class="navigatorDiv">
			<ul class="lavaLamp">
	            <li><a href="#">Homepage</a></li>
	            <li><a href="#">Do Post</a></li>
	            <li><a href="#">Category Management</a></li>
	            <li><a href="#">Change Password</a></li>
	        </ul>   
		</div>
	</div>
</body>
</html>