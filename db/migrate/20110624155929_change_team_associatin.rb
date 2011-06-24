class ChangeTeamAssociatin < ActiveRecord::Migration
  def self.up
    remove_column :users, :team_id
    add_column :teams, :user_id, :integer
  end

  def self.down
    add_column :users, :team_id, :integer
    remove_column :teams, :user_id
  end
end
