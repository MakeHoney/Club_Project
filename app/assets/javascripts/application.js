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
//= require_tree .


$(buttonClicked());
// Scroll reveal navbar
$(document).ready(function () {
        fixedHeader();
        new WOW().init();
        buttonClicked();
    });
    
$(window).scroll(function () {
        fixedHeader();
    });

function fixedHeader() {
        var scrolled = $(window).scrollTop();
        if (scrolled > 150) {
            $('#header').addClass('header-below');
        } else {
            $('#header').removeClass('header-below');
        }
        if (scrolled > 1) {
            $('#header').addClass('header-fixed');
        } else {
            $('#header').removeClass('header-fixed');
        }
    };
// Scroll reveal navbar End


function buttonClicked(){
    $(".nav-menu-mobile").click(function () {
        if (!($(this).hasClass('active'))) {
            $(".nav-menu-mobile").addClass('active');
            $(".nav-menu").addClass('active');
        }
        else if ($(this).hasClass('active')) {
            $(".nav-menu-mobile").removeClass('active');
            $(".nav-menu").removeClass('active');
        }
    });
};


$(function unfoldPost() {
  var actionButton = $(".material-card-action a");
  
  actionButton.on("click", function(e) {
    e.preventDefault();
    
    $(this).closest(".material-card").toggleClass("triggered");
    $(this).closest(".material-card-action").toggleClass("triggered");
    
  });
});

window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        $("#myBtn").css('display', 'block');
        // document.getElementById("myBtn").style.display = "block";
    } else {
      $("#myBtn").css('display', 'none');
        // document.getElementById("myBtn").style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0; // For Chrome, Safari and Opera 
    document.documentElement.scrollTop = 0; // For IE and Firefox
}
