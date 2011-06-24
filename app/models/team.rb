class Team < ActiveRecord::Base
  has_many :participations
  has_many :teammemberships
  has_many :users, :through => :teammemberships

  before_create :set_default_type

  validates_presence_of :name

  def joins(ladder)
    p = self.participations.build(:ladder_id => ladder.id)
    p.save
  end

  def set_default_type
    if self.type.nil?
      self.type = "Multiplayerteam"
    end
  end
end
