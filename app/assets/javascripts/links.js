$(document).ready( function(){

	$(".showmore").click( function() {
		$('html, body').animate({ scrollTop: 0 }, 'slow');
		$(".signupwithup").slideDown(1000)

	});
	$("#joinus").click( function(){
		$(".jointous").fadeIn("fast");
	});
	
	});