class AddSeasonIdToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :season_id, :integer
  end

  def self.down
  end
end
