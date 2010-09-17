class AddTweetIdToTweets < ActiveRecord::Migration
  def self.up
    add_column :tweets, :status_id, :string
    add_column :tweets, :in_reply_to_id, :integer
  end

  def self.down
    remove_column :tweets, :in_reply_to_id
    remove_column :tweets, :status_id
  end
end
