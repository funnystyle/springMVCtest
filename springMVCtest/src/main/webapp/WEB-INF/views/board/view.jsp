<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

	<script type="text/javascript">
		$(document).ready(function() {
			getJsonData("/board/${seq}.json", "#dataTemplate", "#templateBody");
		});
	</script>

	<div class="container" id="templateBody">
	</div>
	<script id="dataTemplate" type="text/x-jquery-tmpl">
		<div class="page-header">
		<h1>\${title}</h1> 
			<p class="text-right">
				\${id} /
				\${getDate(created, "yyyy-MM-dd hh:mm")} 작성
				{{if created != modified }}
				/ \${getDate(modified, "yyyy-MM-dd hh:mm")} 최종수정
				{{/if}}
			</p>	
		</div>

		<div class="panel panel-default">
			<div class="panel-body">
				{{html contents}}
			</div>
		</div>

		<div class="btn_group text-center">
			<a href="/board/\${seq}/form" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span> 수정</a>
			<a href="javascript:ajaxDelete('/board/' + \${seq} + '.json', '/board')" class="btn btn-default"><span class="glyphicon glyphicon-trash"></span> 삭제</a>
			<a href="/board" class="btn btn-default"><span class="glyphicon glyphicon-list"></span> 목록</a>
		</div>
	</script>