<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.appspot.angge3.business.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="./js/jquery/jquery-1.8.0.min.js"></script>
<title>Register</title>
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
	width: 265px;
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
	position:relative;
}

.registerButton {
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


.link {
	text-decoration: none;
	font-size: 13px;
	color: #9EA0A3;
}

.loginDiv {
	position: fixed;
	right: 0px;
	top: 20px;
	width: 80px;
	height: 40px;
	background: #459E00;
	font-weight: bold;
	color: white;
	-moz-border-top-left-radius: 6px;
	-webkit-border-top-left-radius: 6px;
	-khtml-border-top-left-radius: 6px;
	border-top-left-radius: 6px;
	-moz-border-bottom-left-radius: 6px;
	-webkit-border-bottom-left-radius: 6px;
	-khtml-border-bottom-left-radius: 6px;
	border-bottom-left-radius: 6px;
	cursor: pointer;
	padding: 0;
}

.loginDiv a {
	display: block;
	margin-top: 10px;
	margin-left: 20px;
	text-decoration: none;
	font-size: 13px;
	color: white;
}
.errorTip{
	display:none;
	width: 228px;
	padding: 0 20px 0 40px;
	line-height: 36px;
	height: 40px;
	background: url(./image/back.png) no-repeat -200px -450px;
	margin-bottom: 20px;
	color: #69664F;
}
.loginFormDiv label{
	position: absolute;
	width: 240px;
	height: 52px;
	margin: 0 10px;
	line-height: 52px;
	color: #ABACAD;
	font-size: 16px;
	top: 0;
	overflow: hidden;
	white-space: nowrap;
	z-index: 10;
	cursor:text;
}
</style>
<script type="text/javascript">
	$(function() {
		verticalMiddle();
		$(window).resize(function() {
			verticalMiddle();
		});
		$("#email").on("focus", function() {
			$($(this).parent()).css("background-position", "-210px 0");
			
		});
		$("#password").on("focus", function() {
			$($(this).parent()).css("background-position", "-210px 0");
			
		});
		$("#email").on("blur", function() {
			$($(this).parent()).css("background-position", "-210px -52px");
			

		});
		$("#password").on("blur", function() {
			$($(this).parent()).css("background-position", "-210px -52px");
			

		});
		
		$(".inputText").on("keyup", function() {
			if($(this).val()!=""){
				$($($(this).parent()).find("label")).css("display","none");
			}else{
				$($($(this).parent()).find("label")).css("display","inline");
			}
		});
		$(".registerButton").on("mouseover", function() {
			$(this).css("background-color", "#67B021");
		});
		$(".registerButton").on("mouseout", function() {
			$(this).css("background-color", "#459E00");
		});
		$(".loginDiv").on("mouseover", function() {
			$(this).css("background-color", "#67B021");
		});
		$(".loginDiv").on("mouseout", function() {
			$(this).css("background-color", "#459E00");
		});
		$(".link").on("mouseover", function() {
			$(this).css("color", "#7F7F7F");
		});
		$(".link").on("mouseout", function() {
			$(this).css("color", "#9EA0A3");
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
	
	<div class="loginDiv">
		<a href="login.jsp">Login</a>
	</div>
	<div class="content">
		<div class="logo"></div>
		<div class="loginFormDiv">
			<form action="register.jsp" method="post">
				<div class="emailInput ">
					<label for="email">Email</label>
					<input type="text" name="email" class="inputText"
						id="email" />
				</div>
				<div class="passwordInput ">
					<label for="password">Password</label>
					<input type="password"  name="password"
						class="inputText" id="password" />
				</div>
				<div id="emailValidError" class="errorTip">
					Invalid email.
				</div>
				<div id="emailExistError" class="errorTip">
					Email already in use.
				</div>
				<div id="emptyError" class="errorTip">
					Email or password can't be empty.
				</div>
				<div class="buttonAndRemember ">
					<input type="submit" value="Start" class="registerButton" /> <input
						type="checkbox" name="remember" style="margin-left: 82px; vertical-align: middle" /><span
						style="font-size: 13px; color: #7F7F7F">remember me</span>
				</div>
			</form>
			
		</div>
	</div>
	<%
		String method = request.getMethod();
		if(method.equalsIgnoreCase("POST")){
			String email = (String)request.getParameter("email");
			String password = (String)request.getParameter("password");
			if(email!=null&&password!=null){
				%>
				<script type="text/javascript">
					$("#email").val("<%=email%>");
					$("#password").val("<%=password%>");
					$(".loginFormDiv label").css("display","none");
				</script>
				<% 
			}
			%>
				<script type="text/javascript">
					if($.trim($("#email").val())==""||$.trim($("#password").val())==""){
						$("#emptyError").css("display","block");
						if($.trim($("#email").val())==""){
							$(".emailInput label").css("display","inline");
						}
						if($.trim($("#password").val())==""){
							$(".passwordInput label").css("display","inline");
						}
					}else{
						var format = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
						var result = format.exec($.trim($("#email").val()));
						if(result==null){
							$("#emailValidError").css("display","block");
						}else{
							<%
								if(email!=null){
									UserValidator validator = new UserValidator();
									boolean emailExist = validator.validateEmail(email);
									if(emailExist){
										%>
											$("#emailExistError").css("display","block");
										<%
									}else{
										new UserRegister().registerUser(email, password);
										//session save and redirect
									}
								}
							%>
						}
				   }
			</script>		
 		  <%
		}
 		  %>
 		

	
</body>
</html>