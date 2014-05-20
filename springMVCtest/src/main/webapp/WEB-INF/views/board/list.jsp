<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<!-- Custom styles for this template -->
	<link href="/lib/bootstrap-3.1.1/custom/dashboard.css" rel="stylesheet">
	
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

	<div class="container">
		<h2 class="sub-header">게시판</h2>

		<div class="panel panel-default">
			<div class="list-group" id="listBody">
			</div>
			<div class="panel-footer text-center" id="nextJsonList" style="cursor:pointer;">
				더보기...
			</div>
		</div>
				
		<script id="dataTemplate" type="text/x-jquery-tmpl">
		  		<a href="/board/\${seq}" class="list-group-item">
					<span class="badge">\${getDate(created, "yyyy-MM-dd hh:mm")}</span>
		    		<h4 class="list-group-item-heading">\${title}</h4>
    				<p class="list-group-item-text">\${id}</p>
  				</a>
		</script>
		
		<div class="btn_group text-center">
			<a href="/board/form" class="btn btn-default text-center"><span class="glyphicon glyphicon-pencil"></span> 글쓰기</a>
		</div>

	</div>
