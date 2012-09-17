<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.appspot.angge3.model.*"%>
<%@page import="com.appspot.angge3.business.*"%>
<%@page import="com.appspot.angge3.dao.*"%>
<%@page import="com.appspot.angge3.util.*"%>
<%@page import="com.google.appengine.api.datastore.Text"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.appengine.api.datastore.Entity" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.articleDigestDiv{
		margin-bottom:15px;
	}
	.title{
		font-size:20px;
		font-weight:bold;
		margin-bottom:5px;
	}
	.titleSpan{
		font-size:18px;
		font-weight:bold;
	}
	.mainContent{
		margin-top:10px;
	}
	.categorySpan{
		float:right;
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
	.categoryLink{
		width:100px;
		display:inline-block;
	}
	.readFullDiv{
		margin-top:20px;
	}
	.editAndDeleteDiv{
		margin-left:700px;
	}
	.editLink{
		margin-right:30px;
	}
	.articleDigestDiv{
		background-color:#fff;
		padding:20px 20px;
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
	.readFullLink:link,.readFullLink:visited{
		color:#459E00;
	}
	.readFullLink:hover{
		color:#67B021;
	}
	.readFullLink:active{
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
	.empty{
		color:green;
		font-size:20px;
		display:none;
	}
	#dialog-confirm{
		display:none;
	}
</style>

<title>All Posts</title>
<script type="text/javascript" src="../js/jquery/jquery-1.8.0.min.js"></script>
<link rel="stylesheet" href="../css/ui.totop.css" />
<script type="text/javascript" src="../syntaxhighlighter/scripts/shCore.js"></script>
<script type="text/javascript" src="../syntaxhighlighter/scripts/shBrushJScript.js"></script>
<script type="text/javascript" src="../syntaxhighlighter/scripts/shBrushJava.js"></script>
<script type="text/javascript" src="../syntaxhighlighter/scripts/shBrushCpp.js"></script>
<link type="text/css" rel="stylesheet" href="../syntaxhighlighter/styles/shCoreDefault.css"/>

<script type="text/javascript">
	$(function(){
		  $(".lavaLamp li").removeClass("current");
		  $(".lavaLamp li:eq(0)").addClass("current");
		  $("pre").addClass("toolbar:false");
	});
	SyntaxHighlighter.all();
</script>
<link rel="stylesheet" href="../js/jquery/jquery-ui-1.8.23.custom/css/south-street/jquery-ui-1.8.23.custom.css">

<%@ include file="../common/header.jsp"%>
<div id="dialog-confirm" title="Delete this article?">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>This article will be permanently deleted and cannot be recovered. Are you sure?</p>
</div>
<div class="mainContent">
	<div class="title">
		All Posts
	</div>
	<%
		long ownerId = 0L;
		if(session.getAttribute("currentUserId")!=null){	
			 ownerId = (Long)session.getAttribute("currentUserId");
		}
		int pages = 1;
		int limitNum = 20;
		if(request.getParameter("page")!=null){
			pages = Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("limitNum")!=null){
			limitNum = Integer.parseInt(request.getParameter("limitNum"));
		}
		ArticleFetcher fetcher = new ArticleFetcher();
		List<Entity> articleList = fetcher.getArticlesByOwnerId(ownerId, (pages-1)*limitNum, limitNum);

		Iterator<Entity> iterator = articleList.iterator();
		while(iterator.hasNext()){
			Entity article = iterator.next();
          	long articleId = article.getKey().getId();
			%>
				<div class="articleDigestDiv">
		            <div class="titleAndCategoryDiv">
			          <span class="titleSpan" id="3"><%=article.getProperty(Article.TITLE) %></span>
			          <%
			          	long categoryId= (Long)article.getProperty(Article.CATEGORY_ID);
			          	CategoryFetcher fetcher2 = new CategoryFetcher();
			          	String categoryName = fetcher2.getNameById(categoryId);
			          %>
			          <span class="categorySpan">Category : <a href="./postsByCategory.jsp?categoryId=<%=categoryId%>&categoryName=<%=categoryName%>" class="categoryLink"><%=categoryName %></a></span>
		            </div>
		            <div class="contentDiv">
		              <%
		              		String content = ((Text)article.getProperty(Article.CONTENT)).getValue();
		              		String digest = "";
		              		boolean full = false;
		              		if(content.length()<=1000){
		              			full = true;
		              			digest = content;
		              		}else{
		              			digest = content.substring(0,1000);
		              			digest = DigestConvertor.completeDigest(digest);
			              		digest+="\n&nbsp;&nbsp;&nbsp;&nbsp;. . .";
		              		}
		              		
		              %>
			          <%=digest %>
			          <%
			          	if(!full){
			          %>
			          <div></div>
		               <div class="readFullDiv"><a href="/readFullArticle?articleId=<%=articleId %>" class="readFullLink">read full article</a></div>
		              <%
			          	}
		              %> 
		              
		               <div class="editAndDeleteDiv" id="<%=articleId%>"><a href="" class="editLink">edit</a><a href="" class="deleteLink">delete</a></div>
		            </div>
	           </div>
			<%
		}
	%>
	 <div class="empty">
	 	You have not written any articles.
	 </div>
	 <a id="next" href="../post/allPosts.jsp?page=2&limitNum=20"></a>
	
	

	
</div>
<script type="text/javascript" src="../js/jquery.infinitescroll.js"></script>
<script src="../js/jquery.ui.totop.js" type="text/javascript"></script>
<script src="../js/jquery/jquery-ui-1.8.23.custom/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript">
	$(function(){
	
	    $('.mainContent').infinitescroll({
	      navSelector  : "a#next",            
	      nextSelector : "a#next",   
	      itemSelector : ".articleDigestDiv",
	    });
	    $().UItoTop({ easingType: 'easeOutQuart' });
	  	if($(".articleDigestDiv").length==0){
	  		$(".empty").css("display","block");
	  	}
	  	
	  	$('.editLink').on("click",function(){
	  		var articleId = $($(this).parent()).attr("id");
	  		window.location="/editPost?articleId="+articleId;
	  		return false;
	  	});
	  	
		$('.deleteLink').on("click",function(){
	  		var articleId = $($(this).parent()).attr("id");
	  		var tempDiv = $(this);
	  		$( "#dialog-confirm" ).dialog({
				resizable: false,
				height:180,
				modal: true,
				buttons: {
					"Delete": function() {
						$.get(
					  			"/deleteArticle",
					  			{"articleId":articleId},
					  			function(data){
					  				
					  				$($(tempDiv).parent().parent().parent()).remove();
					  				if($(".articleDigestDiv").length==0){
					  			  		$(".empty").css("display","block");
					  			  	}
					  			}
					  	);
						$( this ).dialog( "close" );
					},
					Cancel: function() {
						$( this ).dialog( "close" );
					}
				}
			});
	  		return false;
	  	});
	  	
	});
</script>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>