class AddDefaultHeightToComics < ActiveRecord::Migration
  def self.up
    change_column_default :comics, :height, 600
  end

  def self.down
    change_column_default :comics, :height, nil
  end
end