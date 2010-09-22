atom_feed do |feed|
  feed.title "The Grumpiverse"

  feed.updated @articles.first.try :published_at

  @articles.each do |article|
    feed.entry(article, :published => article.published_at) do |entry|
      entry.title article.title
      
      entry.author do |author|
        author.name "Grumpiverse Staff"
      end
      
      entry.summary :type => "html" do
        entry.cdata!(article.render)
      end
    end
  end
end