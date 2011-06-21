class Ladder < ActiveRecord::Base
  has_many :games
  has_many :participations
  has_many :teams, :through => :participations
end
