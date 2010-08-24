class AddExcerptsToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :long_excerpt, :text
    add_column :articles, :short_excerpt, :text
  end

  def self.down
    remove_column :articles, :short_excerpt
    remove_column :articles, :long_excerpt
  end
end
