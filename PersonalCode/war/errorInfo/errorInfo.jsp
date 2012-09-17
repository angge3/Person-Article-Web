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

	.mainContent{
		background-color:#efe;
		height:500px;
		padding:20px;
	}
	.errorContent{
		color:red;
		font-size:20px;
		text-align: center;
		margin-top:200px;
	}


</style>

<%
	String errorTitle = request.getParameter("errorTitle");
	String errorContent = request.getParameter("errorContent");
%>
<title><%=errorTitle %></title>
</head>
<body>

<div class="content">
	<div class="topDiv">
			<img alt="logo" src="../image/logo.png" class="logo">
			<a href="../login.jsp" class="loginLink">Go to login page</a>
	</div>
	<div class="mainContent">
		<div class="errorContent">
			<%=errorContent%>
		</div>	
	</div>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>