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
	.subTitle{
		margin-top:20px;
		font-size:15px;
		font-weight:bold;
	}
	.separateLine{
		border-top:2px solid green;
	}
	.addCategoryDiv{
		margin-top:20px;
	}
	.addButton{
		margin-left:30px;
		border: 1px solid #327E04;
		background: #459E00;
		font-weight: bold;
		color: white;
		cursor: pointer;
		width: 60px;
		height: 20px;
		-moz-border-radius: 6px;
		-webkit-border-radius: 6px;
		-khtml-border-radius: 6px;
		border-radius: 6px;
	}
	.categorysTitleDiv{
		margin-top:50px;
		font-size:15px;
		font-weight:bold;
	}
	.tableDiv{
		margin-top:20px;
	}
	.categoryTable td,.categoryTable th{
		border:1px solid #fff;
		height:30px;
	}
	.categoryTable th{
		background-color:#67B021;
	}
	.categoryTable{
		border-spacing: 2px;
		text-align:center;
		width:360px;
		border-collapse: collapse;
	}
	.categoryTable tr.even td {
		background: #E5F1F4;
	}
	.categoryTable tr.odd td {
		background: #F8FBFC;
	}
	.editLink:link,.editLink:visited{
		color:#459E00;
	}
	.editLink:hover{
		color:#67B021;
	}
	.editLink:active{
		color:#459E00;
	}
	.deleteLink:link,.deleteLink:visited{
		color:#459E00;
	}
	.deleteLink:hover{
		color:#67B021;
	}
	.deleteLink:active{
		color:#459E00;
	}
	.deleteLink{
		margin-left:10px;
	}
	#dialog-form, #dialog-confirm,#dialog-message{
		display:none;
	}
</style>
<title>Category Management</title>
<link rel="stylesheet" href="../js/jquery/jquery-ui-1.8.23.custom/css/south-street/jquery-ui-1.8.23.custom.css">
<script type="text/javascript" src="../js/jquery/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".lavaLamp li").removeClass("current");
		 $(".lavaLamp li:eq(2)").addClass("current");
	});
</script>
<%@ include file="../common/header.jsp"%>
<div id="dialog-form" title="Edit Category">
	<form style="padding-top:20px;">
		<label for="categoryName">New Category Name : </label>
		<input type="text" name="categoryName" id="categoryName" class="text ui-widget-content ui-corner-all" />
		<div style="margin-top:10px;color:red;font-style: italic;display:none" id="errorTip">Category name can not be empty!</div>
		<div style="margin-top:10px;color:green;font-weight:bold;display:none" id="successTip">Change Successfully!</div>
		<div style="margin-top:10px;color:red;font-style:italic;display:none" id="errorTip2">Some error happend. Please try again later.</div>
	</form>
</div>
<div id="dialog-confirm" title="Delete this category?">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>This category will be permanently deleted and cannot be recovered. Are you sure?</p>
</div>
<div id="dialog-message" title="Can Not Delete">
	<p>
		<span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
		Can not delete this category because there are articles in this category!
	</p>
</div>
<div class="mainContent">
	<div class="title">
		Category Management	
	</div>
	<div class="separateLine">
	</div>
	<div class="subTitle">
		Add Category
	</div>
	<div class="addCategoryDiv">
		<label>Category Name : </label>
		<input type="text" class="cateNameInput" id="cateNameText"/>
		<button class="addButton">Add >></button>
	</div>
	<div class="categorysTitleDiv">
		Category
	</div>
	<div class="tableDiv">
		<table class="categoryTable">
			
				<tr class="odd">
					<th>Name</th>
					<th>Articles</th>
					<th>Operations</th>
				</tr>
			
		
				<tr class="even">
					<td>Learning Notes</td>
					<td>2</td>
					<td><a href="" class="editLink">edit</a><a href="" class="deleteLink">delete</a></td>
				</tr>
				<tr class="odd">
					<td>Codes</td>
					<td>3</td>
					<td><a href="" class="editLink">edit</a><a href="" class="deleteLink"">delete</a></td>
				</tr>
		
		</table>
	</div>
</div>
</div>
<script src="../js/jquery/jquery-ui-1.8.23.custom/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$(".addButton").on("mouseover", function() {
			$(this).css("background-color", "#67B021");
		});
		$(".addButton").on("mouseout", function() {
			$(this).css("background-color", "#459E00");
		});
		$(".editLink").on("click",function(){
			$( "#dialog-form" ).dialog( "open" );
			return false;
		});
		$(".deleteLink").on("click",function(){
			$( "#dialog-confirm" ).dialog({
				resizable: false,
				height:180,
				modal: true,
				buttons: {
					"Delete": function() {
						$( this ).dialog( "close" );
					},
					Cancel: function() {
						$( this ).dialog( "close" );
					}
				}
			});
			$( "#dialog-message").dialog({
				modal: true,
				buttons: {
					Ok: function() {
						$( this ).dialog( "close" );
					}
				}
			});
			return false;
		});
	});
	$( "#dialog-form" ).dialog({
		autoOpen: false,
		height: 200,
		width: 350,
		modal: true,
		buttons: {
			"Confirm": function() {
				var bValid = $.trim($("#categoryName").val())=="";
	
				if ( bValid ) {
					$("#errorTip").css("display","block");
				}else{
					$("#errorTip").css("display","none");
					//add category to repository
					var successFlag = true;
					if(successFlag){
						$("#successTip").css("display","block");
						setTimeout(function () {
							$( "#dialog-form" ).dialog( "close" );
						}, 1000);
					}else{
						$("#errorTip2").css("display","block");
					}
				}
			},
			Cancel: function() {
				$( this ).dialog( "close" );
				
			}
		},
		close: function() {
			$("#categoryName").val("");
			$("#successTip").css("display","none");
			$("#errorTip").css("display","none");
			$("#errorTip2").css("display","none");
		}
	});
</script>

</body>
</html>