class AddFieldsToComics < ActiveRecord::Migration
  def self.up
    drop_table :characters_comics
    add_column :comics, :left_character_id, :integer
    add_column :comics, :right_character_id, :integer
    add_column :comics, :height, :integer
  end

  def self.down
    remove_column :comics, :height
    remove_column :comics, :right_character_id
    remove_column :comics, :left_character_id
    create_table "characters_comics", :id => false, :force => true do |t|
      t.integer "comic_id"
      t.integer "character_id"
    end
  end
end