<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div data-role="header">
        <h1>EverydayChurch</h1>
        <a href="#nav-panel" data-icon="bars" data-iconpos="notext">Menu</a>
        <a href="/" data-icon="home" data-iconpos="notext">Add</a>
    </div><!-- /header -->
    
    <div data-role="panel" data-display="overlay" data-theme="b" id="nav-panel">
        <ul data-role="listview">
            <li data-icon="delete"><a href="#" data-rel="close">Close Menu</a></li>
			<li><a href="/login">로그인</a></li>
			<li><a href="/logout">로그아웃</a></li>
			<li><a href="/member">회원</a></li>
			<li><a href="/board">게시판</a></li>
        </ul>
    </div><!-- /panel -->
