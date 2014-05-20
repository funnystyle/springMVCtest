<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/"><span class="glyphicon glyphicon-home"></span> 매일교회</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="/board"><span class="glyphicon glyphicon-pencil"></span> 게시판</a></li>
				</ul>   
				<ul class="nav navbar-nav navbar-right">
					<sec:authorize access="isAuthenticated()"> 
						<sec:authentication var="username" property="principal.username" />
						<li><a href="/member/${username}"><span class="glyphicon glyphicon-user"></span> ${username}</a></li>
						<li><a href="<c:url value='j_spring_security_logout' />"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
					</sec:authorize>	
					<sec:authorize access="!isAuthenticated()"> 			
						<li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
					</sec:authorize>          
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div>