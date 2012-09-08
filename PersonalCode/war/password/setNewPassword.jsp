<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../js/jquery/jquery-1.8.0.min.js"></script>
<script src="../js/jquery/jquery-ui-1.8.23.custom/jquery-ui-1.8.23.custom.min.js"></script>
<link rel="stylesheet" href="../js/jquery/jquery-ui-1.8.23.custom/css/south-street/jquery-ui-1.8.23.custom.css">

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
	.logo{
		float:left;
		margin-right:400px;
	}
	
	.topDiv{
		
		height:81px;
		margin-bottom:30px;
	}
	.loginLink{
		text-decoration: none;
		display:block;
		float:left;
		font-size:14px;
		margin-top:47px;
		margin-left:20px;
		
	}
	.loginLink:link,.loginLink:visited{
		color:#459E00;
	}
	.loginLink:hover{
		color:#67B021;
	}
	.loginLink:active{
		color:#459E00;
	}
	.title{
		font-size:20px;
		font-weight:bold;
		margin-bottom:5px;
	}
	.newPasswordDiv,.retypeNewPasswordDiv{
		margin-top:30px;
		position:relative;
	}
	.newPasswordDiv label,.retypeNewPasswordDiv label{
		position:absolute;
		top:0;
		left:5px;
		margin-top:3px;
		color: #ABACAD;
		font-size:15px;
		cursor:text;
	}
	.confirmButtonDiv{
		margin-top:10px;
	}
	.confirmButton{
		border: 1px solid #327E04;
		background: #459E00;
		font-weight: bold;
		color: white;
		cursor: pointer;
		width: 80px;
		height: 25px;
		-moz-border-radius: 6px;
		-webkit-border-radius: 6px;
		-khtml-border-radius: 6px;
		border-radius: 6px;
		float:left;
		margin-top:20px;
	}
	.errorTip2,.errorTip3{
		color:red;
		font-style:italic;
		display:none;
	}
	.mainContent{
		background-color:#efe;
		height:500px;
		padding:20px;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".inputText").on("keyup", function() {
			if($(this).val()!=""){
				$($($(this).parent()).find("label")).css("display","none");
			}else{
				$($($(this).parent()).find("label")).css("display","inline");
			}
		});
		$(".confirmButton").on("mouseover", function() {
			$(this).css("background-color", "#67B021");
		});
		$(".confirmButton").on("mouseout", function() {
			$(this).css("background-color", "#459E00");
		});
		$(".confirmButton").on("click",function(){
			$(".errorTip2").css("display","none");
			$(".errorTip3").css("display","none");
			if($.trim($("#newPassword").val())==""){
				$(".errorTip2").css("display","block");
			}else{
				if($.trim($("#retypeNewPassword").val())!=$.trim($("#newPassword").val())){
					$(".errorTip3").css("display","block");
				}else{
						//change password
						$( "#dialog" ).dialog({
							modal: true,
							close: function() {
								//doredirect
							}
						});
						//do redirect
				}
			}
		});
	});
	
</script>
<title>Set New Password</title>
</head>
<body>
<div id="dialog" title="Password Changed Successfully" style="display:none">
	<p>Password changed successfully! Redirecting to homepage.</p>
</div>
<div class="content">
	<div class="topDiv">
			<img alt="logo" src="../image/logo.png" class="logo">
			<a href="" class="loginLink">Go to login page</a>
	</div>
	<div class="mainContent">
		<div class="title">
			Set New Password
		</div>
		<div class="newPasswordDiv">
			<label for="newPassword">New Password</label>
			<input type="password" name="newPassword" class="inputText" id="newPassword" size="30"/>
		</div>
		<div class="errorTip2">
			New password can not be empty!
		</div>
		<div class="retypeNewPasswordDiv">
			<label for="retypeNewPassword">Confirm New Password</label>
			<input type="password" name="retypeNewPassword" class="inputText" id="retypeNewPassword" size="30"/>
		</div>
		<div class="errorTip3">
			The passwords you typed are not matched!
		</div>
		<div class="confirmButtonDiv">
			<button class="confirmButton">Confirm</button>
		</div>
		<div id="dialog" title="Password Changed Successfully" style="display:none">
			<p>Password changed successfully! Redirecting to homepage.</p>
		</div>
	</div>
</div>
</body>
</html>