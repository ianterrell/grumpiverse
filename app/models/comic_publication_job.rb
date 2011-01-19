class ComicPublicationJob < Struct.new(:comic_id)
  def perform
    Comic.find(comic_id).publish!
  end
end