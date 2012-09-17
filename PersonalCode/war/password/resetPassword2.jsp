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
	.accountEmailDiv{
		margin-top:30px;
		position:relative;
	}
	.emailInput{
		width:200px;
	}
	.accountEmailDiv label{
		position:absolute;
		top:1px;
		left:2px;
		font-size:16px;
		color:#ABACAD;
		cursor:text;
	}
	.emailValidError{
		color:red;
		font-style:italic;
		display:none;
	}
	.sendUrlButtonDiv{
		margin-top:30px;
	}
	.resetButton{
		border: 1px solid #327E04;
		background: #459E00;
		font-weight: bold;
		color: white;
		cursor: pointer;
		width: 200px;
		height: 30px;
		-moz-border-radius: 6px;
		-webkit-border-radius: 6px;
		-khtml-border-radius: 6px;
		border-radius: 6px;
		float:left;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".resetButton").on("mouseover", function() {
			$(this).css("background-color", "#67B021");
		});
		$(".resetButton").on("mouseout", function() {
			$(this).css("background-color", "#459E00");
		});
		$(".emailInput").on("keyup", function() {
			if($(this).val()!=""){
				$($($(this).parent()).find("label")).css("display","none");
			}else{
				$($($(this).parent()).find("label")).css("display","inline");
			}
		});
		$(".resetButton").on("click",function(){
			
				$(".emailValidError").css("display","none");
				var format = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
				var result = format.exec($.trim($("#email").val()));
				if(result==null){
					$(".emailValidError").css("display","block");
				}else{
					var email = $.trim($("#email").val());
					$.get(
						"/sendEmailNotLogin",
						{"toEmail":email},
						function(data){
							if(data=="1"){
								$( "#dialog" ).dialog({
									modal: true,
									buttons: {
										"OK": function() {
											$( this ).dialog( "close" );
										}
									},
								});
							}else{
								alert("Password rest url sent error. Please try again later.");
							}
						}
					);
				}
			
				
			
		});
	});
	
</script>
<title>Reset your password</title>
</head>
<body>
<div id="dialog" title="Password reset url sent" style="display:none">
	<p>Password reset url has been sent to your email. Please check it.</p>
</div>
<div class="content">
	<div class="topDiv">
			<img alt="logo" src="../image/logo.png" class="logo">
			<a href="../login.jsp" class="loginLink">Go to login page</a>
	</div>
	<div class="mainContent">
		<div class="title">
			Reset Password
		</div>
		<div class="accountEmailDiv">
				<label for="email">Account email</label>
				<input type="text" class="emailInput" name="email" id="email"/>
			</div>
		<div class="emailValidError">
				Not a valid email!
		</div>
		<div class="sendUrlButtonDiv">
			<button class="resetButton">Send password reset url</button>
		</div>
		
	</div>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>