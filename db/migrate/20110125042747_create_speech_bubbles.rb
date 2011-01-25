class CreateSpeechBubbles < ActiveRecord::Migration
  def self.up
    create_table :speech_bubbles do |t|
      t.integer :comic_id
      t.string :words, :limit => 1024
      t.decimal :vertical_padding, :horizontal_padding, :precision => 3, :scale => 2
      t.integer :vertical_offset, :horizontal_offset, :tip_length
      t.timestamps
    end
  end

  def self.down
    drop_table :speech_bubbles
  end
end
