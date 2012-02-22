class AddNameToSeason < ActiveRecord::Migration
  def self.up
    add_column :seasons, :name, :string
  end

  def self.down
    remove_column :seasons, :name
  end
end
