<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	<link href="/lib/froala_editor_1.1.5/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="/lib/froala_editor_1.1.5/css/froala_editor.min.css" rel="stylesheet" type="text/css">
	
	<div class="container">
		<div class="page-header">
			<h1>글수정</h1> 
		</div>
		
		<form:form class="form-horizontal" role="form" id="form" commandName="board" action="/board/${seq}"  method="PUT" >
			<div class="form-group">
				<label for="title" class="col-sm-1 control-label">제목</label>
				<div class="col-sm-10">
					<form:input path="title" class="form-control" placeholder="제목"/>
					<form:errors path="title" cssClass="errorblock"/>

				</div>
			</div>
			<div class="form-group">
				<label for="contents" class="col-sm-1 control-label">내용</label>
				<div class="col-sm-10">
					<div id='edit'></div>
					<form:textarea path="contents" id="contents" class="form-control" placeholder="내용" style="display:none;"/>
					<form:errors path="contents" cssClass="errorblock"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-1 col-sm-10">
					<button type="submit" id="submit" class="btn btn-default"><span class="glyphicon glyphicon-ok"></span> 저장</button>
					<a href="/board" class="btn btn-default"><span class="glyphicon glyphicon-list"></span> 목록</a>
				</div>
			</div>			
		</form:form>
		
<!-- 		<script src="http://code.jquery.com/jquery-1.10.2.js"></script> -->
		<script src="/lib/froala_editor_1.1.5/js/froala_editor.min.js"></script>
		<script src='/lib/froala_editor_1.1.5/js/langs/ko.js'></script>
		
		<script>
			$(function(){
				$('#edit').editable({
        		  inlineMode: false, 
        		  language: "ko", 
	        	  placeholder : "내용을 입력하세요",
	        	  height : 300,
	        	  borderColor: "#CCC",
	        	  typingTimer: 10000,
				});
				
				$("#form").submit(function() {
					if ($("#edit").editable("getText") != "") {
						$("#contents").val($("#edit").editable("getHTML"));
					}
				});
				
				if ($("#contents").val() != "") {
					$('#edit').editable("setHTML", $("#contents").val(), false);
				}
			});
		</script>
	</div>
	