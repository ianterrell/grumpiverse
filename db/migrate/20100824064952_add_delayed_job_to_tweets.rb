class AddDelayedJobToTweets < ActiveRecord::Migration
  def self.up
    add_column :tweets, :delayed_job_id, :integer
    rename_column :tweets, :scheduled_for, :scheduled_for_publication_at
  end

  def self.down
    rename_column :tweets, :scheduled_for_publication_at, :scheduled_for
    remove_column :tweets, :delayed_job_id
  end
end
