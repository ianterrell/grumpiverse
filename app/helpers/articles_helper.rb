module ArticlesHelper
  def featured_articles
    Article.where("published_at IS NOT NULL AND favorite IS TRUE").where("published_at < ?", Time.now).order("published_at DESC").limit(8)
  end
end
