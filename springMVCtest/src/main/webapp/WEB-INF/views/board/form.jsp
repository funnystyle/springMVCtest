<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<div class="container">
		<div class="page-header">
			<h1>글쓰기</h1> 
		</div>
		
		<form:form class="form-horizontal" role="form" commandName="board" action="/board"  method="POST">
			<div class="form-group">
				<label for="title" class="col-sm-2 control-label">제목</label>
				<div class="col-sm-10">
					<form:input path="title" class="form-control" placeholder="제목"/>
					<form:errors path="title" cssClass="errorblock"/>
				</div>
			</div>
			<div class="form-group">
				<label for="contents" class="col-sm-2 control-label">내용</label>
				<div class="col-sm-10">
					<form:textarea path="contents" class="form-control" placeholder="내용" row="5"/>
					<form:errors path="contents" cssClass="errorblock"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-ok"></span> 저장</button>
					<a href="/board" class="btn btn-default"><span class="glyphicon glyphicon-list"></span> 목록</a>
				</div>
			</div>			
		</form:form>
	</div>
