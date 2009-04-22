// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {

  /* fancyness for links */
  $("a").hover(function() {
    $(this).stop(false, true).addClass('hover', 'slow');
  }, function() {
    $(this).stop(false, true).removeClass('hover', 'slow');
  });

  /* fancyness for tweetroll */
  $("li.tweet").hover(function() {
    $(this).stop(false, true).addClass('tweet_hover', 'slow');
  }, function() {
    $(this).stop(false, true).removeClass('tweet_hover', 'slow');
  });

  /* linkify tweets */
  $("li.tweet").click(function() {
    window.location = $(this).children("a.tweetlink").get(0).href;
  });

  /* clear the default text in search box on focus */
  $("#q").focus(function() {
    if (!this.cleared) {
      this.value = "";
      this.cleared = true;
    }
  });
});
