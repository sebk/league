class AddDefaultValueToConfirmedAtGames < ActiveRecord::Migration
  def self.up
    change_column :games, :confirmed, :boolean, :default => false 
  end

  def self.down
  end
end
