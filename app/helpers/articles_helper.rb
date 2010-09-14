module ArticlesHelper
  def featured_articles(limit)
    Article.published.favorite.limit(limit)
  end
end
