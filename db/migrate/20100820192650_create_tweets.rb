class CreateTweets < ActiveRecord::Migration
  def self.up
    create_table :tweets do |t|
      t.integer :character_id
      t.string :tweet
      t.datetime :scheduled_for, :tweeted_at
      t.timestamps
    end
  end

  def self.down
    drop_table :tweets
  end
end
