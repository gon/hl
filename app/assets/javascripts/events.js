$(function() {
  return $('a.show-more-button').on('inview', function(e, visible) {
    if (!visible) {
      return;
    }
    return $.getScript($(this).attr('href'));
  });
});