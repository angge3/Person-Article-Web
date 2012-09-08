<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%@ include file="../common/header.jsp"%>
<div class="mainContent">
	<div class="title">
		All Posts
	</div>
	<div class="articleDigestDiv">
		<div class="titleAndCategoryDiv">
			<span class="titleSpan" id="3">Title</span>
			<span class="categorySpan">Category : <a href="" class="categoryLink">Learning Notes</a></span>
		</div>
		<div class="contentDiv">
			<p>昨天，国家发改委批复了全国多个城市的轨道交通建设规划，总投资规模预计超过8000亿。其中广州城市轨道交通近期建设规划调整方案投资最高，预计总投资为1241亿元。</p>

    <p>此次批复的内容涉及全国19个城市、两个地区和一条线路。太原、兰州、广州、沈阳、厦门、常州等6个城市的轨道交通近期建设规划获批，哈尔滨、上海等城市的近期建设规划调整方案获得批准，另外还有江苏省沿江城市群城际轨交网、内蒙古呼包鄂地区城际铁路规划等区域轨交铁路规划获批。</p>

    <p>广州城市轨道交通近期建设规划包括7条线路，合计总长度约228.9公里，设置车站数量92座，总投资居25条线路之首.</p>

   <p> 此前，国务院出台的《“十二五”综合交通运输体系规划》，要求今年要建成一批重大铁路项目，适时开工一批急需必需项目；温家宝总理也指出要确保今年铁路5000亿元的投资到位；《高端装备制造业“十二五”发展规划》，也明确提出要满足我国铁路快速客运网络、大运量货运通道和城市轨道交通建设。</p>

    <p>此次国家发改委密集批准城市轨道交通项目，有望进一步推升铁路、轨道交通建设的投入，相关设备和基建企业有望直接受益。（记者周宇）</p>
		<div class="readFullDiv"><a href="" class="readFullLink">read full article</a></div>
		<div class="editAndDeleteDiv"><a href="" class="editLink">edit</a><a href="" class="deleteLink">delete</a></div>
		</div>
	</div>
	 <a id="next" href="post2.jsp">next page?</a>
	
	

	
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