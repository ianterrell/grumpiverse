module Admin::BaseHelper
  def comics_to_choose_from_for_article(article)
    comics = Comic.recent.to_a
    comics |= [article.main_comic] if article.main_comic
    comics
  end
end
