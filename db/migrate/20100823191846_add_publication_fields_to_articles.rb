class AddPublicationFieldsToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :scheduled_for_publication_at, :datetime
    add_column :articles, :published_at, :datetime
    add_column :articles, :delayed_job_id, :integer
  end

  def self.down
    remove_column :articles, :delayed_job_id
    remove_column :articles, :published_at
    remove_column :articles, :scheduled_for_publication_at
  end
end
