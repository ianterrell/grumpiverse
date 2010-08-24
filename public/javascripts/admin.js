
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
  
  $(document).ready(function(){
    $('.datepicker').datepicker();
    $("textarea").each(function(){
      if ($(this).attr('id') != "tweet_tweet" && $(this).attr('class') != "seo_description")
        $(this).markItUp(mySettings);
    });  
  });
});