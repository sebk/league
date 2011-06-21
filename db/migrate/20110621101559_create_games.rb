class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.integer :ladder_id
      t.integer :score1
      t.integer :score2

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
