module ApplicationHelper
  def display_flash(*flashes)
    flashes = [:notice] if flashes.empty?
    flashes.map! do |type|
      if flash[type]
        content_tag(:div, :id => "flash-#{type}", :class => "flash #{type}") do
          link_to(image_tag("close-flash.png"), "#", :class => "close") + flash[type]
        end
      end
    end
    flashes.join.html_safe
  end
  
  def article_author_grouped_options
    [['Cast', Character.all.map{|c|[c.name, "Character:#{c.id}"]}],
     ['Crew', User.all.map{|u|[u.name, "User:#{u.id}"]}]]
  end
  
  def tweet_this(options = {})
    render :partial => "shared/tweet_this", :locals => { :text => options[:text], :url => options[:url], :options => options }
  end
  
  def fb_like(options = {})
    render :partial => "shared/facebook_like", :locals => { :href => options[:href], :options => options }
  end
  
  def sharing_phrase(object)
    phrases = ["Sharing cures the grumps.",
               "Sharing chases the Grumpalope.",
               "Sharing is caring.",
               "Sharing makes us &#x2665; you.".html_safe,
               "Sharing keeps the Grumpalupagus at bay."]
    phrases[(object.respond_to?(:id) ? object.id : rand(100)) % phrases.size]
  end
  
  def feedburner
    # TODO:  Once the site is up, sign up for Feedburner and change the url here
    # "http://feeds.feedburner.com/grumpiverse"
    feed_path(:format => :atom)
  end
end
