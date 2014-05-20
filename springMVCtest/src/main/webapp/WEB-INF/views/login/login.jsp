<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

	<!-- Custom styles for this template -->
	<link href="/lib/bootstrap-3.1.1/custom/signin.css" rel="stylesheet">

	<div class="container">
		<form class="form-signin" action="<c:url value='j_spring_security_check' />" method='POST'>
			<c:if test="${not empty error}">
			<div class="errorblock">
<!-- 				Your login attempt was not successful, try again.<br /> -->
<%-- 				Caused : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message} --%>
				아이디나 비밀번호가 올바르지 않습니다.
			</div>
			</c:if>
			<h2 class="form-signin-heading">로그인</h2>
			<input type="text" name="j_username" id="j_username" class="form-control" placeholder="아이디" required autofocus>
			<input type="password" name="j_password" id="j_password" class="form-control" placeholder="비밀번호" required>
<!--         <label class="checkbox"> -->
<!--           <input type="checkbox" value="remember-me"> Remember me -->
<!--         </label> -->
			<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
		</form>
	</div> <!-- /container -->