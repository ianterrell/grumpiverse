atom_feed do |feed|
  feed.title "The Grumpiverse"

  feed.updated @articles.first.try :published_at

  @articles.each do |article|
    feed.entry(article) do |entry|
      entry.title article.title
      
      entry.summary do
        entry.cdata!(article.render) 
      end
    end
  end
end