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
	.emailDiv{
		margin-top:30px;
		display:none;
	}
	.emailSpan{
		color:green;
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
</style>
<title>Reset Password</title>
<%@ include file="../common/header.jsp"%>
<div class="mainContent">
	<div class="title">
		Reset Password
	</div>
	<div class="separateLine">
	</div>
	<div class="emailDiv">
		<span>Your email is : </span>
		<span class="emailSpan">angge3@gmail.com</span>
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
				
			}
		});
			
		
	});
	
</script>
</div>
</body>
</html>