// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  $("#q").focus(function() {
    if (!this.cleared) {
      this.value = "";
      this.cleared = true;
    }
  });
});
