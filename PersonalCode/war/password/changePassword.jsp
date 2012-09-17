<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.title{
		font-size:20px;
		font-weight:bold;
		margin-bottom:5px;
	}
	.separateLine{
		border-top:2px solid green;
	}
	.oldPasswordDiv,.newPasswordDiv,.retypeNewPasswordDiv{
		margin-top:30px;
		position:relative;
	}
	.oldPasswordDiv label,.newPasswordDiv label,.retypeNewPasswordDiv label{
		position:absolute;
		top:0;
		left:5px;
		margin-top:3px;
		color: #ABACAD;
		font-size:15px;
		cursor:text;
	}
	.fetchPasswordLink{
		margin-left:30px;
	}
	.fetchPasswordLink:link,.fetchPasswordLink:visited{
		color:#459E00;
	}
	.fetchPasswordLink:hover{
		color:#67B021;
	}
	.fetchPasswordLink:active{
		color:#459E00;
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
	.errorTip1,.errorTip2,.errorTip3,.errorTip4{
		color:red;
		font-style:italic;
		display:none;
	}
	
</style>
<title>Change Password</title>
<link rel="stylesheet" href="../js/jquery/jquery-ui-1.8.23.custom/css/south-street/jquery-ui-1.8.23.custom.css">
<script type="text/javascript" src="../js/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".lavaLamp li").removeClass("current");
		 $(".lavaLamp li:eq(3)").addClass("current");
	});
</script>
<%@ include file="../common/header.jsp"%>
<div class="mainContent">
<div class="title">
	Change Password
</div>
<div class="separateLine">
</div>
<div class="oldPasswordDiv">
	<label for="oldPassword">Old Password</label>
	<input type="password" name="oldPassword" class="inputText" id="oldPassword" size="30"/>
	<a href="resetPassword.jsp" class="fetchPasswordLink">Forgot your password?</a>
</div>
<div class="errorTip1">
	Old password can not be empty!
</div>
<div class="errorTip4">
	Old password is not correct!
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
	<p>Password changed successfully! Redirecting to login page.</p>
</div>
<div id="errorDialog" title="Change Password Error" style="display:none">
	<p>Change password error. Please try again later.</p>
</div>
<script src="../js/jquery/jquery-ui-1.8.23.custom/jquery-ui-1.8.23.custom.min.js"></script>
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
			$(".errorTip1").css("display","none");
			$(".errorTip2").css("display","none");
			$(".errorTip3").css("display","none");
			if($.trim($("#oldPassword").val())==""){
				$(".errorTip1").css("display","block");
			}else{
				if($.trim($("#newPassword").val())==""){
					$(".errorTip2").css("display","block");
				}else{
					if($.trim($("#retypeNewPassword").val())!=$.trim($("#newPassword").val())){
						$(".errorTip3").css("display","block");
					}else{
						$.get(
							"/validatePassword",
							{"oldPassword":$("#oldPassword").val()},
							function(data){
								if(data=="1"){
									$.get(
										"/updatePassword",
										{"newPassword":$("#newPassword").val()},
										function(result){
											if(result!="1"){
												$( "#errorDialog" ).dialog({
													modal: true,
												});
											}else{
												$( "#dialog" ).dialog({
													modal: true,
													close: function() {
														window.location = "../login.jsp";
													}
												});
												setTimeout(function () {
													window.location = "../login.jsp";
												}, 1000);
												
											}
										}
									);
									
								}else{
									$(".errorTip4").css("display","block");
								}
							}
						);
						
					}
				}
			}
		});
	});
	
</script>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>