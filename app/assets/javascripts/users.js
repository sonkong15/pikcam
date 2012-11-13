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

	function popupCenter(url, width, height, name) {
  var left = (screen.width/2)-(width/2);
  var top = (screen.height/2)-(height/2);
  return window.open(url, name, "menubar=no,toolbar=no,status=no,width="+width+",height="+height+",toolbar=no,left="+left+",top="+top);
}

$("a.popup").click(function(e) {
  popupCenter($(this).attr("href"), $(this).attr("data-width"), $(this).attr("data-height"), "authPopup");
  e.stopPropagation(); return false;
});

});