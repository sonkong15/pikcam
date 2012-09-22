$(document).ready(function() {
	$(".my_nav li:last").addClass("linked_back");

	$(".my_nav li:last").on("click", function() {
		$("#like_pics").show();
		$("#user_pics").hide();
		$(this).removeClass("linked_back");
		$(".my_nav li:first").addClass("linked_back");
		return false;
	});
	$(".my_nav li:first").on("click", function() {
		$("#user_pics").show();
		$("#like_pics").hide();
		$(this).removeClass("linked_back");
		$(".my_nav li:last").addClass("linked_back");

		return false;
	});
});