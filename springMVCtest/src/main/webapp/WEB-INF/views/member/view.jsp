<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member ${member.name}</title>


<script type="text/javascript" src="/lib/jquery/jquery-1.10.2.min.js"></script>

<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
<script type="text/javascript" src="/lib/common/common.js"></script>
<script type="text/javascript">
	//var currentPage = 1;
	
	$(document).ready(function() {
		getJsonData("/member/${id}.json", "#dataTemplate", "#tableBody");
	});

</script>
</head>
<body>

<a href="/member">List</a>

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
</tbody>
</table>
	
</body>
</html>