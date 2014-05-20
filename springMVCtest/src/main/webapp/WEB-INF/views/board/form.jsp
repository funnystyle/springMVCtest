<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<div class="ui-content" role="main">
		<h3>글쓰기</h3>
		<form:form commandName="board" action="/board"  method="POST" data-ajax="false">
		    <div class="ui-field-contain">
		    	<label for="title">제목 : </label>
				<form:input path="title" data-clear-btn="true" />
				<form:errors path="title" cssClass="errorblock"/>
			</div>
			<div class="ui-field-contain">	 
				<label for="contents">내용 : </label>
				<form:textarea path="contents"/>
				<form:errors path="contents" cssClass="errorblock"/>        
			</div>
			<div class="ui-grid-a">
				<div class="ui-block-a"><button type="submit" class="ui-btn ui-corner-all ui-shadow ui-icon-check ui-btn-icon-left">저장</button></div>
				<div class="ui-block-b"><a href="/board" class="ui-btn ui-corner-all ui-icon-bullets ui-btn-icon-right" data-ajax="false">목록</a></div> 
			</div>
		</form:form>
	</div>
