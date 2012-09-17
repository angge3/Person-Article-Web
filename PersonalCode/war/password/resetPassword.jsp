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
	
</style>
<title>Reset Password</title>
<link rel="stylesheet" href="../js/jquery/jquery-ui-1.8.23.custom/css/south-street/jquery-ui-1.8.23.custom.css">

<%@ include file="../common/header.jsp"%>
<div class="mainContent">
	<div class="title">
		Reset Password
	</div>
	<div class="separateLine">
	</div>
	<%
		if(session.getAttribute("currentUserEmail")!=null){
			%>
			<div class="emailDiv">
				<span>Your email is : </span>
				<span class="emailSpan"><%=(String)session.getAttribute("currentUserEmail") %></span>
			</div>
			<%
		}else{
			%>
			
			<%
		}
	%>
	
	
	<div class="sendUrlButtonDiv">
		<button class="resetButton">Send password reset url</button>
	</div>
</div>
<div id="dialog" title="Password reset url sent" style="display:none">
	<p>Password reset url has been sent to your email. Please check it.</p>
</div>
<script src="../js/jquery/jquery-ui-1.8.23.custom/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".resetButton").on("mouseover", function() {
			$(this).css("background-color", "#67B021");
		});
		$(".resetButton").on("mouseout", function() {
			$(this).css("background-color", "#459E00");
		});
		
		$(".resetButton").on("click",function(){
			if($(".emailValidError").length>0){
				$(".emailValidError").css("display","none");
				var format = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
				var result = format.exec($.trim($("#email").val()));
				if(result==null){
					$(".emailValidError").css("display","block");
				}else{
					
				}
			}else{
				var email = $.trim($(".emailSpan").text());
				$.get(
					"/sendEmail",
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
							if(data=="-1"){
								alert("This page is overdue. Please login again!");
								window.location = "../login.jsp";
							}else{
								alert("Password rest url sent error. Please try again later.");
							}
						}
					}
				);
			}
		});
			
		
	});
	
</script>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>