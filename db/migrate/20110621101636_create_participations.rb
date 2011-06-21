class CreateParticipations < ActiveRecord::Migration
  def self.up
    create_table :participations do |t|
      t.integer :team_id
      t.integer :ladder_id
      t.integer :elo_score

      t.timestamps
    end
  end

  def self.down
    drop_table :participations
  end
end
