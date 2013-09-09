
$(document).ready(function() {
	alert('running');
	$.ajax({
	    type: "GET",
	    dataType: "json",
	    url: "/ajax/tweets",
	    success: function(data){
	    	alert(data);
	    }
	});
});