class MakeArticlesComics < ActiveRecord::Migration
  def self.up
    remove_column :articles, :seo_id
    remove_column :articles, :main_comic_id
    remove_column :articles, :body
    remove_column :articles, :author_type
    remove_column :articles, :favorite
    remove_column :articles, :subreddit
    rename_table :articles, :comics
    rename_table :articles_characters, :characters_comics
    rename_column :characters_comics, :article_id, :comic_id
    remove_column :characters, :twitter_handle
    remove_column :characters, :seo_id
    rename_column :characters, :description, :svg
    remove_column :characters, :cached_slug
    remove_column :characters, :avatar_file_name
    remove_column :characters, :avatar_content_type
    remove_column :characters, :avatar_file_size
    remove_column :characters, :avatar_updated_at
    remove_column :characters, :gram_file_name
    remove_column :characters, :gram_content_type
    remove_column :characters, :gram_file_size
    remove_column :characters, :gram_updated_at    
    remove_column :characters, :picture_file_name
    remove_column :characters, :picture_content_type
    remove_column :characters, :picture_file_size
    remove_column :characters, :picture_updated_at
    add_column :comics, :rendering_file_name, :string
    add_column :comics, :rendering_content_type, :string
    add_column :comics, :rendering_file_size, :integer
    add_column :comics, :rendering_updated_at, :datetime
    remove_column :characters, :short_description
    remove_column :characters, :twitter_token
    remove_column :characters, :twitter_secret
    remove_column :users, :password_salt
  end

  def self.down
    add_column :users, :password_salt, :string,                      :default => "", :null => false
    add_column :characters, :twitter_secret, :string
    add_column :characters, :twitter_token, :string
    add_column :characters, :short_description, :text
    remove_column :comics, :rendering_updated_at
    remove_column :comics, :rendering_file_size
    remove_column :comics, :rendering_content_type
    remove_column :comics, :rendering_file_name
    add_column :characters, :picture_updated_at, :datetime
    add_column :characters, :picture_file_size, :integer
    add_column :characters, :picture_content_type, :string
    add_column :characters, :picture_file_name, :string
    add_column :characters, :gram_updated_at, :datetime
    add_column :characters, :gram_file_size, :integer
    add_column :characters, :gram_content_type, :string
    add_column :characters, :gram_file_name, :string
    add_column :characters, :avatar_updated_at, :datetime
    add_column :characters, :avatar_file_size, :integer
    add_column :characters, :avatar_content_type, :string
    add_column :characters, :avatar_file_name, :string
    add_column :characters, :cached_slug, :string
    rename_column :characters, :svg, :description
    add_column :characters, :seo_id, :integer
    add_column :characters, :twitter_handle, :string
    rename_column :characters_comics, :comic_id, :article_id
    rename_table :characters_comics, :articles_characters
    rename_table :comics, :articles
    add_column :articles, :seo_id, :integer
    add_column :articles, :subreddit, :string,                    :default => "comics"
    add_column :articles, :favorite, :boolean
    add_column :articles, :author_type, :string
    add_column :articles, :body, :text
    add_column :articles, :main_comic_id, :integer
  end
end
