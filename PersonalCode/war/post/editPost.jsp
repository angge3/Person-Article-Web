<%@page import="com.sun.net.httpserver.HttpsParameters"%>
<%@page import="com.appspot.angge3.model.Article"%>
<%@page import="com.appspot.angge3.util.*"%>
<%@page import="com.appspot.angge3.model.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.appspot.angge3.business.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<%@page import="com.google.appengine.api.datastore.Text" %>
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
		margin-top:25px;
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
	#dialog-form{
		display:none;
	}
	.errorTip1{
		color:red;
		font-style: italic;
		display:none;
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
					allowUpload : true,
					uploadJson  : '/uploadFile',
					items:['bold','italic','underline','fontsize','forecolor','hilitecolor','|','undo','redo','|','insertorderedlist','insertunorderedlist','|','justifyleft','justifycenter','justifyright','justifyfull','|','lineheight','formatblock','|','image','insertfile','table','hr','emoticons','link','unlink','code','|','preview']
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
		$(".createCategoryLink").on("click",function(){
			$( "#dialog-form" ).dialog( "open" );
			return false;
		});
		$(".lavaLamp li").removeClass("current");
		 $(".lavaLamp li:eq(1)").addClass("current");
	});
	function checkForm(){
		if($.trim($(".titleInput").val())==""){
			$(".errorTip1").css("display","block");
			return false;
		}else{
			return true;
		}
	}
</script>
<title>Edit a Post</title>
<link rel="stylesheet" href="../js/jquery/jquery-ui-1.8.23.custom/css/south-street/jquery-ui-1.8.23.custom.css">


<%@ include file="../common/header.jsp"%>
<div id="dialog-form" title="Create new Category">
	<form style="padding-top:20px;">
		<label for="categoryName">Category Name : </label>
		<input type="text" name="categoryName" id="categoryName" class="text ui-widget-content ui-corner-all" />
		<div style="margin-top:10px;color:red;font-style: italic;display:none" id="errorTip">Category name can not be empty!</div>
		<div style="margin-top:10px;color:green;font-weight:bold;display:none" id="successTip">Create Successfully!</div>
		<div style="margin-top:10px;color:red;font-style:italic;display:none" id="errorTip2">Some error happend. Please try again later.</div>
		<div style="margin-top:10px;color:red;font-style:italic;display:none" id="errorTip3">Category already exists.</div>
	</form>
</div>
<div class="mainContent">
	<div class="title">
		Make a Post
	</div>
	<div class="separateLine">
	</div>
	<form action="/editPost" method="post" onSubmit="return checkForm();">
		<div class="titleDiv">
			Title
		</div>
		<%
				if(session.getAttribute("currentUserId")==null||session.getAttribute("currentArticle")==null){
				}else{
					Entity article = (Entity)session.getAttribute("currentArticle");
					long categoryId = (Long)article.getProperty(Article.CATEGORY_ID);
			%>
		<div class="titleAndCategoryDiv">
			<input type="hidden" name="articleId" value="<%=article.getKey().getId()%>"/>
			<input type="hidden" name="date" value="<%=article.getProperty(Article.DATE)%>"/>
			<input type="text" name="title" size="40" class="titleInput" value="<%=article.getProperty(Article.TITLE) %>" style="margin-right:270px;"/>
			post it on
			
			<select class="category"  name="category" style="margin-left:10px;margin-right:40px;">
				<%
				
					
					List<Entity> categoryList = new CategoryFetcher().getAllCategoryByOwnerId((Long)session.getAttribute("currentUserId"));
					session.setAttribute("allCategoryList", categoryList);
					Iterator<Entity> itr = categoryList.iterator();
					while(itr.hasNext()){
						Entity category = itr.next();
					%>
						<option value="<%=category.getKey().getId()%>"
						<%
							if(category.getKey().getId()==categoryId) {
								%>
									selected
								<% 
							}
						%>
						><%=category.getProperty(Category.NAME) %></option>
					<%
					}
					
				%>
			
			</select>
			<a href="" class="createCategoryLink">Create Category</a>
		</div>
		<div class="errorTip1">
			Article's title can not be empty!
		</div>
		<div class="titleDiv">
			Content
		</div>
		<textarea id="contentEditor" name="content"  style="width:900px;height:350px;">
			 <%=HtmlSpecialCharsConvertor.htmlspecialchars(((Text)article.getProperty(Article.CONTENT)).getValue())%>
		</textarea>
		<input type="submit" value="Post" class="postButton" />
	</form>
	<button class="cancelButton">Cancel</button>
</div>
<script src="../js/jquery/jquery-ui-1.8.23.custom/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript">
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
					$.get(
						"/addCategory",
						{"categoryName":$.trim($("#categoryName").val())},
						function(data){
							if(data=="-2"){
								$("#errorTip3").css("display","block");
							}else{
								if(data=="-1"){
									$("#errorTip2").css("display","block");
								}else{
									$("#successTip").css("display","block");
									setTimeout(function () {
										
										$("<option value='"+data+"'>"+$.trim($("#categoryName").val())+"</option>").insertAfter($(".category").find("option:last"));
										$( "#dialog-form" ).dialog( "close" );
									}, 1000);
								}
								
							}
						}
					);
					
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
			$("#errorTip3").css("display","none");
		}
	});
	
</script>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
<%
	}
%>
