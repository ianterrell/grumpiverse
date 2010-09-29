class AddRedditCategoryToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :subreddit, :string, :default => "comics"
  end

  def self.down
    remove_column :articles, :subreddit
  end
end
