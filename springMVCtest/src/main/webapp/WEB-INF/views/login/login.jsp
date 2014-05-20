<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
	
	<div class="ui-content" role="main">
		<h3>로그인</h3>
		<form class="userform" action="<c:url value='j_spring_security_check' />" method='POST' data-ajax="false">
			<c:if test="${not empty error}">
			<div class="errorblock">
<!-- 				Your login attempt was not successful, try again.<br /> -->
<%-- 				Caused : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} --%>
				아이디나 비밀번호가 올바르지 않습니다.
			</div>
			</c:if>
		    <div class="ui-field-contain">
	            <label for="name">아이디:</label>
	           	<input type="text" name="j_username" id="j_username" value="" data-clear-btn="true" />
			</div>
			<div class="ui-field-contain">	         
	            <label for="password">비밀번호:</label>
	           	<input type="password" name="j_password" id="j_password" value="" data-clear-btn="true" autocomplete="off" />
			</div>
			<button type="submit" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-inline ui-icon-check ui-btn-icon-left">로그인</button>
			<button type="reset" class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-btn-inline ui-icon-delete ui-btn-icon-left">취소</button>
		
		</form>
	</div>
