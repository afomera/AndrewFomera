// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require refile
//= require marked
//= require_tree .

$(document).on("upload:start", "form", function(e) {
  $(this).find("input[type=submit]").attr("disabled", true)
});

$(document).on("upload:complete", "form", function(e) {
  if(!$(this).find("input.uploading").length) {
    $(this).find("input[type=submit]").removeAttr("disabled")
  }
});

document.addEventListener("turbolinks:load", function() {
  // Menu for navigation
  $(".menu-icon").click(function(e) {
    e.preventDefault();
    if ($(".nav-menu").hasClass("is-open")){
      $(".nav-menu").removeClass("is-open");
    } else {
      $(".nav-menu").addClass("is-open");
    };
  })

  // Menu Timeout for Flash Alerts
  setTimeout(function() {
      $(".notice_wrapper").fadeOut("slow", function() {
          $(this).remove();
      })
  }, 5500 );
  $(".alert-close").click(function(e) {
    e.preventDefault();
    $(".notice_wrapper").remove();
  })
});
