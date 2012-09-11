<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="../js/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../js/lavalamp.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
<script type="text/javascript" src="../js/easingCompatible.js"></script>
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
	a:link,a:visited,a:hover,a:active{
		text-decoration:none;
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
		
		height:81px;
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
		
		$(".lavaLamp").lavaLamp({
			fx: "backout", 
			speed: 700
		});
	});
	window.history.forward(1);
</script>

</head>
<body>
	<div class="content">
		<div class="topDiv">
			<img alt="logo" src="../image/logo.png" class="logo">
			<span class="slogan">Personal code and article platform</span>
			<%
				String currentUserEmail =null;
				if(session.getAttribute("currentUserEmail")==null){
					response.sendRedirect("../login.jsp");
				}else{
					 currentUserEmail = (String)session.getAttribute("currentUserEmail");
					
				}
			%>
			<span class="welcome">Welcome,</span><span class="loginEmail"><%=currentUserEmail %>!</span>
			<a href="/logout" class="logout">Logout</a>
		</div>
		<div class="navigatorDiv">
			<ul class="lavaLamp">
	            <li><a href="../post/allPosts.jsp">Homepage</a></li>
	            <li><a href="../post/makePost.jsp">Do Post</a></li>
	            <li><a href="../category/manageCategory.jsp">Category Management</a></li>
	            <li><a href="../password/changePassword.jsp">Change Password</a></li>
	        </ul>   
		</div>