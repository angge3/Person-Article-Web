<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.appspot.angge3.model.*"%>
<%@page import="com.appspot.angge3.business.*"%>
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
</style>

<title>All Posts</title>
<script type="text/javascript" src="../js/jquery/jquery-1.8.0.min.js"></script>
<link rel="stylesheet" href="../css/ui.totop.css" />
<script type="text/javascript">
	$(function(){
		  $(".lavaLamp li").removeClass("current");
		  $(".lavaLamp li:eq(0)").addClass("current");
	});
</script>
<%@ include file="../common/header.jsp"%>
<div class="mainContent">
	<div class="title">
		All Posts
	</div>
	<%
		List<Entity> articleList = (List<Entity>)session.getAttribute("postsList");
		Iterator<Entity> iterator = articleList.iterator();
		while(iterator.hasNext()){
			Entity article = iterator.next();
			%>
				<div class="articleDigestDiv">
		            <div class="titleAndCategoryDiv">
			          <span class="titleSpan" id="3"><%=article.getProperty(Article.TITLE) %></span>
			          <%
			          	/*long categoryId= (Long)article.getProperty(Article.CATEGORY_ID);
			          	CategoryFetcher fetcher = new CategoryFetcher();
			          	String categoryName = fetcher.getNameById(categoryId);*/
			          %>
			          <span class="categorySpan">Category : <a href="" class="categoryLink">w</a></span>
		            </div>
		            <div class="contentDiv">
			          <%=article.getProperty(Article.CONTENT) %>
		               <div class="readFullDiv"><a href="" class="readFullLink">read full article</a></div>
		               <div class="editAndDeleteDiv"><a href="" class="editLink">edit</a><a href="" class="deleteLink">delete</a></div>
		            </div>
	           </div>
			<%
		}
	%>

	 <a id="next" href="/allPost?page=2&limitNum=20">next page?</a>
	
	

	
</div>
<script type="text/javascript" src="../js/jquery.infinitescroll.js"></script>
<script src="../js/jquery.ui.totop.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
	
	    $('.mainContent').infinitescroll({
	      navSelector  : "a#next",            
	      nextSelector : "a#next",   
	      itemSelector : ".articleDigestDiv",
	    });
	    $().UItoTop({ easingType: 'easeOutQuart' });
	  
	});
</script>
</div>
</body>
</html>