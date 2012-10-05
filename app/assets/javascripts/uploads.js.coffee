# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
 $("div.upload-side input").click( ()-> 
    $(this).select();
    )
 $("div.link-up-main input").click( ()-> 
    $(this).select();
    )
 $("div.upload-side p").css({"padding-top":"5px", "font-size": "14"});
