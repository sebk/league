class AddSingleplayerToLadders < ActiveRecord::Migration
  def self.up
    add_column :ladders, :singleplayer, :boolean, :default => false
  end

  def self.down
    remove_column :ladders, :singleplayer
  end
end
