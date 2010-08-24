class AddMainComicIdToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :main_comic_id, :integer
  end

  def self.down
    remove_column :articles, :main_comic_id
  end
end
