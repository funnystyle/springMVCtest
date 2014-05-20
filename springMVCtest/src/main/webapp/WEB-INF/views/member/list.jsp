<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var currentPage = 1;
	//var loader =$('<tr class="hmedia-loading-tr"><td colspan=7><div class="hmedia-wrapper"><div class="hmedia-Loading"></div></div></td></tr>');
	
	$(document).ready(function() {
		getJsonData("/member.json", "#dataTemplate", "#tableBody");
		currentPage++;
		
		$("#nextJsonList").click(function() {	
			getJsonData("/member.json?page=" + currentPage, "#dataTemplate", "#tableBody");
			currentPage++;
		});
	});
</script>

<div class="ui-content" role="main">
<a href="/member/form" data-ajax="false">Add</a>
<h2>Member List</h2>

<table border=1>
<thead>
<tr>
	<th>seq</th>
	<th>아이디</th>
	<th>비밀번호</th>
	<th>이름</th>
	<th>생년월일</th>
	<th>이메일</th>
	<th>핸드폰</th>
	<th>성별</th>
	<th>생성일</th>
	<th>수정일</th>
	<th>사용여부</th>
	<th>수정</th>
	<th>삭제</th>
</tr>
</thead>
<tbody id="tableBody">
</tbody>
</table>

<script id="dataTemplate" type="text/x-jquery-tmpl">
<tr>
	<td>\${seq}</td>
	<td>\${id}</td>
	<td>\${password}</td>
	<td><a href="/member/\${seq}">\${name}</a></td>
	<td>\${getDate(birthday, "yyyy-MM-dd")}</td>
	<td>\${email}</td>
	<td>\${mobilephone_1}-\${mobilephone_2}-\${mobilephone_3}</td>
	<td>\${sex}</td>
	<td>\${getDate(created, "yyyy-MM-dd hh:mm")}</td>
	<td>\${getDate(modified, "yyyy-MM-dd hh:mm")}</td>
	<td>\${enabled}</td>
	<td><a href="/member/\${seq}/form">수정</a></td>
	<td><a href="javascript:ajaxDelete('/member/' + \${seq} + '.json', '/member')">삭제</a></td>
</tr>
</script>

<a id="nextJsonList" href="javascript:void(0);">더보기</a>
</div>