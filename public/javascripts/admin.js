jQuery(function ($) {
  $('div.flash a.close').live('click', function () {
    $(this).parent('div').fadeOut();
    return false;
  });
  
  $(".article-sidebar-comics a").live('click', function() {
    src = $(this).attr("href");
    alt = $(this).attr("data-alt");
    $.markItUp({ replaceWith:'!'+src+'('+alt+')!' });
    return false;
  });
  
  $(".article-sidebar-snippets a").live('click', function() {
    body = $(this).attr("data-body");
    $.markItUp({ replaceWith:body });
    return false;
  });
  
  $('input#comic_height').live('change', function() {
    newHeight = 20 + parseInt($(this).val());
    $('#preview-iframe').attr('height', newHeight.toString() + 'px');
  });
  
  $('form.edit_comic, form.new_comic').live('change', function() {
    $('#preview-iframe').attr('src', '/admin/comics/preview?' + $(this).serialize())
  });
  
  
  $(document).ready(function(){
    $('.datepicker').datepicker();
    $("textarea").each(function(){
      if ($(this).attr('id') != "tweet_tweet" && $(this).attr('class') != "seo_description")
        $(this).markItUp(mySettings);
    });  
  });
});