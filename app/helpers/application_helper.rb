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
end
