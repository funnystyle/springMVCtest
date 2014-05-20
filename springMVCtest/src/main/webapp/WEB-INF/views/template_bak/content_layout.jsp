<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>매일교회</title>
	<link rel="stylesheet" href="/lib/jquery.mobile-1.4.0/jquery.mobile-1.4.0.css" type="text/css" />
	
<!-- 	<link rel="stylesheet"  href="http://demos.jquerymobile.com/1.3.2/css/themes/default/jquery.mobile-1.3.2.min.css"> -->
	<style>
		.errorblock {
			color: #ff0000;
			background-color: #ffEEEE;
			border: 3px solid #ff0000;
			padding: 8px;
			margin: 16px;
		}
	</style>
	
	<script type="text/javascript" src="/lib/jquery/jquery-1.10.2.min.js"></script>
	<script type="text/javascript">
		$(document).bind("mobileinit", function () {
    		$.mobile.ajaxEnabled = false;
		});
	</script>
	<script src="/lib/jquery.mobile-1.4.0/jquery.mobile-1.4.0.min.js"></script>
<!-- 	<script src="http://demos.jquerymobile.com/1.3.2/js/jquery.mobile-1.3.2.min.js"></script> -->
	<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
	<script src="/lib/jQuery.dotdotdot-master/src/js/jquery.dotdotdot.min.js"></script>
	<script type="text/javascript" src="/lib/common/common.js"></script>
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
</body>
</html>