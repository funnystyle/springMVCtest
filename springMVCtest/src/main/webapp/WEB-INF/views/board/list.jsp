<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script type="text/javascript">
		var currentPage = 1;
		//var loader =$('<tr class="hmedia-loading-tr"><td colspan=7><div class="hmedia-wrapper"><div class="hmedia-Loading"></div></div></td></tr>');
		
		$(document).ready(function() {
			$("#nextJsonList").click(function() {	
				getJsonData("/board.json?page=" + currentPage, "#dataTemplate", "#listBody");
				currentPage++;
			}).trigger("click");
		});
	</script>

	<div class="ui-content" role="main">
		<h3>리스트</h3>
	
		<ul id="listBody" data-role="listview" data-inset="true" >
			<li id="nextJsonList" data-theme="d"><a href="#" class="ui-btn ui-icon-plus ui-btn-icon-right">더보기...</a></li>
		</ul>
		
		<script id="dataTemplate" type="text/x-jquery-tmpl">
			<li><a href="/board/\${seq}"><h2>\${title}</h2>
				<p>\${id}</p>
				<p class="ui-li-count">\${getDate(created, "yyyy-MM-dd hh:mm")}</p></a>
			</li>
		</script>
		
		<div class="ui-grid-a">
			<div class="ui-block-a"><a href="/board/form" class="ui-btn ui-corner-all ui-icon-edit ui-btn-icon-left" data-ajax="false">글쓰기</a></div>
		</div>
	</div>
