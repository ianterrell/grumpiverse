class RemoveExcerptsFromArticles < ActiveRecord::Migration
  def self.up
    remove_column :articles, :short_excerpt
    remove_column :articles, :long_excerpt
  end

  def self.down
    add_column :articles, :long_excerpt, :text
    add_column :articles, :short_excerpt, :text
  end
end
