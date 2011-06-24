class RemoveUnneccessaryFieldsFromUserAndTeam < ActiveRecord::Migration
  def self.up
    remove_column :teams, :user_id
    remove_column :teams, :type
  end

  def self.down
    create_column :teams, :user_id, :integer
    create_column :teams, :type, :integer
  end
end
