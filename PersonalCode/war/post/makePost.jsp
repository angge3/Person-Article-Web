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
	.titleDiv{
		margin-top:10px;
		font-size:15px;
		font-weight:bold;
		margin-bottom:5px;
	}
	.mainContent{
		margin-top:10px;
	}
	.separateLine{
		border-top:2px solid green;
	}
	
	.createCategoryLink:link,.createCategoryLink:visited{
		color:#459E00;
	}
	.createCategoryLink:hover{
		color:#67B021;
	}
	.createCategoryLink:active{
		color:#459E00;
	}
	.titleAndCategoryDiv{
		margin-bottom:20px;
	}
	.postButton {
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
		float:right;
		margin-top:20px;
	}
	.cancelButton{
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
		float:left;
		margin-top:20px;
	}
</style>
<script charset="utf-8" src="../editor/kindeditor.js"></script>
<script charset="utf-8" src="../editor/lang/en.js"></script>
<script src="../js/jquery/jquery-1.8.0.min.js"></script>
<script>
        var editor;
        KindEditor.ready(function(K) {
                editor = K.create('#contentEditor',{
					langType : 'en',
					resizeType : 1,
					items:['bold','italic','underline','fontsize','forecolor','hilitecolor','|','undo','redo','|','insertorderedlist','insertunorderedlist','|','justifyleft','justifycenter','justifyright','justifyfull','|','lineheight','formatblock','|','image','table','hr','emoticons','link','unlink','code','|','preview']
				});
        });
</script>
<script>
	$(function(){
		$(".postButton").on("mouseover", function() {
			$(this).css("background-color", "#67B021");
		});
		$(".postButton").on("mouseout", function() {
			$(this).css("background-color", "#459E00");
		});
		$(".cancelButton").on("mouseover", function() {
			$(this).css("background-color", "#67B021");
		});
		$(".cancelButton").on("mouseout", function() {
			$(this).css("background-color", "#459E00");
		});
	});
</script>
<title>Make a Post</title>


<%@ include file="../common/header.jsp"%>

<div class="mainContent">
	<div class="title">
		Make a Post
	</div>
	<div class="separateLine">
	</div>
	<form action="" method="post">
		<div class="titleDiv">
			Title
		</div>
		<div class="titleAndCategoryDiv">
			<input type="text" name="title" size="40" style="margin-right:270px;"/>
			post it on
			<select name="category" style="margin-left:10px;margin-right:40px;">
				<option value="1">Learning Notes</option>
				<option value="2">AlgorithmCodes</option>
			</select>
			<a href="" class="createCategoryLink">Create Category</a>
		</div>
		<div class="titleDiv">
			Content
		</div>
		<textarea id="contentEditor" name="content" style="width:900px;height:350px;">
			
		</textarea>
		<input type="submit" value="Post" class="postButton" />
	</form>
	<button class="cancelButton">Cancel</button>
</div>
</div>
</body>
</html>
