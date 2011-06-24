class AddRankToParticipation < ActiveRecord::Migration
  def self.up
    add_column :participations, :rank, :integer
  end

  def self.down
    remove_column :participations, :rank
  end
end
