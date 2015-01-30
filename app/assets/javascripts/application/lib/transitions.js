$(document).on('page:receive', function() {
  return $('#pt-main').fadeOut('fast');
});

$(document).on('page:before-change', function() {
  console.log('test');
  $('#pt-main').css('opacity', 0.2);
  $('#loader').removeClass("hidden");
});
