<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.google.appengine.api.datastore.Entity" %>
 <%@ page import="com.appspot.angge3.model.*" %>
  <%@ page import="com.appspot.angge3.business.*" %>
 <%@ page import="java.util.*" %>
 <%@ page import="java.text.*" %>
 <%@page import="com.google.appengine.api.datastore.Text" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.mainContent{
		margin-top:30px;
		background-color:#fff;
		padding:30px;
	}
	.title{
		font-size:20px;
		font-weight:bold;
		margin-bottom:10px;
	}
	.postedTime{
		color:green;
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
	.categoryLink:link,.categoryLink:visited{
		color:#459E00;
	}
	.categoryLink:hover{
		color:#67B021;
	}
	.categoryLink:active{
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
	.categorySpan{
		margin-right:250px;
	}
	.editLink{
		margin-right:20px;
	}
	.infoDiv{
		margin-bottom:10px;
	}
	.separateLine{
		border-top:1px solid green;
		margin-bottom:10px;
	}
	.priorAndNextDiv{
		float:right;
		margin-bottom:50px;"
	}
	.nextLink{
		margin-right:50px;
		margin-left:20px;
	}
	.priorLink:link,.priorLink:visited{
		color:#459E00;
	}
	.priorLink:hover{
		color:#67B021;
	}
	.priorLink:active{
		color:#459E00;
	}
	.nextLink:link,.nextLink:visited{
		color:#459E00;
	}
	.nextLink:hover{
		color:#67B021;
	}
	.nextLink:active{
		color:#459E00;
	}
	#dialog-confirm{
		display:none;
	}
	.titleDiv{
		margin-left:auto;
		margin-right:auto;
		width:850px;
		text-align:center;
	}
</style>
<title>Read Full Article</title>
<link rel="stylesheet" href="../css/ui.totop.css" />
<link rel="stylesheet" href="../js/jquery/jquery-ui-1.8.23.custom/css/south-street/jquery-ui-1.8.23.custom.css">
<script type="text/javascript" src="../syntaxhighlighter/scripts/shCore.js"></script>
<script type="text/javascript" src="../syntaxhighlighter/scripts/shBrushJScript.js"></script>
<script type="text/javascript" src="../syntaxhighlighter/scripts/shBrushJava.js"></script>
<script type="text/javascript" src="../syntaxhighlighter/scripts/shBrushCpp.js"></script>
<link type="text/css" rel="stylesheet" href="../syntaxhighlighter/styles/shCoreDefault.css"/>
<%@ include file="../common/header.jsp"%>
<div id="dialog-confirm" title="Delete this article?">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>This article will be permanently deleted and cannot be recovered. Are you sure?</p>
</div>
<%
	if(session.getAttribute("article")==null){
		response.sendRedirect("./allPosts.jsp");
	}else{
	Entity article = (Entity)session.getAttribute("article");
%>
<div class="mainContent">
	<div class="titleDiv">
	<div class="title"><%=article.getProperty(Article.TITLE) %></div>
	</div>
	<div class="infoDiv">
		<span>Posted on : </span>
		<%
			Date date = (Date)article.getProperty(Article.DATE);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			long categoryId = (Long)article.getProperty(Article.CATEGORY_ID);
			String categoryName = new CategoryFetcher().getNameById(categoryId);
		%>
		<span class="postedTime"><%=sdf.format(date) %></span>
		<span style="margin-left:160px;">Category : </span>
		<span class="categorySpan"><a href="./postsByCategory.jsp?categoryId=<%=categoryId%>&categoryName=<%=categoryName%>" class="categoryLink"><%=categoryName%></a></span>
		<a href="/editPost?articleId=<%=article.getKey().getId() %>" class="editLink">edit</a>
		<a href="" class="deleteLink">delete</a>
	</div>
	<div class="separateLine"></div>
	<div class="fullArticleDiv">
			<%=((Text)article.getProperty(Article.CONTENT)).getValue() %>
	</div>
	<div class="priorAndNextDiv">
		<%
			if(session.getAttribute("priorArticle")!=null){
				Entity priorArticle = (Entity)session.getAttribute("priorArticle");
				session.removeAttribute("priorArticle");
		%>
				<a href="/readFullArticle?articleId=<%=priorArticle.getKey().getId() %>" class="priorLink">prior</a>
		<%
			}
		%>
		<%
			if(session.getAttribute("nextArticle")!=null){
				Entity nextArticle = (Entity)session.getAttribute("nextArticle");
				session.removeAttribute("nextArticle");
		%>
			<a href="/readFullArticle?articleId=<%=nextArticle.getKey().getId() %>" class="nextLink">next</a>
		<%
			}
		%>
	</div>
</div>
<script src="../js/jquery.ui.totop.js" type="text/javascript"></script>
<script src="../js/jquery/jquery-ui-1.8.23.custom/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript">
	$(function(){
	    $().UItoTop({ easingType: 'easeOutQuart' });
	    $("pre").addClass("toolbar:false");
		SyntaxHighlighter.all();
	});
	$(".deleteLink").on("click",function(){
		$( "#dialog-confirm" ).dialog({
			resizable: false,
			height:180,
			modal: true,
			buttons: {
				"Delete": function() {
					$.get(
							"/deleteArticle",
							{"articleId":<%=article.getKey().getId()%>},
							function(data){
								$( this ).dialog( "close" );
								if(data=="1"){
									window.location="./allPosts.jsp";
								}else{
									alert("Delete article error.Please try again later.");
								}
							}
					);
					
				},
				Cancel: function() {
					$( this ).dialog( "close" );
				}
			}
		});
		return false;
	});

</script>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>
<%
	}
%>