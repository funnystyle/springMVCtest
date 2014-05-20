<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

	<style id="combined-heading-and-section">
		.custom-corners .ui-bar {
			-webkit-border-top-left-radius: inherit;
			border-top-left-radius: inherit;
			-webkit-border-top-right-radius: inherit;
			border-top-right-radius: inherit;
		}
		
		.custom-corners .ui-foot {
			border-top-width: 0;
			-webkit-border-top-left-radius: 0;
			border-top-left-radius: 0;
			-webkit-border-top-right-radius: 0;
			border-top-right-radius: 0;
			-webkit-border-bottom-left-radius: inherit;
			border-bottom-left-radius: inherit;
			-webkit-border-bottom-right-radius: inherit;
			border-bottom-right-radius: inherit;
		}
	</style>

	<script type="text/javascript">
		$(document).ready(function() {
			getJsonData("/board/${seq}.json", "#dataTemplate", "#templateBody");
		});
	</script>

<div id="templateBody" class="ui-content" role="main">
</div>

	<script id="dataTemplate" type="text/x-jquery-tmpl">
	<div class="ui-corner-all custom-corners" >
		<div class="ui-bar ui-bar-a">
			<h3>\${title}</h3>
			<p class="ui-li-count">\${id}</p>
		</div>
		<div class="ui-body ui-body-a">
			<p>\${contents}</p>
		</div>
		<div class="ui-bar ui-foot ui-bar-a">
			<small>
				\${getDate(created, "yyyy-MM-dd hh:mm")} 작성
				{{if created != modified }}
					 / \${getDate(modified, "yyyy-MM-dd hh:mm")} 최종수정
				{{/if}}
			</small>
		</div>
	</div>
	<div class="ui-grid-b">
		<div class="ui-block-a"><a href="/board/\${seq}/form" class="ui-btn ui-corner-all ui-icon-edit ui-btn-icon-left">수정</a></div>
		<div class="ui-block-b"><a href="javascript:ajaxDelete('/board/' + \${seq} + '.json', '/board')" class="ui-btn ui-corner-all ui-icon-delete ui-btn-icon-left">삭제</a></div>
		<div class="ui-block-c"><a href="/board" class="ui-btn ui-corner-all ui-icon-bullets ui-btn-icon-right">목록</a></div>
	</div>
	</script>
</body>
</html>