class Team < ActiveRecord::Base
  has_many :participations
  has_many :teammemberships
  has_many :users, :through => :teammemberships


  validates_presence_of :name

  def joins(ladder)
    p = self.participations.build(:ladder_id => ladder.id)
    p.save
  end

end
