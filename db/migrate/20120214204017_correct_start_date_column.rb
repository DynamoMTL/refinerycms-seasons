class CorrectStartDateColumn < ActiveRecord::Migration
  def self.up
    rename_column :seasons, :state_date, :start_date
  end

  def self.down
  end
end
