<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- Custom styles for this template -->
	<link href="/lib/bootstrap-3.1.1/custom/sticky-footer-navbar.css" rel="stylesheet">

	<br/>
	
    <div id="footer">
      <div class="container">
        <p class="text-muted text-center">기독교 대한감리회 매일교회</p>
      </div>
    </div>
    
	<script>
	// nav menu setting
	$(document).ready(function() {
		var curUrl = '${nav_url}' || window.location.pathname;

		$("ul.nav li a").each(function(){
			if($(this).attr("href") == curUrl){		
				$(this).closest("li").addClass("active");					
			}				
		});		
	});
    </script>	