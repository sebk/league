class AddTypeToTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :type, :string
  end

  def self.down
    remove_column :teams, :type
  end
end
