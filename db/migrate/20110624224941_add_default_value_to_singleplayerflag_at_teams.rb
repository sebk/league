class AddDefaultValueToSingleplayerflagAtTeams < ActiveRecord::Migration
  def self.up
    change_column :teams, :singleplayer, :boolean, :default => false
  end

  def self.down
  end
end
