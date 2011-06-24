class Game < ActiveRecord::Base
  belongs_to :team1, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :team2, :class_name => 'Team', :foreign_key => 'team2_id'
  belongs_to :ladder

  validates_presence_of :team1, :team2, :score1, :score2, :ladder
  

  after_save :calculate_elo_score, :calculate_rank

  def calculate_elo_score
    c1 = 50
    c2 = 400

    p1 = self.team1.participations.where(:ladder_id => self.ladder_id).first
    p2 = self.team2.participations.where(:ladder_id => self.ladder_id).first  

    scores = self.score1 + self.score2
    percent_wins1 = (scores == 0) ? 0 : self.score1.to_f / scores.to_f
    expected = 1 / (1 + (10**((p2.elo_score - p1.elo_score).to_f / c2.to_f).to_f).to_f)
    added1 = (c1 * (percent_wins1 - expected)).round
    added2 = added1 * (-1)
    p1.elo_score = p1.elo_score + added1
    p1.save
    p2.elo_score = p2.elo_score + added2
    p2.save
  end


  def calculate_rank
    self.ladder.calculate_rank
  end

end
