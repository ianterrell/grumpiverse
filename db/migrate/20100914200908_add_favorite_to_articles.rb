class AddFavoriteToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :favorite, :boolean
  end

  def self.down
    remove_column :articles, :favorite
  end
end
