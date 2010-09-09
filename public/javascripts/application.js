jQuery(function ($) {
  $('#mce-EMAIL').live('focus', function(){
    if ($('#mce-EMAIL').val() == 'Email Address') {
      $('#mce-EMAIL').removeClass('initial');
      $('#mce-EMAIL').val('');
    }
  });
  $('#mce-EMAIL').live('blur', function(){
    if ($('#mce-EMAIL').val() == '') {
      $('#mce-EMAIL').addClass('initial');
      $('#mce-EMAIL').val('Email Address');
    }
  });
});