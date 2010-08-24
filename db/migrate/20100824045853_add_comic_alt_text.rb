class AddComicAltText < ActiveRecord::Migration
  def self.up
    add_column :comics, :alt_text, :string
  end

  def self.down
    remove_column :comics, :alt_text
  end
end
