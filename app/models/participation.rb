class Participation < ActiveRecord::Base
  belongs_to :team
  belongs_to :ladder
  validates_presence_of :ladder
  validates_uniqueness_of :team_id, :scope => :ladder_id

  default_scope :order => "elo_score DESC"
  
  before_create :set_defaults
  def set_defaults
    self.elo_score = 1000
  end

end
