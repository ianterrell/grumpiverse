class CreateGrams < ActiveRecord::Migration
  def self.up
    create_table :grams do |t|
      t.integer :character_id
      t.timestamps
    end
  end

  def self.down
    drop_table :grams
  end
end
