$(document).ready( function(){

	$(".showmore").click( function() {
		$('html, body').animate({ scrollTop: 0 }, 'slow');
		$(".signupwithup").toggle("slow");

	});
	$("#joinus").click( function(){
		$(".jointous").fadeIn("fast");
	});
	
	});