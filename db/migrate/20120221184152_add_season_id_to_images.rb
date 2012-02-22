class AddSeasonIdToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :season_id, :integer
  end

  def self.down
    remove_column :images, :season_id
  end
end
