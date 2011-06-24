class AddBooleanSingleplayertypeToTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :singleplayer, :boolean
  end

  def self.down
    remove_column :teams, :singleplayer
  end
end
