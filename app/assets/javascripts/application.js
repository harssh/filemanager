// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require_self
//= require bootstrap
//= require_tree .


var fadeout, hide_elements, show_element, update_counter;

window.load(function() {
  fadeout('#notice');
  return fadeout('#alert');
});

jQuery(function() {
  $('.back_link').on('click', function(e) {
    e.preventDefault();
    return show_element('#files_and_folders');
  });
  $('.permissions_link').on('click', function(e) {
    e.preventDefault();
    return show_element('#permissions');
  });
  $('.clipboard_link').on('click', function(e) {
    e.preventDefault();
    return show_element('#clipboard');
  });
  $('.emails_to_share_with').on('change', function(e) {
    return update_counter(e.target);
  });
  return $('.emails_to_share_with').on('keyup', function(e) {
    return update_counter(e.target);
  });
});

fadeout = function(el) {
  return $(el).delay(3000).fadeOut('slow');
};

show_element = function(el) {
  var elements;
  if ($(el).is(':visible')) {
    el = '#files_and_folders';
  }
  elements = ['#files_and_folders', '#permissions', '#clipboard'];
  elements.splice(elements.indexOf(el), 1);
  hide_elements(elements);
  $(el).slideDown('slow');
  return $("" + el + "_link").removeClass('folder_menu').addClass('highlight');
};

hide_elements = function(elements) {
  var element, _i, _len, _results;
  _results = [];
  for (_i = 0, _len = elements.length; _i < _len; _i++) {
    element = elements[_i];
    if ($(element).is(':visible')) {
      $(element).slideUp('slow');
    }
    _results.push($("" + element + "_link").removeClass('highlight').addClass('folder_menu'));
  }
  return _results;
};

update_counter = function(el) {
  $('#counter').html(el.value.length);
  return $('#counter').css('color', el.value.length > 256 ? '#F00' : '#000');
};


