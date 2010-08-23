
jQuery(function ($) {
  $('div.flash a.close').live('click', function () {
    $(this).parent('div').fadeOut();
    return false;
  });
  $(document).ready(function(){
    $('.datepicker').datepicker();
  });
});