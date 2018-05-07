// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// Scroll reveal navbar
/*global $*/
$(document).ready(function() {
    $(window).scroll(function() {
    	var screansize = $(window).scrollTop()
    	if (screansize > 150) {
    		$("#header").addClass("header-fixed")
    	} 
    	else {
    		$("#header").removeClass("header-fixed")
    	}
    });
});
// Scroll reveal navbar End
