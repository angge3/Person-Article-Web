<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		margin-left:auto;
		margin-right:auto;
		width:100px;
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
</style>
<title>Read Full Article</title>
<link rel="stylesheet" href="../css/ui.totop.css" />
<link rel="stylesheet" href="../js/jquery/jquery-ui-1.8.23.custom/css/south-street/jquery-ui-1.8.23.custom.css">

<%@ include file="../common/header.jsp"%>
<div id="dialog-confirm" title="Delete this article?">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>This article will be permanently deleted and cannot be recovered. Are you sure?</p>
</div>
<div class="mainContent">
	<div class="title">Title</div>
	<div class="infoDiv">
		<span>Posted on : </span>
		<span class="postedTime">2011.09.07</span>
		<span style="margin-left:200px;">Category : </span>
		<span class="categorySpan"><a href="" class="categoryLink">Learning Notes</a></span>
		<a href="" class="editLink">edit</a>
		<a href="" class="deleteLink">delete</a>
	</div>
	<div class="separateLine"></div>
	<div class="fullArticleDiv">
			<p>昨天，国家发改委批复了全国多个城市的轨道交通建设规划，总投资规模预计超过8000亿。其中广州城市轨道交通近期建设规划调整方案投资最高，预计总投资为1241亿元。</p>

    <p>此次批复的内容涉及全国19个城市、两个地区和一条线路。太原、兰州、广州、沈阳、厦门、常州等6个城市的轨道交通近期建设规划获批，哈尔滨、上海等城市的近期建设规划调整方案获得批准，另外还有江苏省沿江城市群城际轨交网、内蒙古呼包鄂地区城际铁路规划等区域轨交铁路规划获批。</p>

    <p>广州城市轨道交通近期建设规划包括7条线路，合计总长度约228.9公里，设置车站数量92座，总投资居25条线路之首.</p>

   <p> 此前，国务院出台的《“十二五”综合交通运输体系规划》，要求今年要建成一批重大铁路项目，适时开工一批急需必需项目；温家宝总理也指出要确保今年铁路5000亿元的投资到位；《高端装备制造业“十二五”发展规划》，也明确提出要满足我国铁路快速客运网络、大运量货运通道和城市轨道交通建设。</p>

    <p>此次国家发改委密集批准城市轨道交通项目，有望进一步推升铁路、轨道交通建设的投入，相关设备和基建企业有望直接受益。（记者周宇）</p>
    <p>昨天，国家发改委批复了全国多个城市的轨道交通建设规划，总投资规模预计超过8000亿。其中广州城市轨道交通近期建设规划调整方案投资最高，预计总投资为1241亿元。</p>

    <p>此次批复的内容涉及全国19个城市、两个地区和一条线路。太原、兰州、广州、沈阳、厦门、常州等6个城市的轨道交通近期建设规划获批，哈尔滨、上海等城市的近期建设规划调整方案获得批准，另外还有江苏省沿江城市群城际轨交网、内蒙古呼包鄂地区城际铁路规划等区域轨交铁路规划获批。</p>

    <p>广州城市轨道交通近期建设规划包括7条线路，合计总长度约228.9公里，设置车站数量92座，总投资居25条线路之首.</p>

   <p> 此前，国务院出台的《“十二五”综合交通运输体系规划》，要求今年要建成一批重大铁路项目，适时开工一批急需必需项目；温家宝总理也指出要确保今年铁路5000亿元的投资到位；《高端装备制造业“十二五”发展规划》，也明确提出要满足我国铁路快速客运网络、大运量货运通道和城市轨道交通建设。</p>

    <p>此次国家发改委密集批准城市轨道交通项目，有望进一步推升铁路、轨道交通建设的投入，相关设备和基建企业有望直接受益。（记者周宇）</p>
    <p>昨天，国家发改委批复了全国多个城市的轨道交通建设规划，总投资规模预计超过8000亿。其中广州城市轨道交通近期建设规划调整方案投资最高，预计总投资为1241亿元。</p>

    <p>此次批复的内容涉及全国19个城市、两个地区和一条线路。太原、兰州、广州、沈阳、厦门、常州等6个城市的轨道交通近期建设规划获批，哈尔滨、上海等城市的近期建设规划调整方案获得批准，另外还有江苏省沿江城市群城际轨交网、内蒙古呼包鄂地区城际铁路规划等区域轨交铁路规划获批。</p>

    <p>广州城市轨道交通近期建设规划包括7条线路，合计总长度约228.9公里，设置车站数量92座，总投资居25条线路之首.</p>

   <p> 此前，国务院出台的《“十二五”综合交通运输体系规划》，要求今年要建成一批重大铁路项目，适时开工一批急需必需项目；温家宝总理也指出要确保今年铁路5000亿元的投资到位；《高端装备制造业“十二五”发展规划》，也明确提出要满足我国铁路快速客运网络、大运量货运通道和城市轨道交通建设。</p>

    <p>此次国家发改委密集批准城市轨道交通项目，有望进一步推升铁路、轨道交通建设的投入，相关设备和基建企业有望直接受益。（记者周宇）</p>
    <p>昨天，国家发改委批复了全国多个城市的轨道交通建设规划，总投资规模预计超过8000亿。其中广州城市轨道交通近期建设规划调整方案投资最高，预计总投资为1241亿元。</p>

    <p>此次批复的内容涉及全国19个城市、两个地区和一条线路。太原、兰州、广州、沈阳、厦门、常州等6个城市的轨道交通近期建设规划获批，哈尔滨、上海等城市的近期建设规划调整方案获得批准，另外还有江苏省沿江城市群城际轨交网、内蒙古呼包鄂地区城际铁路规划等区域轨交铁路规划获批。</p>

    <p>广州城市轨道交通近期建设规划包括7条线路，合计总长度约228.9公里，设置车站数量92座，总投资居25条线路之首.</p>

   <p> 此前，国务院出台的《“十二五”综合交通运输体系规划》，要求今年要建成一批重大铁路项目，适时开工一批急需必需项目；温家宝总理也指出要确保今年铁路5000亿元的投资到位；《高端装备制造业“十二五”发展规划》，也明确提出要满足我国铁路快速客运网络、大运量货运通道和城市轨道交通建设。</p>

    <p>此次国家发改委密集批准城市轨道交通项目，有望进一步推升铁路、轨道交通建设的投入，相关设备和基建企业有望直接受益。（记者周宇）</p>
	</div>
	<div class="priorAndNextDiv">
		<a href="" class="priorLink">prior</a>
		<a href="" class="nextLink">next</a>
	</div>
</div>
<script src="../js/jquery.ui.totop.js" type="text/javascript"></script>
<script src="../js/jquery/jquery-ui-1.8.23.custom/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript">
	$(function(){
	    $().UItoTop({ easingType: 'easeOutQuart' });
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
		return false;
	});

</script>
</div>
</body>
</html>