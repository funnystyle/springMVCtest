<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<META http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>Upload Example</title>
<script src="/lib/jquery/jquery-1.10.2.min.js"></script>
<script src="/lib/jQuery.AjaxFileUpload.js-master/jquery.ajaxfileupload.js"></script>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
<script>
$(document).ready(function () {
	$('#file').ajaxfileupload({
		'action': '/fileUpload',
		'onComplete': function(json, data){
			if(json.success) {
				$.tmpl($("#fileinfo"), json.fileinfo).appendTo("#filelist"); // preview img
				$.tmpl($("#fileinput"), json.fileinfo).appendTo("#uploadForm"); // make hidden fields
				$("#file").val("");
			} else {
				alert("error");
			}
		}
	});
});
</script>
<link rel="stylesheet" href="/lib/jquery.mobile-1.4.0/jquery.mobile-1.4.0.css" type="text/css" />
<style>
	.error {
		color: #ff0000;
	}
</style>
</head>
<body>
<form id="uploadForm" action="/fileUpload/test"  method="POST">

file upload : <input type="file" name="file" id="file"/>
<input type="submit" />
</form>

<div id="filelist"></div>
<script id="fileinfo" type="text/x-jquery-tmpl">
	<span>
		<img src="\${filepath}/\${filename}" width="150px"/>
	</span>
</script>

<script id="fileinput" type="text/x-jquery-tmpl">
	<input type="hidden" name="fileinput" value="\${filepath}/\${filename}"/>
</script>

</body>
</html>