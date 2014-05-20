<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<script>
	$(document).ready(function() {
		var curUrl = '${nav_url}' || window.location.pathname;

		$("ul.nav li a").each(function(){
			if($(this).attr("href") == curUrl){		
				$(this).closest("li").addClass("active");					
			}				
		});		
	});
    </script>	