class CreateCharacters < ActiveRecord::Migration
  def self.up
    create_table :characters do |t|
      t.string :name, :slug, :twitter_handle
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :characters
  end
end
