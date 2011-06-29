class AddTeamnamesAndConfirmedToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :team1_name, :string
    add_column :games, :team2_name, :string
    add_column :games, :confirmed, :boolean
  end

  def self.down
    remove_column :games, :confirmed
    remove_column :games, :team2_name
    remove_column :games, :team1_name
  end
end
