class ArticlePublicationJob < Struct.new(:article_id)
  def perform
    Article.find(article_id).publish!
  end
end