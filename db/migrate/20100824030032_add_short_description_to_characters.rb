class AddShortDescriptionToCharacters < ActiveRecord::Migration
  def self.up
    add_column :characters, :short_description, :text
  end

  def self.down
    remove_column :characters, :short_description
  end
end
