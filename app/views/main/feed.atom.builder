atom_feed do |feed|
  feed.title "The Grumpiverse"

  feed.updated @articles.first.try :published_at

  @articles.each do |article|
    feed.entry(article) do |entry|
      entry.title article.title
      
      entry.summary do 
        body = ""
        if article.main_comic
          body += image_tag article.main_comic.image.url(:feature)
        end
        body += article.render
        entry.cdata!(body) 
      end
    end
  end
end