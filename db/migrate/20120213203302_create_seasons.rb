class CreateSeasons < ActiveRecord::Migration

  def self.up
    create_table :seasons do |t|
      t.datetime :start_date
      t.boolean :active
      t.integer :position
      t.string :name
      t.timestamps
    end

    add_index :seasons, :id
    add_column :images, :season_id, :integer
    add_column :pages, :season_id, :integer

    Page.reset_column_information
    Image.reset_column_information

    load(Rails.root.join('db', 'seeds', 'seasons.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "seasons"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/seasons"})
    end

    drop_table :seasons
  end

end
