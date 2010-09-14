xml.instruct!  
  
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc root_url
    xml.last_mod @articles.first.published_at.to_date
    xml.changefreq "daily"
    xml.priority "1.0"
  end
  xml.url do
    xml.loc cast_url
    xml.last_mod @characters.first.updated_at.to_date
    xml.changefreq "monthly"
    xml.priority "0.9"
  end
  @pages.each do |page|
    xml.url do
      xml.loc page_url(:slug => page.slug)
      xml.last_mod page.updated_at.to_date
      xml.changefreq "monthly"
      xml.priority "0.9"
    end
  end
  @characters.each do |character|
    xml.url do
      xml.loc character_url(:id => character.friendly_id)
      xml.last_mod character.updated_at.to_date
      xml.changefreq "monthly"
      xml.priority "0.8"
    end    
  end
  @articles.each do |article|
    xml.url do
      xml.loc article_url(:id => article.friendly_id)
      xml.last_mod article.updated_at.to_date
      xml.changefreq "monthly"
      xml.priority "0.5"
    end
  end
end