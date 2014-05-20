/* Date Formatter */
Date.prototype.format = function(format) { // author: meizz
	var hours = this.getHours();
    var ttime = "AM"; 
    if(/(t+)/.test(format) && hours > 12) {
        hours = hours - 12;
        ttime = "PM";
    }
	var o = {
		"M+" : this.getMonth() + 1, // month
		"d+" : this.getDate(), // day
		"h+" : hours,   //hour
		"m+" : this.getMinutes(), // minute
		"s+" : this.getSeconds(), // second
		"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
		"S"  : this.getMilliseconds(), // millisecond
		"t+" : ttime // AM/PM
	};

	if (/(y+)/.test(format))
		format = format.replace(RegExp.$1, (this.getFullYear() + "")
				.substr(4 - RegExp.$1.length));
	for (var k in o)
		if (new RegExp("(" + k + ")").test(format))
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k]
					: ("00" + o[k]).substr(("" + o[k]).length));
	return format;
};

function getDate(d, f) {
	return new Date(d).format(f);
}

function getJsonData(url, template, location){
	//$.mobile.loading("show"); // loader start
	$.ajax({
		url : url,
		dataType : 'json',
		success : function(json) {
			if(json.data == "") alert("no more data");
			$.tmpl($(template), json.data).appendTo(location);
			// loader end
		},
		error : function() {
			alert('ajax call Error');
		}
		
	}).done(function() {
		$(location).listview("refresh");
		//$.mobile.loading( "hide");
	});
}

function ajaxDelete(url, nextUrl) {
	//$.mobile.loading( "show");
	$.ajax({
		url : url,
		type : "POST",
		data : {
			"_method" : "delete"
		}, // trick for method=DELETE
		success : function() {
			window.location = nextUrl;
		},
		error : function() {
			alert('ajax call Error');
		}			
	}).done(function() {
		//$.mobile.loading( "hide");
	});
}
