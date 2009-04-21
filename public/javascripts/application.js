// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  if (document.referrer.search(location.hostname) < 0) {
    $("#navigation").effect('slide', {}, 500);
  } else {
    $("#navigation").show();
  }
});
