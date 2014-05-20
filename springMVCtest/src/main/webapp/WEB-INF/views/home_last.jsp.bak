<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
	<link rel="stylesheet" type="text/css" href="http://sorgalla.com/jcarousel/examples/_shared/css/style.css">
	<link rel="stylesheet" type="text/css" href="http://sorgalla.com/jcarousel/examples/responsive/jcarousel.responsive.css">
	
	<style type="text/css">
		.calendar th, .calendar td { text-align:center;}
		.saturday { color:blue; }
		.sunday { color:red; }
		.not_this_month_day { color:gray; }
	</style>
	
	<script type="text/javascript" src="http://sorgalla.com/jcarousel/dist/jquery.jcarousel.min.js"></script>
	<script type="text/javascript" src="http://labs.rampinteractive.co.uk/touchSwipe/jquery.touchSwipe.min.js"></script>

	
	<script>
		var json = [
// 			{ slideId : "slide1", imageUrl : "/resources/20140105_153353.jpg"},
// 			{ slideId : "slide2", imageUrl : "/resources/2014년도_달력용_매일교회_로고.png"},
// 			{ slideId : "slide3", imageUrl : "/resources/everychurch_logo_english.png"},
// 			{ slideId : "slide4", imageUrl : "/resources/N301.jpg"},
			{ slideId : "slide5", imageUrl : "http://placehold.it/350x150&text=FooBar5"},
			{ slideId : "slide6", imageUrl : "http://placehold.it/350x150&text=FooBar6"},
			{ slideId : "slide7", imageUrl : "http://placehold.it/350x150&text=FooBar7"},
			{ slideId : "slide8", imageUrl : "http://placehold.it/350x150&text=FooBar8"},
			{ slideId : "slide9", imageUrl : "http://placehold.it/350x150&text=FooBar9"},
		];
		$(document).ready(function() {

			$.tmpl($("#sliderTemplate"), json).appendTo("#bxslider");
			//$.tmpl($("#popupTemplate"), json).appendTo("#homeBody");
			
			//$('#homeBody').trigger('create');
			//$(".photopopup").popup();
// 			$(".photopopup img").attr("display:block");

			$( ".cars" ).on( "click", function() {
				var target = $( this ),
					//brand = target.find( "h2" ).html(),
					brand="",
					//model = target.find( "p" ).html(),
					model="",
					short = target.attr( "id" ),
					imageUrl = $(this).children().attr("src"),
					closebtn = '<a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" data-shadow="false" data-iconshadow="false" class="ui-btn-right">Close</a>',
					//header = '<div data-role="header"><h2>' + brand + ' ' + model + '</h2></div>',
					header="",
					img = '<img src="' + imageUrl + '" alt="' + brand + '" class="photo">',
					popup = '<div data-role="popup" id="popup-' + short + '" data-short="' + short +'" data-theme="none" data-overlay-theme="a" data-corners="false" data-tolerance="15">' + closebtn + header + img + '</div>';

				// Create the popup. Trigger "pagecreate" instead of "create" because currently the framework doesn't bind the enhancement of toolbars to the "create" event (js/widgets/page.sections.js).
				$.mobile.activePage.append( popup ).trigger( "pagecreate" );
				// Wait with opening the popup until the popup image has been loaded in the DOM.
				// This ensures the popup gets the correct size and position
				$( ".photo", "#popup-" + short ).load(function() {
					var height = $( this ).height(),
						width = $( this ).width();
					// Set height and width attribute of the image
					$( this ).attr({ "height": height, "width": width });
					// Open the popup
					$( "#popup-" + short ).popup( "open" );
					// Clear the fallback
					clearTimeout( fallback );
				});
				// Fallback in case the browser doesn't fire a load event
				var fallback = setTimeout(function() {
					$( "#popup-" + short ).popup( "open" );
				}, 2000);
				
				var carousel = $('.jcarousel');

			    carousel.swipe({
			        swipeLeft: function(event, direction, distance, duration, fingerCount) {   
			            carousel.jcarousel('next');

			        },
			        swipeRight: function(event, direction, distance, duration, fingerCount) {
			            carousel.jcarousel('prev');

			        }
			    });
			});

			// Set a max-height to make large images shrink to fit the screen.
			$( document ).on( "popupbeforeposition", ".ui-popup", function() {
				// 68px: 2 * 15px for top/bottom tolerance, 38px for the header.
				var maxHeight = $( window ).height() - 68 + "px";

				$( "img.photo", this ).css( "max-height", maxHeight );
			});

			// Remove the popup after it has been closed to manage DOM size
			$( document ).on( "popupafterclose", ".ui-popup", function() {
				$( this ).remove();
			});
		});

		
	</script>
	<script type="text/javascript" src="http://sorgalla.com/jcarousel/examples/responsive/jcarousel.responsive.js"></script>
	
<div id="homeBody" role="main" class="ui-content jqm-content jqm-fullwidth">

	<!-- Photo Slider -->
	<div class="jcarousel-wrapper">
		<div class="jcarousel">
			<ul id="bxslider" class="bxslider">
			</ul>
		</div>
		<a href="#" class="jcarousel-control-prev" style="color:#FFF;">&lsaquo;</a>
		<a href="#" class="jcarousel-control-next" style="color:#FFF;">&rsaquo;</a>
	
		<p class="jcarousel-pagination"></p>
	</div>
	

	
	<div id="imagePopup">
	</div>
	
	<script id="sliderTemplate" type="text/x-jquery-tmpl">
	 	<li><a href="#" class="cars" id="\${slideId}"><img src="\${imageUrl}"></a></li>
	</script>
	
</div>
